import 'package:flutter/material.dart';
import '../../../core/utilies/app_colors.dart';

class ArrowAppbarWidget extends StatelessWidget {
  const ArrowAppbarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          size: 19,
          Icons.arrow_back_ios_new_outlined,
          color: AppColors.primaryColor,
        ));
  }
}
