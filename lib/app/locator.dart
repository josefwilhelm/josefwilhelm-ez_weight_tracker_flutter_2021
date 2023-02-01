import 'package:ez_meditation_app/app/services/community_service.dart';
import 'package:ez_meditation_app/app/services/dynamic_link_service.dart';
import 'package:ez_meditation_app/app/services/hive_service.dart';
import 'package:ez_meditation_app/app/services/meditation_service.dart';
import 'package:ez_meditation_app/app/services/sound_service.dart';
import 'package:ez_meditation_app/app/services/storage_service.dart';
import 'package:ez_meditation_app/app/services/firebase_service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton(StorageService());
  getIt.registerSingleton(HiveService());
  getIt.registerSingleton(FirebaseService());
  getIt.registerSingleton(SoundService());
  getIt.registerSingleton(MeditationService());
  getIt.registerSingleton(CommunityService());
  getIt.registerSingleton(DynamicLinkService());
}
