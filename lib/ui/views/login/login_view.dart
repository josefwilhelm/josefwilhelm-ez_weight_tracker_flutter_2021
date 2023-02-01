import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:ez_meditation_app/app/utils.dart';
import 'package:ez_meditation_app/ui/widgets/dumb/custom_text_form_field.dart';
import 'package:ez_meditation_app/ui/widgets/dumb/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:stacked/stacked.dart';

import './login_view_model.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onModelReady: (LoginViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        LoginViewModel model,
        Widget? child,
      ) {
        return Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).login_appBarTitle),
            ),
            body: Form(
              key: model.formKey,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    child: CustomTextFormField(
                      label: S.of(context).global_email,
                      controller: model.textEditingControllerEmail,
                      validator: validateEmail,
                      textInputAction: TextInputAction.next,
                      onSuffixPressed: model.clearEmail,
                      onSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(model.passwordFocus);
                      },
                      onChanged: model.onEmailChanged,
                      hint: S.of(context).global_emailHint,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: CustomTextFormField(
                      label: S.of(context).global_password,
                      textInputAction: TextInputAction.next,
                      focusNode: model.passwordFocus,
                      onSubmitted: (_) {
                        model.onLoginPressed();
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscure: model.obscurePassword,
                      suffixIcon: _buildPasswordIcon(model),
                      onChanged: model.onPasswordChanged,
                      hint: S.of(context).global_passwordHint,
                      validator: validatePassword,
                    ),
                  ),
                  bigSpace,
                  LoadingButton(
                      isBusy: model.isBusy,
                      onPressed:
                          model.isButtonEnabled() ? model.onLoginPressed : null,
                      title: S.of(context).global_login),
                  bigSpace,
                ],
              ),
            ));
      },
    );
  }

  InkWell _buildPasswordIcon(LoginViewModel model) {
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
