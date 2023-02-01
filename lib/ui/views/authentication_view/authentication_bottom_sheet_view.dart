import 'dart:io';

import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:ez_meditation_app/ui/widgets/dumb/primary_button.dart';
import 'package:ez_meditation_app/ui/widgets/dumb/rounded_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:stacked/stacked.dart';

import 'authentication_bottom_sheet_view_model.dart';

class AuthenticationBottomSheetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthenticationViewModel>.reactive(
      viewModelBuilder: () => AuthenticationViewModel(),
      builder: (
        BuildContext context,
        AuthenticationViewModel model,
        Widget? child,
      ) {
        return RoundedBottomSheet(
            title: S.of(context).authenticationSheet_title,
            content: Column(
              children: <Widget>[
                PrimaryButton(
                  onPressed: model.onLoginPressed,
                  title: S.of(context).global_login,
                ),
                smallSpace,
                PrimaryButton(
                  onPressed: model.onRegisterPressed,
                  title: S.of(context).globel_register,
                  color: turkish,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child:
                      Text(S.of(context).authenticationSheet_socialMediaTitle),
                ),
                if (Platform.isIOS)
                  Padding(
                    padding: defaultButtonPadding,
                    child: SignInWithAppleButton(
                      onPressed: model.onAppleLoginPressed,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Container(
                    width: double.maxFinite,
                    child: ElevatedButton.icon(
                      onPressed: model.onGoogleLoginPressed,
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/ic_google.png',
                          width: 24,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      label: Text(
                        S.of(context).authenticationSheet_googleButton,
                        style: title4,
                      ),
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }
}
