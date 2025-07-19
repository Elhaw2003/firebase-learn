import 'package:flutter/material.dart';

import '../utilies/app_colors.dart';

class LoadingAlertDialogWidget extends StatelessWidget {
  const LoadingAlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      backgroundColor: Colors.transparent,
      content: Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
