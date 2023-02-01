import 'dart:async';

import 'package:ez_meditation_app/app/models/ez_user.dart';
import 'package:ez_meditation_app/app/models/session.dart';
import 'package:ez_meditation_app/app/services/meditation_service.dart';
import 'package:ez_meditation_app/app/services/sound_service.dart';
import 'package:ez_meditation_app/app/services/storage_service.dart';
import 'package:ez_meditation_app/app/services/firebase_service.dart';
import 'package:ez_meditation_app/app/utils/logger.dart';
import 'package:ez_meditation_app/app/locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

abstract class CustomBaseViewModel extends BaseViewModel {
  final storage = getIt<StorageService>();
  final firebaseService = getIt<FirebaseService>();
  final meditationService = getIt<MeditationService>();
  final soundService = getIt<SoundService>();
  var logger;

  EzUser? get user => firebaseService.ezUser;

  StreamSubscription? _streamSubscription;
  StreamSubscription? _streamSubscriptionLoggedIn;

  void listen() {
    _streamSubscriptionLoggedIn =
        firebaseService.isLoggedInStream.listen((value) {
      // sometimes Firebase is not quick enough
      Future.delayed(Duration(milliseconds: 300));
      notifyListeners();
    });

    _streamSubscription = firebaseService.userStream.listen((value) {
      // sometimes Firebase is not quick enough
      Future.delayed(Duration(milliseconds: 300));
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _streamSubscriptionLoggedIn?.cancel();
    super.dispose();
  }

  List<Session> get sessions => meditationService.sessions
    ..sort((a, b) => b.dateTime.compareTo(a.dateTime));

  CustomBaseViewModel() {
    logger = getLogger(runtimeType.toString());
    logger.i('created');
  }
  void goBack() {
    Get.back();
  }

  void removeFocus() {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}
