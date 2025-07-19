import 'package:flutter/material.dart';
import 'loading_alert_dialog_widget.dart';

class LoadingShowDialogMethod {
  static void showLoadingDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return const LoadingAlertDialogWidget();
        }
    );
  }
}
