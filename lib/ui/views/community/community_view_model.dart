import 'package:ez_meditation_app/app/core/custom_base_view_model.dart';
import 'package:ez_meditation_app/app/locator.dart';
import 'package:ez_meditation_app/app/models/ez_user.dart';
import 'package:ez_meditation_app/app/models/statistics.dart';
import 'package:ez_meditation_app/app/services/community_service.dart';
import 'package:ez_meditation_app/app/utils.dart';
import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

class CommunityViewModel extends CustomBaseViewModel {
  String name = '';
  final _communityService = getIt<CommunityService>();
  List<EzUser> friends = [];

  Future<void> init() async {
    await runBusyFuture(_communityService.createDynamicLink())
        .then((value) => notifyListeners());
    await _updateFriends();
    notifyListeners();
    listen();
  }

  Future<void> _updateFriends() async {
    _communityService.friendsStream.listen((value) {
      friends.clear();
      value.values.forEach((friendStream) {
        logger.i('added friend: ${friendStream.username}');
        friends.add(friendStream);
        notifyListeners();
      });
    });
  }

  void onFriendPressed(EzUser friend) {
    // Get.to(FriendDetail(friend, this), id: 1);
  }

  void onDisconnectUserPressed(EzUser friend) async {
    _communityService.removeUser(friend.userId);
    firebaseService.logEvent('community_disconnect_user');
  }

  void onCopyPressed() {
    Clipboard.setData(ClipboardData(text: user?.dynamicLink ?? ''));
    firebaseService.logEvent('community_copy');

    showSnackbar(
      message: S.current.community_copyToClipboardMessage,
      type: SnackbarType.success,
    );
  }

  void onSharePressed() {
    firebaseService.logEvent('community_share');
    Share.share(user?.dynamicLink ?? '');
  }

  Statistics calculateStreaks(EzUser user) {
    var currentStreak = 0;
    var maxStreak = 0;
    var averageSessionLength = 0;

    final sessions = user.sessions;

    final dates = sessions.map((e) => e.dateTime).toList()
      ..sort((a, b) => a.compareTo(b));

    if (dates.isEmpty) {
      currentStreak = 0;
      maxStreak = 0;
    } else {
      currentStreak = 1;
      maxStreak = 1;
    }

    for (var i = 0; i < dates.length - 1; i++) {
      final date0 = dates[i];
      final date1 = dates[i + 1];
      if (areDatesOnSameDay(date0, date1)) {
        continue;
      } else {
        if (areDatesOnSameDay(date0.add(Duration(days: 1)), date1)) {
          currentStreak++;

          if (currentStreak > maxStreak) {
            maxStreak = currentStreak;
          }
        } else {
          currentStreak = 1;
        }
      }
    }

    final totalSessionDuration = sessions.fold(0, (int previousValue, element) {
      return previousValue + element.durationInSeconds;
    });

    if (sessions.isEmpty) {
      averageSessionLength = 0;
    } else {
      averageSessionLength = totalSessionDuration ~/ sessions.length;
    }

    return Statistics(
        maxStreak: maxStreak,
        currentStreak: currentStreak,
        averageSession: averageSessionLength);
  }
}
