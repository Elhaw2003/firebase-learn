import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_texts.dart';
import '../../../../../core/widgets/custom_button_widget.dart';
import '../../../../../core/widgets/custom_text_field_widget.dart';
import '../../../../../core/widgets/spacing_widget.dart';

class AddCategoryBody extends StatelessWidget {
  const AddCategoryBody({super.key, required this.categoryController});

  final TextEditingController categoryController ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 22.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const HeightSpacing(height: 50),
            CustomTextFieldWidget(
              hintText: AppTexts.enterCategoryName,
              controller: categoryController,
            ),
            const HeightSpacing(height: 300,),
            const CustomButtonWidget(
                title: AppTexts.addCategory,
                titleColor: AppColors.white,
                buttonColor: AppColors.primaryColor,
                borderColor: AppColors.primaryColor
            ),
          ],
        ),
      ),
    );
  }
}
