import 'package:ez_meditation_app/app/models/session.dart';
import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:ez_meditation_app/ui/views/community/community_view.dart';
import 'package:ez_meditation_app/ui/views/progress/progress_view.dart';
import 'package:ez_meditation_app/ui/widgets/dumb/primary_button.dart';
import 'package:ez_meditation_app/ui/widgets/dumb/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';

import './profile_view_model.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      onModelReady: (model) => model.init(),
      builder: (
        BuildContext context,
        ProfileViewModel model,
        Widget? child,
      ) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(80),
                child: AppBar(
                    bottom: TabBar(
                  indicatorColor: jetBlack,
                  tabs: [
                    Tab(text: S.of(context).profile_profileTabTitle),
                    Tab(text: S.of(context).profile_communityTabTitle),
                  ],
                )),
              ),
              body: TabBarView(
                children: [
                  ProfileContent(),
                  CommunityView(),
                ],
              )),
        );
      },
    );
  }
}

class ProfileContent extends ViewModelWidget<ProfileViewModel> {
  @override
  Widget build(BuildContext context, ProfileViewModel model) {
    return ListView(
      padding: EdgeInsets.only(bottom: 40),
      physics: BouncingScrollPhysics(),
      children: [
        _buildHeaderCard(context, model),
        ProgressView(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TableCalendar<Session>(
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                eventLoader: model.getEventsForDay,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                availableGestures: AvailableGestures.none,
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  markerMargin: EdgeInsets.only(right: 0.5, left: 0.5),
                  todayDecoration: BoxDecoration(
                    color: puter,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
        PrimaryButton(
            onPressed: model.onLogSessionPressed,
            title: S.of(context).profile_sessionLogButton)
      ],
    );
  }

  Widget _buildHeaderCard(BuildContext context, ProfileViewModel model) {
    final user = model.user;

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ProfileImageWidget(
                photoUrl: model.getProfileUrl,
              ),
              smallSpace,
              Text(
                user?.username ?? S.of(context).profile_usernamePlaceholder,
                style: title2,
              ),
              SizedBox(height: 2),
              Text(
                user?.codeName ?? S.of(context).profile_subtitlePlaceholder,
                style: body,
              ),
              smallSpace,
              model.isUserLoggedIn
                  ? TextButton.icon(
                      onPressed: model.onEditPressed,
                      style: TextButton.styleFrom(primary: jetBlack),
                      icon: Icon(
                        SFSymbols.pencil,
                        size: 20,
                      ),
                      label: Text(
                        S.of(context).global_edit,
                        style: title4,
                      ))
                  : model.busy('login')
                      ? CircularProgressIndicator()
                      : PrimaryButton(
                          onPressed: model.onLoginPressed,
                          title: S.of(context).global_login,
                          width: MediaQuery.of(context).size.width / 2,
                        )
            ],
          ),
        ),
      ),
    );
  }
}
