import 'package:firebase_learn/features/add_category/data/model/category_model.dart';
import 'package:firebase_learn/features/home/presentation/view/widgets/delete_category_button_widget.dart';
import 'package:firebase_learn/features/home/presentation/view/widgets/edit_category_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_styles.dart';

class ItemGridViewCategoriesWidget extends StatelessWidget {
  const ItemGridViewCategoriesWidget({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Card(
            color: AppColors.white,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
               Icon(
                Icons.folder,
                color: AppColors.yellow,
                size: 100.sp,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                categoryModel.categoryName,
                style: AppStyles.primaryHeadLineStyle,
              )
            ]),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: DeleteCategoryButtonWidget(categoryModel: categoryModel),
        ),
        Positioned(
            top: 10,
            left: 10,
            child: EditCategoryButtonWidget(categoryModel: categoryModel,)
        )
      ],
    );
  }
}