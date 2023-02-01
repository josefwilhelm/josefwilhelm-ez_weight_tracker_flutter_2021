import 'dart:async';

import 'package:ez_meditation_app/app/locator.dart';
import 'package:ez_meditation_app/app/router.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:ez_meditation_app/ui/views/home/home_view.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white));

  setupLocator();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'EZ - Meditation App',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // supportedLocales: S.delegate.supportedLocales,
        onGenerateRoute: CustomRouter.generateRoute,
        theme: ThemeData(
          primaryTextTheme: Theme.of(context).textTheme.apply(
                bodyColor: jetBlack,
                fontFamily: 'SF-Pro',
                displayColor: jetBlack,
              ),
          scaffoldBackgroundColor: fog,
          primaryColorLight: jetBlack,
          // primarySwatch: Colors.grey,
          colorScheme: ColorScheme.light(primary: jetBlack),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            primary: jetBlack,
          )),
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: turkish, selectionColor: turkish.withOpacity(0.5)),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0.2,
          ),
          primaryColor: fog,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: jetBlack,
                fontFamily: 'SF-Pro',
                displayColor: jetBlack,
              ),
        ),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
        home: HomeView());
  }
}
