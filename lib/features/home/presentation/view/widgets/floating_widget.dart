import 'package:flutter/material.dart';

import '../../../../../core/utilies/app_colors.dart';

class FloatingWidget extends StatelessWidget {
  const FloatingWidget({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      foregroundColor: AppColors.white,
      onPressed: onPressed,
      elevation: 0,
      shape: const CircleBorder(),
      backgroundColor: AppColors.primaryColor,
      child: const Icon(Icons.add),
    );
  }
}
