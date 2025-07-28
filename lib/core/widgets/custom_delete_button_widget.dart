import 'package:flutter/material.dart';
import '../../../../../core/utilies/app_colors.dart';

class CustomDeleteButtonWidget extends StatelessWidget {
  const CustomDeleteButtonWidget({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.borderTextFieldColor,
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.delete,
          color: AppColors.red,
        ),
      ),
    );
  }
}
