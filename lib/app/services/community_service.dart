import 'package:ez_meditation_app/app/locator.dart';
import 'package:ez_meditation_app/app/models/ez_user.dart';
import 'package:ez_meditation_app/app/services/dynamic_link_service.dart';
import 'package:ez_meditation_app/app/services/firebase_service.dart';
import 'package:ez_meditation_app/app/utils.dart';
import 'package:ez_meditation_app/app/utils/logger.dart';
import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:rxdart/rxdart.dart';

class CommunityService {
  final _logger = getLogger('CommunityService');
  final _firebaseService = getIt<FirebaseService>();

  BehaviorSubject<Map<String, EzUser>> get friendsStream =>
      _firebaseService.friendsStream;

  CommunityService() {
    createDynamicLink();
  }

  void removeUser(String friendUserId) {
    _firebaseService.removeUser(friendUserId);
  }

  Future<Uri?> createDynamicLink() async {
    if (_firebaseService.ezUser != null &&
        _firebaseService.ezUser!.dynamicLink == null) {
      final user = _firebaseService.ezUser!;
      final dynamicLink =
          await getIt<DynamicLinkService>().createDynamicLink(user.userId);
      _logger.i('dynamic link: $dynamicLink');

      _firebaseService.setDynamicLink(dynamicLink.toString());

      return dynamicLink;
    }
  }

  void disconnect() {
    _firebaseService.disconnect();
  }

  void addCommunityUser(String userId) {
    _firebaseService.addCommunityUser(userId).then((value) {
      showSnackbar(
        message: S.current.community_addFriendMessage,
        type: SnackbarType.success,
      );
      _logger.wtf('asdf');
    }).catchError((e) {
      _logger.e(e);
    });
  }
}
