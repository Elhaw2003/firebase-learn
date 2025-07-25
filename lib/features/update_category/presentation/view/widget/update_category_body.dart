import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_learn/core/validators/validators.dart';
import 'package:firebase_learn/core/widgets/custom_awesom_dialog_method.dart';
import 'package:firebase_learn/core/widgets/loading_show_dialog_method.dart';
import 'package:firebase_learn/features/add_category/data/model/category_model.dart';
import 'package:firebase_learn/features/update_category/presentation/controller/cubit/update_category_name_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_styles.dart';
import '../../../../../core/utilies/app_texts.dart';
import '../../../../../core/widgets/custom_button_widget.dart';
import '../../../../../core/widgets/custom_text_field_widget.dart';
import '../../../../../core/widgets/spacing_widget.dart';
import '../../../../home/presentation/view/home_screen.dart';

class UpdateCategoryBody extends StatelessWidget {
  const UpdateCategoryBody({super.key, required this.categoryController, required this.formState, required this.oldName, required this.categoryId});
  final String oldName;
  final String categoryId;
  final TextEditingController categoryController;
  final GlobalKey<FormState> formState;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateCategoryNameCubit, UpdateCategoryNameState>(
      listener: (context, state) {
        if (state is UpdateCategoryNameLoadingState) {
          LoadingShowDialogMethod.showLoadingDialog(context);
        } else if (state is UpdateCategoryNameSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                content: Text(AppTexts.updateCategorySuccessfully,style: AppStyles.white700wSize12Inter),
                backgroundColor: AppColors.green,
              ),
          );
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
            return const HomeScreen();
          }));
        }else if (state is UpdateCategoryNameFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                content: Text(state.errorMessage,style: AppStyles.white700wSize12Inter),
                backgroundColor: AppColors.red,
              ));
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
                      return MyValidators.editedCategoryValidator(value);
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
                          context.read<UpdateCategoryNameCubit>().updateCategoryNameCubit(categoryModel: CategoryModel(
                              categoryName: categoryController.text.trim(),
                              categoryId: categoryId
                          ),
                          );
                        }
                      },
                      title: AppTexts.update,
                      titleColor: AppColors.white,
                      buttonColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor
                   ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
