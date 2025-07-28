import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_learn/core/utilies/app_texts.dart';
import 'package:firebase_learn/features/add_category/data/model/category_model.dart';
import 'package:firebase_learn/features/update_category/presentation/view/update_category_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/widgets/custom_awesom_dialog_method.dart';

class CustomEditButtonWidget extends StatelessWidget {
  const CustomEditButtonWidget({super.key,  this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.borderTextFieldColor,
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.edit_outlined,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
