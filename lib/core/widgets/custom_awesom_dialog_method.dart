import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_learn/core/utilies/app_texts.dart';
import 'package:flutter/material.dart';

class CustomAwesomDialogMethod {
  static void awesomeDialog({
    required BuildContext context,
    required String title,
    required String desc,
    required DialogType dialogType,
    required Color btnOkColor,
    void Function()? btnOkOnPress,
  }
  ) {
     AwesomeDialog(
        context: context,
        dialogType: dialogType,
        animType: AnimType.scale,
        title: title,
        desc: desc,
       btnOkText: AppTexts.ok,
       btnOkColor: btnOkColor,
       btnOkOnPress: btnOkOnPress,
       dismissOnTouchOutside: false
    ).show();
  }
}
