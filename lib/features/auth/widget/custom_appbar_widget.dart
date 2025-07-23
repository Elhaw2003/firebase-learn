import 'package:firebase_learn/core/utilies/app_colors.dart';
import 'package:firebase_learn/core/utilies/app_styles.dart';
import 'package:flutter/material.dart';

import 'arrow_appbar_widget.dart';

class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget({super.key, required this.title, this.actionOnPressed, this.actionIcon, this.leading});
  final String title;
  final void Function()? actionOnPressed;
  final IconData? actionIcon;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.borderTextFieldColor,
      elevation: 0,
      leading: leading,
      title: Text(title,style: AppStyles.primaryHeadLineStyle,),
      actions: [
        IconButton(onPressed: actionOnPressed, icon: Icon(actionIcon,color: AppColors.primaryColor,),
        ),
      ],
    );
  }
}
