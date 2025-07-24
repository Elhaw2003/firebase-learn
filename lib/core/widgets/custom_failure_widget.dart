import 'package:firebase_learn/core/utilies/app_colors.dart';
import 'package:firebase_learn/core/utilies/app_styles.dart';
import 'package:firebase_learn/core/widgets/spacing_widget.dart';
import 'package:flutter/material.dart';

class CustomFailureWidget extends StatelessWidget {
  const CustomFailureWidget({super.key, this.onPressed, required this.message});
  final void Function()? onPressed;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
            onPressed:onPressed,
            color: AppColors.primaryColor,
            child: Text("Try Again",style: AppStyles.white700wSize12Inter,),
        ),
        const HeightSpacing(height: 30),
        Text(
          message,
          style: AppStyles.black600wSize16Inter,
        )
      ],
    );
  }
}
