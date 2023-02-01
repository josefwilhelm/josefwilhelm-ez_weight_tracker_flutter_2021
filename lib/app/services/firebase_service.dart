import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ez_meditation_app/app/locator.dart';
import 'package:ez_meditation_app/app/models/ez_user.dart';
import 'package:ez_meditation_app/app/models/session.dart';
import 'package:ez_meditation_app/app/services/hive_service.dart';
import 'package:ez_meditation_app/app/services/session_service.dart';
import 'package:ez_meditation_app/app/utils.dart';
import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/logger.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

enum AuthProblems { UserNotFound, PasswordNotValid, NetworkError, Unknown }

class FirebaseService implements SessionService {
  final _authInstance = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;
  final _logger = getLogger('FirebaseService');
  final _analytics = FirebaseAnalytics.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final _userCollection = _firestore.collection('users');

  final _friendsSnapshots = <String, StreamSubscription<DocumentSnapshot>>{};
  final friendsStream = BehaviorSubject<Map<String, EzUser>>();
  final _friendsMap = <String, EzUser>{};

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );

  BehaviorSubject<bool> isLoggedInStream = BehaviorSubject();
  bool get isLoggedIn => firebaseUser != null;
  late User? firebaseUser;

  EzUser? ezUser;
  BehaviorSubject<EzUser?> userStream = BehaviorSubject();

  StreamSubscription? userSnapshot;

  FirebaseService() {
    _logger.i('created');

    init();
  }

  void init() async {
    _authInstance.authStateChanges().listen((firebaseUser) async {
      if (firebaseUser == null) {
        _logger.wtf('No user logged in!');
        userStream.add(null);
      }
      isLoggedInStream.add(firebaseUser != null);

      this.firebaseUser = firebaseUser;
      if (firebaseUser != null) {
        _logger.wtf('User: ${firebaseUser.uid} logged in');

        await getUserAfterLogin();
      }
    });
  }

  void updateUser(EzUser user) async {
    _logger.i('update user called: ${user.toJson()}');
    await _userCollection.doc(user.userId).set(user.toJson());
  }

  Future<void> getUserAfterLogin() async {
    _logger.i('Get User called');
    List<Session> sessions;

    try {
      sessions = getIt<HiveService>().getSessions();
      await getIt<HiveService>().clearSessions();
    } catch (e) {
      sessions = [];
    }

    userSnapshot ??=
        _userCollection.doc(firebaseUser?.uid).snapshots().listen((usr) {
      if (usr.exists) {
        ezUser = EzUser.fromJson(usr.data()!);

        userStream.add(ezUser);

        if (sessions.isNotEmpty) {
          updateUser(
              ezUser!.copyWith(sessions: ezUser!.sessions..addAll(sessions)));
          sessions.clear();
        }
        _handleFriends(ezUser);
      } else {
        _logger.i(
            'user does not exist in Firebase. Creating new entry wiht id: ${firebaseUser?.uid}');
        ezUser = EzUser(
            username: firebaseUser?.displayName,
            photoUrl: firebaseUser?.photoURL,
            userId: firebaseUser!.uid,
            sessions: sessions,
            email: firebaseUser?.email,
            created: DateTime.now());

        updateUser(ezUser!);
      }
    });
  }

  void _handleFriends(EzUser? user) {
    // final oldFriends = userStream.value?.friends ?? [];
    final currentFriends = user?.friends ?? [];
    // final identical = ListEquality().equals(oldFriends, currentFriends);

    // if (identical) return;

    // _handleRemoved(oldFriends, currentFriends);

    if (currentFriends.isEmpty) {
      friendsStream.add({});
    }

    currentFriends.forEach((element) {
      if (_friendsSnapshots[element] == null) {
        _friendsSnapshots[element] = _firestore
            .collection('users')
            .doc(element)
            .snapshots()
            .listen((friend) {
          if (friend.exists) {
            final friendUser = EzUser.fromJson(friend.data()!);
            _logger.i(
                'Get friend: ${friendUser.userId} - ${friendUser.username} ');

            _friendsMap[friendUser.userId] = friendUser;
            friendsStream.add(_friendsMap);
          }
        });
      }
    });
  }

  Future<void> googleSignIn() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return _authInstance
          .signInWithCredential(credential)
          .then(_onSuccessfulGoogleSignIn)
          .catchError((e) async {
        if (e is FirebaseAuthException) {
          if (e.code == 'credential-already-in-use') {
            await deleteUser();
            await _authInstance
                .signInWithCredential(credential)
                .then(_onSuccessfulGoogleSignIn);
          }
        } else {
          _logger.e(e);
        }
      });
    } catch (error) {
      print(error);
    }
  }

  Future<void> loginWithApple() async {
    var appleCredential;
    try {
      appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) {
        _logger.i(e);
      } else if (e.code == AuthorizationErrorCode.canceled) {
        _logger.e(e);
        Get.snackbar('Error', 'Something went wrong');
      }
    } catch (e) {
      _logger.i(e);
    }

    if (appleCredential == null) {
      return;
    }

    final oauthCredential = OAuthProvider('apple.com').credential(
      idToken: appleCredential.identityToken,
    );

    await _authInstance.signInWithCredential(oauthCredential).then((value) {
      firebaseUser = value.user!;
      _logger.i('successfully logged in with apple');
      // ignore: invalid_return_type_for_catch_error
    }).catchError(_handleAuthError);

    _logger.i('Apple Sign in: ${appleCredential.email}');
  }

  Future<void> logout() async {
    _logger.i('logout called');
    await userSnapshot?.cancel();
    userSnapshot = null;
    // _loggingIn = false;
    await _authInstance.signOut();
    firebaseUser = null;
    ezUser = null;
  }

  Future loginUser({required String email, required String password}) async {
    return _authInstance
        .signInWithEmailAndPassword(email: email, password: password)
        // ignore: invalid_return_type_for_catch_error
        .catchError(_handleAuthError);
  }

  Future<UploadTask> uploadUserProfile(File file) async {
    UploadTask uploadTask;
    final ref = _storage
        .ref()
        .child('profile_pictures')
        .child(ezUser!.userId)
        .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

    if (kIsWeb) {
      uploadTask = ref.putData(await file.readAsBytes());
    } else {
      uploadTask = ref.putFile(file);
    }
    return Future.value(uploadTask);
  }

  @override
  Future<void> clearSessions() async {
    updateUser(ezUser!.copyWith(sessions: []));
  }

  @override
  void discardLastSession() {
    if (ezUser == null) {
      _logger.e('error discarding session. ez user should not be null');
    }

    final sessions = ezUser!.sessions
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));

    sessions.removeLast();
    updateUser(ezUser!.copyWith(sessions: sessions));
    _logger.i('last session removed');
  }

  @override
  List<Session> getSessions() {
    return ezUser?.sessions ?? [];
  }

  @override
  void saveSession(Session session) {
    if (ezUser == null) {
      _logger.e('error saving session. ez user should not be null');
    } else {
      updateUser(ezUser!.copyWith(sessions: ezUser!.sessions..add(session)));
    }
  }

  @override
  void removeSession(Session session) {
    updateUser(ezUser!.copyWith(sessions: ezUser!.sessions..remove(session)));
  }

  void removeUser(String friendUserId) {
    final currentUser = userStream.value;
    if (currentUser == null) return;

    _userCollection.doc(friendUserId).update({
      'friends': FieldValue.arrayRemove([currentUser.userId])
    });

    _userCollection.doc(currentUser.userId).update({
      'friends': FieldValue.arrayRemove([friendUserId])
    });

    _removeUser(friendUserId);
  }

  // var disconnectStream;
  void disconnect() {
    // disconnectStream = userStream.listen((user) {
    // disconnectStream?.cancel();

    ezUser?.friends?.forEach((userId) {
      _logger.i('remove user as friend from: $userId');
      _userCollection.doc(userId).update({
        'friends': FieldValue.arrayRemove([ezUser?.userId]),
      });
    });

    _logger.i('reset userName and friends');

    _userCollection
        .doc(firebaseUser?.uid)
        .update({'friends': null, 'dynamicLink': null});
    // });
  }

  void logEvent(String event, {Map<String, dynamic>? parameters}) {
    _analytics.logEvent(name: event, parameters: parameters);
  }

  // var addUserStream;

  Future<void> addCommunityUser(String userId) async {
    await Future.delayed(Duration(milliseconds: 300));

    if (!isLoggedIn) {
      showSnackbar(message: S.current.community_errorNotLoggedIn);
      throw 'not logged in';
    }

    if (ezUser?.userId != userId &&
        !(ezUser?.friends?.contains(userId) ?? false)) {
      _logger.i('add friends called');
      await _userCollection.doc(userId).update({
        'friends': FieldValue.arrayUnion([ezUser?.userId])
      }).then((value) {
        _logger.i('friend: ${ezUser?.userId} added to user');
        _firestore.collection('users').doc(ezUser?.userId).update({
          'friends': FieldValue.arrayUnion([userId])
        }).then((value) {
          _logger.i('friend: $userId added to user');
          logEvent('friend_added');
        }).catchError((e) {
          showSnackbar(
              title: S.current.globalErrorNoticePrefix,
              message: S.current.community_errorNoUser);
        });
      }).catchError((e) {
        showSnackbar(
            title: S.current.globalErrorNoticePrefix,
            message: S.current.community_errorNoUser);
      });
    }
    // });
  }

  void setDynamicLink(String dynamicLink) {
    _userCollection.doc(firebaseUser?.uid).update({'dynamicLink': dynamicLink});
  }

//
  /// Helper
//

  // void _handleRemoved(List<String> oldFriends, List<String> currentFriends) {
  //   final removed = oldFriends
  //       .where((element) => !currentFriends.contains(element))
  //       .toList();

  //   removed.forEach(_removeUser);
  // }

  void _removeUser(String id) {
    _friendsSnapshots[id]?.cancel();
    _friendsSnapshots.remove(id);
    _friendsMap.remove(id);
    friendsStream.add(_friendsMap);
  }

  FutureOr<Null> _onSuccessfulGoogleSignIn(value) {
    firebaseUser = value.user!;
    _logger.i('successfully logged in with google');
  }

  Future<void> _addUserData(User? user) async {
    if (user == null) return;
    await _userCollection.doc(user.uid).set(
      {
        'userId': user.uid,
        'isAnonymous': true,
        'created': DateTime.now(),
      },
    );
  }

  Future<EzUser?> registerUser({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      final result = await _authInstance
          .createUserWithEmailAndPassword(email: email, password: password)
          .catchError((e) {
        throw _handleAuthError(e);
      });

      final ezUser = EzUser(
          username: userName,
          userId: result.user!.uid,
          email: email,
          created: DateTime.now());

      updateUser(ezUser);

      await result.user?.updateDisplayName(userName);
      _logger.i('user: $userName - ${ezUser.userId} successfully created');
      return ezUser;
    } catch (e) {
      rethrow;
    }
  }

  Future deleteUser() async {
    try {
      await _deleteUserdata(firebaseUser!);
      await firebaseUser?.delete();
    } catch (e) {
      Get.snackbar('Something went wrong', _getMessageFromErrorCode(e));
    }
  }

  void giveFeedback(String feedback, String emailAddress) {
    final data = {
      'to': 'hello@digital-snacks.at',
      'message': {
        'text': feedback,
        'subject': 'New App Feedback - From: $emailAddress',
      },
      'from': emailAddress,
      'date': DateTime.now()
    };
    _firestore.collection('feedback').doc().set(data);
    _logger.i(data);
  }

  Future<void> _deleteUserdata(User user) {
    return _userCollection.doc(user.uid).delete();
  }

  String _getMessageFromErrorCode(e) {
    switch (e?.code) {
      case 'ERROR_EMAIL_ALREADY_IN_USE':
      case 'account-exists-with-different-credential':
      case 'email-already-in-use':
        return 'Email already in use. Please use a different one or log in.';
      case 'ERROR_WRONG_PASSWORD':
      case 'wrong-password':
        return 'Wrong email/password combination.';
      case 'ERROR_USER_NOT_FOUND':
      case 'user-not-found':
        return 'No user found with this email.';
      case 'ERROR_USER_DISABLED':
      case 'user-disabled':
        return 'User disabled.';
      case 'ERROR_TOO_MANY_REQUESTS':
      case 'operation-not-allowed':
        return 'Too many requests to log into this account.';
      case 'ERROR_OPERATION_NOT_ALLOWED':
        return 'Server error, please try again later.';
      case 'ERROR_INVALID_EMAIL':
      case 'invalid-email':
        return 'Email address is invalid.';
      default:
        return 'Operation failed. Please try again.';
    }
  }

  // ignore: unused_element
  Future<void> _signInAnonymously() async {
    _logger.i('Sign user in anonymously');
    await _authInstance.signInAnonymously().then((result) async {
      if (result.user == null) return;
      _logger.i('user: ${result.user?.uid} successfully logged in!');

      firebaseUser = result.user!;

      if (result.additionalUserInfo?.isNewUser ?? false) {
        _logger.i('adding user data to anonymous user: ${result.user?.uid}');

        await _addUserData(firebaseUser);
      }

      // _firestore
      //     .collection('users')
      //     .doc(currentUser?.uid)
      //     .snapshots()
      //     .listen((doc) {
      //   ezUser = EzUser.fromJson(doc.data()!);
      //   userStream.add(ezUser);
      //   _logger.i('updated user: ${ezUser.userId}');
      // });
    });
  }

  // ignore: always_declare_return_types
  String _handleAuthError(e) {
    _logger.e('Handle error: $e');
    if (e is FirebaseAuthException) {
      throw _getMessageFromErrorCode(e);
    }
    throw 'Something went wrong';
  }
}
