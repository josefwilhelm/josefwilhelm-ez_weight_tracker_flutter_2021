import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:ez_meditation_app/ui/widgets/dumb/custom_action_button.dart';
import 'package:ez_meditation_app/ui/widgets/dumb/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:stacked/stacked.dart';

import 'community_view_model.dart';

class FriendsOverviewView extends ViewModelWidget<CommunityViewModel> {
  const FriendsOverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CommunityViewModel model) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        _buildUserWidget(model, context),
        _buildFriendsWidget(model, context),
      ],
    );
  }

  Widget _buildUserWidget(CommunityViewModel model, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                model.user?.username ??
                    S.of(context).profile_usernamePlaceholder,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: title2,
              ),
              smallSpace,
              Text(
                S.of(context).community_linkHeader,
              ),
              smallSpace,
              Text(
                model.user?.dynamicLink?.toString() ?? '',
                style: caption2.copyWith(fontWeight: FontWeight.w500),
              ),
              smallSpace,
              Row(
                children: <Widget>[
                  CustomActionButton(
                    // text: S.of(context).globalCopy,
                    iconData: SFSymbols.doc_on_doc,
                    onPress: model.onCopyPressed,
                  ),
                  CustomActionButton(
                    // text: S.of(context).globalCopy,
                    iconData: SFSymbols.square_arrow_up,
                    onPress: model.onSharePressed,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFriendsWidget(CommunityViewModel model, BuildContext context) {
    return model.friends.isEmpty
        ? Center(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/ic_not_amused.png',
                  width: 200,
                ),
                Text('Much empty', style: title3),
                Text('so wow', style: title3),
              ],
            ),
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 24, 12, 4),
                child: Text(S.of(context).community_friendsCardsTitle,
                    style: title3),
              ),
              ListView.builder(
                itemCount: model.friends.length,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(bottom: 40),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final friend = model.friends[index];
                  final statistics = model.calculateStreaks(friend);
                  return FocusedMenuHolder(
                    menuWidth: MediaQuery.of(context).size.width * 0.50,
                    duration: Duration(milliseconds: 100),
                    animateMenuItems: true,
                    menuItems: <FocusedMenuItem>[
                      // Add Each FocusedMenuItem  for Menu Options
                      FocusedMenuItem(
                          title:
                              Text(S.of(context).community_deleteFriendsButton),
                          trailingIcon: Icon(SFSymbols.trash),
                          onPressed: () =>
                              model.onDisconnectUserPressed(friend)),
                    ],
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 3),
                      child: Card(
                        child: Column(
                          children: [
                            smallSpace,
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 8, 12, 10),
                                  child: ProfileImageWidget(
                                    photoUrl: friend.photoUrl,
                                    radius: 25,
                                  ),
                                ),
                                smallSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      friend.username ??
                                          S
                                              .of(context)
                                              .profile_usernamePlaceholder,
                                      style: title3,
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      friend.codeName ??
                                          S
                                              .of(context)
                                              .profile_subtitlePlaceholder,
                                      style: body,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12, 5, 12, 8),
                              child: Container(
                                height: 1,
                                color: turkish,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: GridView.count(
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.all(8),
                                crossAxisCount: 2,
                                childAspectRatio: 10 / 4,
                                crossAxisSpacing: 3,
                                mainAxisSpacing: 4,
                                shrinkWrap: true,
                                children: [
                                  _FriendProgressCard(
                                    unit: Text(S
                                        .of(context)
                                        .daysCount(statistics.currentStreak)),
                                    count: statistics.currentStreak.toString(),
                                    label: S.of(context).progress_currentStreak,
                                  ),
                                  _FriendProgressCard(
                                    unit: Text(S
                                        .of(context)
                                        .daysCount(statistics.maxStreak)),
                                    count: statistics.maxStreak.toString(),
                                    label: S.of(context).progress_maxStreak,
                                  ),
                                  _FriendProgressCard(
                                    unit: Text(''),
                                    count: friend.sessions.length.toString(),
                                    label: S.of(context).progress_totalSessions,
                                  ),
                                  _FriendProgressCard(
                                    unit: Text(S.of(context).minutesCount(
                                        statistics.averageSession ~/ 60)),
                                    count: (statistics.averageSession ~/ 60)
                                        .toString(),
                                    label:
                                        S.of(context).progress_averageSession,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
    // if (model.fr)
  }
}

class _FriendProgressCard extends StatelessWidget {
  final String label;
  final String count;
  final Widget unit;

  const _FriendProgressCard({
    Key? key,
    required this.label,
    required this.count,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: title4.copyWith(fontWeight: FontWeight.w600),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Text(
                count,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: unit,
            ),
          ],
        ),
      ],
    );
  }
}
