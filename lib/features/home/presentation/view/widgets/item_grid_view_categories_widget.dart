import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_learn/core/utilies/app_texts.dart';
import 'package:firebase_learn/core/widgets/custom_awesom_dialog_method.dart';
import 'package:firebase_learn/core/widgets/loading_show_dialog_method.dart';
import 'package:firebase_learn/features/add_category/data/model/category_model.dart';
import 'package:firebase_learn/features/home/presentation/controller/cubit/delete_category/delete_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_styles.dart';
import '../home_screen.dart';

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
          child: BlocConsumer<DeleteCategoryCubit, DeleteCategoryState>(
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
          ),
        )
      ],
    );
  }
}