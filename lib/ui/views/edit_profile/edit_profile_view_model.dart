import 'dart:io';

import 'package:ez_meditation_app/app/core/custom_base_view_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileViewModel extends CustomBaseViewModel {
  final ImagePicker _imagePicker = ImagePicker();
  final formKey = GlobalKey<FormState>();

  bool get isUserLoggedIn => user != null;

  bool get isValid => true;

  String name = '';
  String? codeName;

  final TextEditingController textEditingControllerName =
      TextEditingController();

  String? get getProfileUrl {
    if (isUserLoggedIn) {
      return user?.photoUrl;
    }
  }

  Future<void> init() async {
    name = user!.username!;
    textEditingControllerName.text = name;
    codeName = user?.codeName;
    _update();
  }

  Future<void> onEditPicturePressed({bool fromCamera = true}) async {
    final file = await _imagePicker.getImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 3000);

    if (file != null) {
      logger.i('file loaded: ${file.path}');
      final task = await firebaseService.uploadUserProfile(File(file.path));
      await task.then((state) async {
        if (state.state == TaskState.success) {
          logger.i('picture successfully uploaded');
          final photoUrl = await state.ref.getDownloadURL();
          firebaseService.updateUser(user!.copyWith(photoUrl: photoUrl));
          notifyListeners();
        } else {
          logger.i('something went wrong while uploading');
        }
      });
    }

    notifyListeners();
  }

  void onUsernameChanged(String name) {
    this.name = name;
    _update();
  }

  void clearUsername() {
    name = '';
    textEditingControllerName.clear();
    _update();
  }

  void updateUserInfo() async {
    setBusy(true);
    firebaseService.updateUser(user!.copyWith(
      username: name,
      codeName: codeName,
    ));
    setBusy(false);
    Get.back();
  }

  void onCodenamePressed(String title) {
    codeName = title;
    _update();
  }

  void _update() {
    _validate();
    notifyListeners();
  }

  void _validate() {
    formKey.currentState?.validate();
  }

  bool isSaveButtonEnabled() {
    return formKey.currentState?.validate() ?? false;
  }
}
