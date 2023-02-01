import 'package:ez_meditation_app/app/core/custom_base_view_model.dart';
import 'package:ez_meditation_app/app/locator.dart';
import 'package:ez_meditation_app/app/services/firebase_service.dart';
import 'package:ez_meditation_app/ui/views/login/login_view.dart';
import 'package:ez_meditation_app/ui/views/registration/registration_view.dart';
import 'package:get/get.dart';

class AuthenticationViewModel extends CustomBaseViewModel {
  final _auth = getIt<FirebaseService>();

  Future<void> onLoginPressed() async {
    await Get.to(() => LoginView());
    Get.back();
  }

  Future<void> onRegisterPressed() async {
    await Get.to(() => RegistrationView());
    Get.back();
  }

  Future<void> onAppleLoginPressed() async {
    await _auth.loginWithApple();
    Get.back();
  }

  Future<void> onGoogleLoginPressed() async {
    await _auth.googleSignIn();
    Get.back();
  }
}
