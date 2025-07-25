import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_learn/core/utilies/app_texts.dart';
import 'package:firebase_learn/features/add_category/data/model/category_model.dart';
import 'package:firebase_learn/features/update_category/presentation/view/update_category_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/widgets/custom_awesom_dialog_method.dart';

class EditCategoryButtonWidget extends StatelessWidget {
  const EditCategoryButtonWidget({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.borderTextFieldColor,
      child: IconButton(
        onPressed: () {
          CustomAwesomDialogMethod.awesomeDialog(
            context: context,
            title: AppTexts.warning,
            desc:
            "Are you sure to Edit category ${categoryModel.categoryName}...?",
            dialogType: DialogType.warning,
            btnOkColor: AppColors.green,
            cancelOnPress: () {},
            btnOkOnPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (c){
                return  UpdateCategoryScreen(oldName: categoryModel.categoryName,categoryId: categoryModel.categoryId!,);
              }));
            },
          );
        },
        icon: const Icon(
          Icons.edit_outlined,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
