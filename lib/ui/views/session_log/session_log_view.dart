import 'package:duration_picker/duration_picker.dart';
import 'package:ez_meditation_app/app/models/session.dart';
import 'package:ez_meditation_app/app/utils.dart';
import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:stacked/stacked.dart';

import './session_log_view_model.dart';

class SessionLogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SessionLogViewModel>.reactive(
      viewModelBuilder: () => SessionLogViewModel(),
      onModelReady: (SessionLogViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        SessionLogViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).sessionLog_appBarTitle),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Builder(
              builder: (context) => Theme(
                data: ThemeData(
                  accentColor: jetBlack,
                  primaryColor: jetBlack,
                  buttonColor: jetBlack,
                  buttonTheme: ButtonThemeData(
                    buttonColor: jetBlack,
                  ),
                  textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                    primary: jetBlack,
                  )),
                  buttonBarTheme: ButtonBarThemeData(
                    buttonTextTheme: ButtonTextTheme.primary,
                  ),
                ),
                child: Builder(
                  builder: (context) => FloatingActionButton(
                    onPressed: () async {
                      final time = await showDurationPicker(
                        context: context,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: fog,
                        ),
                        initialTime: Duration(minutes: 10),
                      );
                      await model.onAddSessionPressed(time);
                    },
                    backgroundColor: jetBlack,
                    child: Icon(
                      SFSymbols.plus,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: ListView.separated(
            itemCount: model.sessions.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 12),
            physics: BouncingScrollPhysics(),
            separatorBuilder: (_, __) => Container(
              height: 0.05,
              color: jetBlack,
            ),
            itemBuilder: (BuildContext context, int index) {
              var session = model.sessions[index];
              return Dismissible(
                onDismissed: (direction) => model.onDismissed(session),
                background: Container(
                  color: Colors.red,
                ),
                key: Key(session.toString()),
                child: ListTile(
                    // onTap: () => model.onSessionPressed(sound, index),
                    tileColor: Colors.white,
                    title:
                        Text(prettySessionDuration(session.durationInSeconds)),
                    subtitle: session.sessionType == null
                        ? Container()
                        : Text(session.sessionType!.translation),
                    trailing: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(formatDate(session.dateTime)),
                    )),
              );
            },
          ),
        );
      },
    );
  }
}
