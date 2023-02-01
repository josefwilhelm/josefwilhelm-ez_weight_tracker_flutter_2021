import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:ez_meditation_app/ui/views/community/community_view_model.dart';
import 'package:ez_meditation_app/ui/views/community/friends_overview_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CommunityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CommunityViewModel>.reactive(
      viewModelBuilder: () => CommunityViewModel(),
      onModelReady: (model) => model.init(),
      builder: (
        BuildContext context,
        CommunityViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: model.user == null
              ? _buildNotAvailable(context, model)
              : FriendsOverviewView(),
        );
      },
    );
  }

  Widget _buildNotAvailable(BuildContext context, CommunityViewModel model) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 80, 20, 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            S.of(context).community_loggedOutText1,
            textAlign: TextAlign.center,
            style: title3,
          ),
          Image.asset(
            'assets/ic_rolling_eyes.png',
            width: MediaQuery.of(context).size.width * .5,
          ),
          Text(
            S.of(context).community_loggedOutText2,
            textAlign: TextAlign.center,
            style: title3,
          )
        ],
      ),
    );
  }
}
