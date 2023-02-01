import 'package:ez_meditation_app/app/models/session.dart';
import 'package:ez_meditation_app/app/services/session_service.dart';
import 'package:ez_meditation_app/app/utils/logger.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/subjects.dart';

class HiveService implements SessionService {
  final _logger = getLogger('HiveService');
  late Box<Session> sessionBox;
  final String sessionBoxName = 'sessionBox';

  BehaviorSubject<bool> initDone = BehaviorSubject()..add(false);

  HiveService() {
    _logger.i('created');

    init();
  }

  Future<void> init() async {
    Hive.registerAdapter(SessionAdapter());
    Hive.registerAdapter(SessionTypeAdapter());

    await Hive.initFlutter();
    sessionBox = await Hive.openBox(sessionBoxName);
    initDone.add(true);
    _logger.i('initDone');
  }

  @override
  Future<void> saveSession(Session session) async {
    await sessionBox.put(session.dateTime.toIso8601String(), session);
    getSessions().forEach((element) {
      _logger.wtf(element.dateTime);
    });

    _logger.i(
        'save session - ${session.dateTime.toIso8601String()} - ${session.durationInSeconds}');
  }

  @override
  List<Session> getSessions() {
    try {
      return sessionBox.values.toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> clearSessions() async {
    await sessionBox.clear();
  }

  @override
  void discardLastSession() {
    final sessions = getSessions()
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));

    sessions.removeLast();
    _logger.i('last session removed');
  }

  @override
  void removeSession(Session session) {
    sessionBox.delete(session.dateTime.toIso8601String());
    _logger.i(' session: ${session.toJson()} removed');
  }
}
