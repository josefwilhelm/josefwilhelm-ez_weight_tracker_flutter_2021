import 'package:ez_meditation_app/app/locator.dart';
import 'package:ez_meditation_app/app/services/firebase_service.dart';
import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:ez_meditation_app/ui/widgets/dumb/custom_text_form_field.dart';
import 'package:ez_meditation_app/ui/widgets/dumb/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackDialog extends StatelessWidget {
  final _emailController = TextEditingController();
  final _feedbackController = TextEditingController();

  FeedbackDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).feedback_dialogTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 30),
        child: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            mediumSpace,
            Container(
              width: double.infinity,
              child: CustomTextFormField(
                controller: _emailController,
                label: S.of(context).feedback_dialogEmailLabel,
                labelStyle: title4,
                showSuffix: false,
              ),
            ),
            mediumSpace,
            CustomTextFormField(
              controller: _feedbackController,
              label: S.of(context).feedback_dialogFeedbackLabel,
              labelStyle: title4,
              showSuffix: false,
              maxLines: 10,
            ),
            bigSpace,
            PrimaryButton(
                onPressed: () {
                  getIt<FirebaseService>().giveFeedback(
                      _feedbackController.text, _emailController.text);
                  Get.back(result: true);
                },
                title: S.of(context).feedback_dialogPrimaryButton)
          ],
        ),
      ),
    );
  }
}
