import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_learn/core/validators/validators.dart';
import 'package:firebase_learn/core/widgets/custom_awesom_dialog_method.dart';
import 'package:firebase_learn/core/widgets/loading_show_dialog_method.dart';
import 'package:firebase_learn/features/add_category/data/model/category_model.dart';
import 'package:firebase_learn/features/add_category/presentation/controller/cubit/add_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_texts.dart';
import '../../../../../core/widgets/custom_button_widget.dart';
import '../../../../../core/widgets/custom_text_field_widget.dart';
import '../../../../../core/widgets/spacing_widget.dart';
import '../../../../home/presentation/view/home_screen.dart';

class AddCategoryBody extends StatelessWidget {
  const AddCategoryBody({super.key, required this.categoryController, required this.formState});

  final TextEditingController categoryController;
  final GlobalKey<FormState> formState;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCategoryCubit, AddCategoryState>(
      listener: (context, state) {
        if (state is AddCategoryLoadingState) {
          LoadingShowDialogMethod.showLoadingDialog(context);
        } else if (state is AddCategorySuccessState) {
          CustomAwesomDialogMethod.awesomeDialog(
              context: context,
              title: "Success",
              desc: AppTexts.addedCategorySuccessfully,
              dialogType: DialogType.success,
              btnOkColor: AppColors.green,
              btnOkOnPress: (){
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
                  return const HomeScreen();
                }));
              }
          );
        }else if (state is AddCategoryFailureState) {
          CustomAwesomDialogMethod.awesomeDialog(
              context: context,
              title: "Error",
              desc: state.message,
              dialogType: DialogType.error,
              btnOkColor: AppColors.red,
              btnOkOnPress: (){}
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: SingleChildScrollView(
            child: Form(
              key: formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeightSpacing(height: 50),
                  CustomTextFieldWidget(
                    validator: (value){
                      return MyValidators.addedCategoryValidator(value);
                    },
                    hintText: AppTexts.enterCategoryName,
                    controller: categoryController,
                  ),
                  const HeightSpacing(
                    height: 300,
                  ),
                   CustomButtonWidget(
                      onPressed: (){
                        if(formState.currentState!.validate()){
                          context.read<AddCategoryCubit>().addCategoryCubit(categoryModel: CategoryModel(categoryName: categoryController.text.trim()));
                        }
                      },
                      title: AppTexts.addCategory,
                      titleColor: AppColors.white,
                      buttonColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
