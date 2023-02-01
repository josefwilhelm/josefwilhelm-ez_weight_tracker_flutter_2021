import 'package:ez_meditation_app/app/codenames.dart';
import 'package:ez_meditation_app/app/utils.dart';
import 'package:ez_meditation_app/constants.dart';
import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:ez_meditation_app/ui/widgets/dumb/custom_text_form_field.dart';
import 'package:ez_meditation_app/ui/widgets/dumb/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import './edit_profile_view_model.dart';

class EditProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditProfileViewModel>.reactive(
      viewModelBuilder: () => EditProfileViewModel(),
      onModelReady: (EditProfileViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        EditProfileViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).editProfile_appBarTitle),
            centerTitle: true,
            actions: [
              model.isBusy
                  ? LimitedBox(
                      maxHeight: 40,
                      maxWidth: 40,
                      child: CircularProgressIndicator(),
                    )
                  : TextButton(
                      onPressed: model.isSaveButtonEnabled()
                          ? () => model.updateUserInfo()
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          'Save',
                          style: title4.copyWith(
                              color: model.isSaveButtonEnabled()
                                  ? null
                                  : Colors.grey[400]),
                        ),
                      ),
                    ),
            ],
          ),
          body: Form(
            key: model.formKey,
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 40),
              children: <Widget>[
                _buildPhoto(context, model),
                _buildUsername(context, model),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Codename',
                    style: title3,
                  ),
                ),
                ListView.separated(
                  itemCount: codenames.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => Container(
                    height: 0.05,
                    color: jetBlack,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    var title = codenames[index];
                    return ListTile(
                      onTap: () => model.onCodenamePressed(title),
                      tileColor: Colors.white,
                      dense: true,
                      title: Text(
                        title,
                        style: body,
                      ),
                      trailing: model.codeName == title
                          ? Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                SFSymbols.checkmark,
                                color: turkish,
                                size: 20,
                              ),
                            )
                          : SizedBox.shrink(),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding _buildUsername(BuildContext context, EditProfileViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomTextFormField(
        label: S.of(context).global_username,
        controller: model.textEditingControllerName,
        characterLimit: USERNAME_CHARACTER_LIMIT,
        formatters: [
          LengthLimitingTextInputFormatter(USERNAME_CHARACTER_LIMIT)
        ],
        validator: validateUsername,
        hint: 'Avatar Aang',
        onChanged: model.onUsernameChanged,
        onSuffixPressed: model.clearUsername,
      ),
    );
  }

  Padding _buildPhoto(BuildContext context, EditProfileViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Photo',
            style: title3,
          ),
          smallSpace,
          GestureDetector(
            onTap: () => _buildBottomSheetWidget(context, model),
            child: Column(
              children: [
                ProfileImageWidget(
                  photoUrl: model.getProfileUrl,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    'Edit',
                    style: caption,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _buildBottomSheetWidget(
      BuildContext context, EditProfileViewModel model) {
    return Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Theme.of(context).canvasColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Take picture'),
              trailing: Icon(SFSymbols.camera),
              onTap: () {
                Get.back();
                model.onEditPicturePressed(fromCamera: true);
              },
            ),
            ListTile(
              title: Text('Select from gallery'),
              trailing: Icon(SFSymbols.photo_on_rectangle),
              onTap: () {
                Get.back();
                model.onEditPicturePressed(fromCamera: false);
              },
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}
