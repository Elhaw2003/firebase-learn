import 'package:flutter/material.dart';
import '../../../core/utilies/app_colors.dart';

class ArrowAppbarWidget extends StatelessWidget {
  const ArrowAppbarWidget({super.key,required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: const Icon(
          size: 19,
          Icons.arrow_back_ios_new_outlined,
          color: AppColors.primaryColor,
        ));
  }
}
