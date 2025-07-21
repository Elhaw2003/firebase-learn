import 'package:firebase_learn/core/utilies/app_colors.dart';
import 'package:flutter/material.dart';
import 'loading_alert_dialog_widget.dart';

class LoadingShowDialogMethod {
  static void showLoadingDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        barrierColor: AppColors.grey.withOpacity(0.2),
        context: context,
        builder: (context) {
          return const LoadingAlertDialogWidget();
        }
    );
  }
}
