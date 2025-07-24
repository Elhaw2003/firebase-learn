import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_learn/core/utilies/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAwesomDialogMethod {
  static void awesomeDialog(
      {
    required BuildContext context,
    required String title,
    required String desc,
    required DialogType dialogType,
     Color? btnOkColor,
    void Function()? btnOkOnPress,
    void Function()? cancelOnPress,
        Duration? autoHide
  }
  ) {
     AwesomeDialog(
        context: context,
        autoHide: autoHide,
        dialogType: dialogType,
        animType: AnimType.scale,
        title: title,
        desc: desc,
       btnOkColor: btnOkColor,
       btnOkOnPress: btnOkOnPress,
       dismissOnTouchOutside: false,
       btnCancelColor: AppColors.red,
       btnCancelOnPress: cancelOnPress,
    ).show();
  }
}
