import 'package:ez_meditation_app/app/core/custom_base_view_model.dart';
import 'package:ez_meditation_app/app/services/firebase_service.dart';
import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/app/locator.dart';
import 'package:ez_meditation_app/app/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel extends CustomBaseViewModel {
  final formKey = GlobalKey<FormState>();
  final _authService = getIt<FirebaseService>();

  String email = '';
  String password = '';

  bool obscurePassword = true;

  Future<void> init() async {}

  final passwordFocus = FocusNode();

  final TextEditingController textEditingControllerEmail =
      TextEditingController();
  final TextEditingController textEditingControllerPassword =
      TextEditingController();

  void onEmailChanged(String email) {
    this.email = email;
    _update();
  }

  void clearEmail() {
    email = '';
    textEditingControllerEmail.clear();
    _update();
  }

  void onPasswordChanged(String password) {
    this.password = password;
    _update();
  }

  void toggleObscure() {
    obscurePassword = !obscurePassword;
    _update();
  }

  bool isButtonEnabled() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<void> onLoginPressed() async {
    FocusManager.instance.primaryFocus?.unfocus();

    setBusy(true);

    await Future.delayed(Duration(seconds: 2));
    setBusy(false);
    await _authService
        .loginUser(
      email: email.trim(),
      password: password.trim(),
    )
        .then((_) {
      Get.back();
      setBusy(false);
    }).catchError((error) {
      showSnackbar(message: error);
      setBusy(false);
    });
    setBusy(false);
  }

  void _update() {
    _validate();
    notifyListeners();
  }

  void _validate() {
    formKey.currentState?.validate();
  }
}
