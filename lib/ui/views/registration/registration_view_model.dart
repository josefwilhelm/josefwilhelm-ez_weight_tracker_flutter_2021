import 'package:ez_meditation_app/app/core/custom_base_view_model.dart';
import 'package:ez_meditation_app/app/utils.dart';
import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationViewModel extends CustomBaseViewModel {
  final formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  final passwordFocus = FocusNode();
  final emailFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();

  final TextEditingController textEditingControllerName =
      TextEditingController();
  final TextEditingController textEditingControllerEmail =
      TextEditingController();
  final TextEditingController textEditingControllerPassword =
      TextEditingController();
  final TextEditingController textEditingControllerConfirmPassword =
      TextEditingController();

  void onUsernameChanged(String name) {
    this.name = name;
    _update();
  }

  void clearUsername() {
    name = '';
    textEditingControllerName.clear();
    _update();
  }

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

  void onConfirmPasswordChanged(String confirmPassword) {
    this.confirmPassword = confirmPassword;
    _update();
  }

  void toggleObscure() {
    obscurePassword = !obscurePassword;
    _update();
  }

  void toggleObscureConfirm() {
    obscureConfirmPassword = !obscureConfirmPassword;
    _update();
  }

  void _update() {
    _validate();
    notifyListeners();
  }

  void onRegisterPressed() async {
    FocusManager.instance.primaryFocus?.unfocus();

    setBusy(true);

    await Future.delayed(Duration(seconds: 2));
    setBusy(false);
    await firebaseService
        .registerUser(
            email: email.trim(),
            password: password.trim(),
            userName: name.trim())
        .then((user) {
      if (user != null) {
        Get.back();
      }
    }).catchError((error) async {
      showSnackbar(message: error.toString());
      setBusy(false);
    });
    setBusy(false);
  }

  void _validate() {
    formKey.currentState?.validate();
  }

  String? validatePasswordConfirm(String? confirmPassword) {
    if (confirmPassword == password) {
      return null;
    } else {
      return S.current.password_doNotMatchWarning;
    }
  }

  bool isButtonEnabled() {
    return formKey.currentState?.validate() ?? false;
  }
}
