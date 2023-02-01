import 'package:ez_meditation_app/app/locator.dart';
import 'package:ez_meditation_app/app/models/session.dart';
import 'package:ez_meditation_app/app/services/meditation_service.dart';
import 'package:ez_meditation_app/app/services/sound_service.dart';
import 'package:ez_meditation_app/app/utils.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DebugMenu extends StatelessWidget {
  final _meditationService = getIt<MeditationService>();
  final _soundService = getIt<SoundService>();

  DebugMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Debug menu',
                style: title1,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text('Add session'),
                  onTap: () {
                    final dateTime = DateTime.now();
                    _meditationService.saveSession(400, date: dateTime);
                    Get.back();
                    showSnackbar(
                        type: SnackbarType.success,
                        message: 'session added at: $dateTime');
                  },
                ),
                ListTile(
                  title: Text('success snackbar'),
                  onTap: () {
                    Get.back();
                    showSnackbar(
                        type: SnackbarType.success,
                        message: 'success doing something');
                  },
                ),
                ListTile(
                  title: Text('info snackbar'),
                  onTap: () {
                    Get.back();
                    showSnackbar(message: 'info  something');
                  },
                ),
                ListTile(
                  title: Text('Add a bunch of sessions'),
                  onTap: () {
                    sessionDummyData.forEach((element) {
                      _meditationService.saveSession(element.durationInSeconds,
                          date: element.dateTime);
                    });
                    Get.back();

                    showSnackbar(
                        title: 'Added',
                        message: '${sessionDummyData.length} sessions added');
                  },
                ),
                ListTile(
                  title: Text('Clear all sessions'),
                  onTap: () {
                    _meditationService.clearMeditationData();
                    Get.back();
                    showSnackbar(
                        title: 'Cleared', message: 'All sessions cleared');
                  },
                ),
                ListTile(
                  title: Text('Play ending bell'),
                  onTap: () {
                    _soundService.playEndingBell();
                    Get.back();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final sessionDummyData = [
  Session(
    dateTime: DateTime.now().subtract(Duration(days: 0)),
    sessionType: SessionType.session_log,
    durationInSeconds: 20,
  ),
  Session(
    dateTime: DateTime.now().subtract(Duration(days: 1)),
    sessionType: SessionType.session_log,
    durationInSeconds: 400,
  ),
  Session(
    sessionType: SessionType.session_log,
    dateTime: DateTime.now().subtract(Duration(days: 2)),
    durationInSeconds: 300,
  ),
  Session(
    dateTime: DateTime.now().subtract(Duration(days: 3)),
    sessionType: SessionType.session_log,
    durationInSeconds: 330,
  ),
  Session(
    dateTime: DateTime.now().subtract(Duration(days: 5)),
    sessionType: SessionType.session_log,
    durationInSeconds: 120,
  ),
  Session(
    dateTime: DateTime.now().subtract(Duration(days: 6)),
    sessionType: SessionType.session_log,
    durationInSeconds: 550,
  ),
  Session(
    dateTime: DateTime.now().subtract(Duration(days: 7)),
    sessionType: SessionType.session_log,
    durationInSeconds: 4050,
  ),
  Session(
    sessionType: SessionType.session_log,
    dateTime: DateTime.now().subtract(Duration(days: 8)),
    durationInSeconds: 434,
  ),
  Session(
    sessionType: SessionType.session_log,
    dateTime: DateTime.now().subtract(Duration(days: 9)),
    durationInSeconds: 600,
  ),
  Session(
    sessionType: SessionType.session_log,
    dateTime: DateTime.now().subtract(Duration(days: 10)),
    durationInSeconds: 600,
  ),
  Session(
    sessionType: SessionType.session_log,
    dateTime: DateTime.now().subtract(Duration(days: 11)),
    durationInSeconds: 600,
  ),
  Session(
    sessionType: SessionType.session_log,
    dateTime: DateTime.now().subtract(Duration(days: 22)),
    durationInSeconds: 600,
  ),
  Session(
    sessionType: SessionType.session_log,
    dateTime: DateTime.now().subtract(Duration(days: 23)),
    durationInSeconds: 600,
  ),
  Session(
    sessionType: SessionType.session_log,
    dateTime: DateTime.now().subtract(Duration(days: 33)),
    durationInSeconds: 600,
  ),
  Session(
    sessionType: SessionType.session_log,
    dateTime: DateTime.now().subtract(Duration(days: 39)),
    durationInSeconds: 400,
  ),
];
