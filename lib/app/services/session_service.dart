import 'package:ez_meditation_app/app/models/session.dart';

abstract class SessionService {
  void saveSession(Session session);

  List<Session> getSessions();

  Future<void> clearSessions();

  void discardLastSession();

  void removeSession(Session session);
}
