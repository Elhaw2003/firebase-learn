import 'package:firebase_learn/features/add_category/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_styles.dart';

class ItemGridViewCategoriesWidget extends StatelessWidget {
  const ItemGridViewCategoriesWidget({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.folder,color: AppColors.yellow,size: 120.sp,),
              SizedBox(height: 10.h,),
              Text(categoryModel.categoryName,style:AppStyles.primaryHeadLineStyle,)
            ]
        )
    );
  }
}
