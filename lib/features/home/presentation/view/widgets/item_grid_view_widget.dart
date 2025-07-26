import 'package:firebase_learn/features/add_category/data/model/category_model.dart';
import 'package:firebase_learn/features/note/presentation/view/note_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_styles.dart';

class ItemGridViewWidget extends StatelessWidget {
  const ItemGridViewWidget({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (c){
          return const NoteScreen();
        }));
      },
      child: Card(
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
    );
  }
}
