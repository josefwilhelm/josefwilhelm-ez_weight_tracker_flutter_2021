import 'package:ez_meditation_app/app/core/custom_base_view_model.dart';

class ProgressViewModel extends CustomBaseViewModel {
  Future<void> init() async {
    listen();
  }

  int get currentStreak => meditationService.currentStreak;
  int get maxStreak => meditationService.maxStreak;
}
