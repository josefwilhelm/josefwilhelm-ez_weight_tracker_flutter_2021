import 'package:ez_meditation_app/ui/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const String HomeRoute = '/home';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return GetPageRoute(
          settings: settings,
          page: () => HomeView(),
        );
      default:
        return GetPageRoute(
            settings: settings,
            page: () => Scaffold(
                  appBar: AppBar(),
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
