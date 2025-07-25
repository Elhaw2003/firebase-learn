import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_learn/features/add_category/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_styles.dart';
import '../../../../../core/utilies/app_texts.dart';
import '../../../../../core/widgets/custom_awesom_dialog_method.dart';
import '../../../../../core/widgets/loading_show_dialog_method.dart';
import '../../controller/cubit/delete_category/delete_category_cubit.dart';
import '../home_screen.dart';

class DeleteCategoryButtonWidget extends StatelessWidget {
  const DeleteCategoryButtonWidget({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteCategoryCubit, DeleteCategoryState>(
      listener: (context, state) {
        if (state is DeleteCategoryLoadingState) {
          LoadingShowDialogMethod.showLoadingDialog(context);
        } else if (state is DeleteCategoryFailureState) {
          Navigator.of(context, rootNavigator: true).pop();
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                content: Text(state.message,style: AppStyles.white700wSize12Inter),
                backgroundColor: AppColors.red,
              ));
        } else if (state is DeleteCategorySuccessState) {
          Navigator.of(context, rootNavigator: true).pop();
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                content: Text(AppTexts.deletedCategorySuccessfully,style: AppStyles.white700wSize12Inter),
                backgroundColor: AppColors.green,
              ));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
            return const HomeScreen();
          }));
        }
      },
      builder: (context, state) {
        return CircleAvatar(
          backgroundColor: AppColors.borderTextFieldColor,
          child: IconButton(
            onPressed: () {
              CustomAwesomDialogMethod.awesomeDialog(
                context: context,
                title: AppTexts.warning,
                desc:
                "Are you sure to delete category ${categoryModel.categoryName}...?",
                dialogType: DialogType.warning,
                btnOkColor: AppColors.green,
                cancelOnPress: () {},
                btnOkOnPress: () {
                  context.read<DeleteCategoryCubit>().deleteCategory(id: categoryModel.categoryId!);
                },
              );
            },
            icon: const Icon(
              Icons.delete,
              color: AppColors.red,
            ),
          ),
        );
      },
    );
  }
}
