import 'dart:async';

import 'package:ez_meditation_app/app/locator.dart';
import 'package:ez_meditation_app/app/models/session.dart';
import 'package:ez_meditation_app/app/services/firebase_service.dart';
import 'package:ez_meditation_app/app/services/hive_service.dart';
import 'package:ez_meditation_app/app/services/session_service.dart';
import 'package:ez_meditation_app/app/utils.dart';
import 'package:ez_meditation_app/app/utils/logger.dart';

class MeditationService {
  final _logger = getLogger('MeditationService');
  final _hiveService = getIt<HiveService>();
  final _firebaseService = getIt<FirebaseService>();
  late SessionService _sessionService;

  var currentStreak = 0;
  var maxStreak = 0;
  var averageSessionLength = 0;
  Session? lastSession;

  List<Session> get sessions => _sessionService.getSessions();
  var _isLoggedIn = false;

  MeditationService() {
    _logger.i('created');

    _firebaseService.isLoggedInStream.listen((value) async {
      if (value) {
        _isLoggedIn = true;
        _sessionService = _firebaseService;
        _logger.i('sessionService = FirebaseService');
        await Future.delayed(Duration(seconds: 1));
        calculate();
      } else {
        _isLoggedIn = false;

        _sessionService = _hiveService;
        _logger.i('sessionService = HiveService');
      }
    });

    _firebaseService.userStream.listen((value) {
      if (value != null) {
        // sometimes Firebase is not quick enough
        Future.delayed(Duration(milliseconds: 300));
        calculate();
      }
    });

    _hiveService.initDone.listen((value) {
      if (value && !_isLoggedIn) {
        _sessionService = _hiveService;
        _logger.i('sessionService = HiveService');
        calculate();

        _hiveService.sessionBox.watch().listen((event) {
          calculate();
        });
      }
    });
  }

  void saveSession(int durationInSeconds,
      {DateTime? date, SessionType sessionType = SessionType.timer}) {
    _logger.i(
        'session ended - duration: ${prettySessionDuration(durationInSeconds)}');

    lastSession = Session(
      dateTime: date ?? DateTime.now(),
      sessionType: sessionType,
      durationInSeconds: durationInSeconds,
    );

    _sessionService.saveSession(
      lastSession!,
    );

    calculate();
  }

  void _calculateStreaks() {
    final dates = sessions.map((e) => e.dateTime).toList()
      ..sort((a, b) => a.compareTo(b));

    currentStreak = 1;
    maxStreak = 1;

    for (var i = 0; i < dates.length - 1; i++) {
      final date0 = dates[i];
      final date1 = dates[i + 1];
      // _logger.i('\n\n');
      // _logger.i('----------------------');
      // _logger.i('--------- start ----------');
      // _logger.i('------- i=$i - dates length= ${dates.length} ---------------');
      // _logger.i('\n');

      // _logger.i('date0: $date0');
      // _logger.i('date1: $date1');

      if (areDatesOnSameDay(date0, date1)) {
        continue;
      } else {
        if (areDatesOnSameDay(date0.add(Duration(days: 1)), date1)) {
          currentStreak++;

          if (currentStreak >= maxStreak) {
            maxStreak = currentStreak;
          }
          // _logger.i('continous days');
          // _print();
        } else if (date1.isToday()) {
          if (currentStreak > maxStreak) {
            maxStreak = currentStreak;
          }
          currentStreak = 1;
          // _logger.i('+++++++++++++ is today: $currentStreak+++++++++++++++++');
          // _print();
        } else {
          if (currentStreak > maxStreak) {
            maxStreak = currentStreak;
          }
          currentStreak = 1;
          // _logger.i('else');
          // _print();
        }
      }
    }

    if (dates.isEmpty) {
      currentStreak = 0;
      maxStreak = 0;
    } else if (dates.length == 1) {
      if (dates.first.isToday()) {
        currentStreak = 1;
      } else {
        currentStreak = 0;
      }
    } else if (dates.where((element) => element.isToday()).isEmpty) {
      currentStreak = 0;
    }

    // _logger.i('----------------------');
    // _logger.i('--------- end ----------');
    // _logger.i('----------------------');
  }

  _print() {
    _logger.i('maxStreak: $maxStreak');
    _logger.i('currentStreak: $currentStreak');
  }

  void clearMeditationData() async {
    _logger.i('clearMeditationData called');
    currentStreak = 0;
    maxStreak = 0;
    averageSessionLength = 0;
    await _sessionService.clearSessions();
  }

  void discardLastSession() {
    if (lastSession != null) {
      _sessionService.removeSession(lastSession!);
    }
  }

  void _calculateAverageSessionLength() {
    final totalSessionDuration = sessions.fold(0, (int previousValue, element) {
      return previousValue + element.durationInSeconds;
    });

    if (sessions.isEmpty) {
      averageSessionLength = 0;
    } else {
      averageSessionLength = totalSessionDuration ~/ sessions.length;
    }

    _logger.i('session average: $averageSessionLength');
  }

  void calculate() {
    _calculateStreaks();
    _calculateAverageSessionLength();
  }

  void removeSession(Session session) {
    _sessionService.removeSession(session);
  }
}

extension DateHelpers on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }
}
