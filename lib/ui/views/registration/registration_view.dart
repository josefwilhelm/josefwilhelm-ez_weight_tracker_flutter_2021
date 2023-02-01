import 'package:ez_meditation_app/app/utils.dart';
import 'package:ez_meditation_app/constants.dart';
import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:ez_meditation_app/ui/widgets/dumb/custom_text_form_field.dart';
import 'package:ez_meditation_app/ui/widgets/dumb/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:stacked/stacked.dart';

import './registration_view_model.dart';

class RegistrationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegistrationViewModel>.reactive(
      viewModelBuilder: () => RegistrationViewModel(),
      builder: (
        BuildContext context,
        RegistrationViewModel model,
        Widget? child,
      ) {
        return Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).registration_appBarTitle),
            ),
            body: Form(
              key: model.formKey,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: CustomTextFormField(
                      label: S.of(context).global_username,
                      characterLimit: USERNAME_CHARACTER_LIMIT,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) {
                        FocusScope.of(context).requestFocus(model.emailFocus);
                      },
                      controller: model.textEditingControllerName,
                      formatters: [
                        LengthLimitingTextInputFormatter(
                            USERNAME_CHARACTER_LIMIT)
                      ],
                      validator: validateUsername,
                      onSuffixPressed: model.clearUsername,
                      onChanged: model.onUsernameChanged,
                      hint: S.of(context).global_usernameHint,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: CustomTextFormField(
                      label: S.of(context).global_email,
                      focusNode: model.emailFocus,
                      controller: model.textEditingControllerEmail,
                      validator: validateEmail,
                      onSuffixPressed: model.clearEmail,
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(model.passwordFocus);
                      },
                      onChanged: model.onEmailChanged,
                      hint: S.of(context).global_emailHint,
                    ),
                  ),
                  mediumSpace,
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: CustomTextFormField(
                      label: S.of(context).global_password,
                      textInputAction: TextInputAction.next,
                      focusNode: model.passwordFocus,
                      onSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(model.confirmPasswordFocus);
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscure: model.obscurePassword,
                      suffixIcon: _buildPasswordIcon(model),
                      onChanged: model.onPasswordChanged,
                      hint: S.of(context).global_passwordHint,
                      validator: validatePassword,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: CustomTextFormField(
                      suffixIcon: _buildPasswordIcon(model),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      focusNode: model.confirmPasswordFocus,
                      onSubmitted: (value) => model.onRegisterPressed,
                      obscure: model.obscurePassword,
                      validator: model.validatePasswordConfirm,
                      onChanged: model.onConfirmPasswordChanged,
                      hint: S.of(context).global_confirmPasswordHint,
                    ),
                  ),
                  bigSpace,
                  LoadingButton(
                      isBusy: model.isBusy,
                      onPressed: model.isButtonEnabled()
                          ? model.onRegisterPressed
                          : null,
                      title: S.of(context).globel_register),
                  bigSpace,
                ],
              ),
            ));
      },
    );
  }

  InkWell _buildPasswordIcon(RegistrationViewModel model) {
    return InkWell(
        onTap: model.toggleObscure,
        child: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Icon(
            model.obscurePassword ? SFSymbols.eye : SFSymbols.eye_slash,
            color: soot,
          ),
        ));
  }
}
