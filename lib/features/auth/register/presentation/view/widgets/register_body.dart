import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learn/core/app_routes/app_routes.dart';
import 'package:firebase_learn/core/widgets/custom_awesom_dialog_method.dart';
import 'package:firebase_learn/core/widgets/loading_show_dialog_method.dart';
import 'package:firebase_learn/features/auth/register/presentation/controller/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utilies/app_colors.dart';
import '../../../../../../core/utilies/app_texts.dart';
import '../../../../../../core/validators/validators.dart';
import '../../../../../../core/widgets/custom_button_widget.dart';
import '../../../../../../core/widgets/custom_text_field_widget.dart';
import '../../../../../../core/widgets/spacing_widget.dart';
import '../../../../login/presentation/view/login_screen.dart';
import '../../../../widget/rich_text_widget.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key, required this.obscureText, required this.userNameController, required this.emailController, required this.passwordController, this.onPressed, required this.formKey});
  final bool obscureText;
  final GlobalKey<FormState> formKey;
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterLoadingState) {
                LoadingShowDialogMethod.showLoadingDialog(context);
              } else if (state is RegisterSuccessState) {
                Navigator.of(context, rootNavigator: true).pop();
                CustomAwesomDialogMethod.awesomeDialog(
                    context: context,
                    title: "Success",
                    desc: AppTexts.createAccountSuccessfully,
                    dialogType: DialogType.success,
                    btnOkColor: AppColors.green,
                    btnOkOnPress: () {
                      FirebaseAuth.instance.currentUser!.sendEmailVerification();
                      GoRouter.of(context).pushReplacementNamed(AppRoutes.loginScreen);
                    }
                );
              } else if (state is RegisterFailureState) {
                Navigator.of(context, rootNavigator: true).pop();
                CustomAwesomDialogMethod.awesomeDialog(
                    autoHide: const Duration(seconds: 3),
                    context: context,
                    title: "Error",
                    desc: state.message,
                    dialogType: DialogType.error,
                );
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeightSpacing(height: 100),
                  CustomTextFieldWidget(
                    validator: (value) {
                      return MyValidators.displayNameValidator(value);
                    },
                    hintText: AppTexts.enterYourName,
                    controller: userNameController,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextFieldWidget(
                    validator: (value) {
                      return MyValidators.emailValidator(value);
                    },
                    hintText: AppTexts.enterYourEmail,
                    controller: emailController,
                  ),
                  const HeightSpacing(height: 15),
                  CustomTextFieldWidget(
                    validator: (value) {
                      return MyValidators.passwordValidator(value);
                    },
                    controller: passwordController,
                    hintText: AppTexts.enterYourPassword,
                    obscureText: obscureText,
                    suffixIcon: IconButton(
                        onPressed: onPressed,
                        icon: Icon(
                          Icons.visibility,
                          color: obscureText
                              ? AppColors.grey
                              : AppColors.primaryColor,
                        )),
                  ),
                  const HeightSpacing(height: 15),
                  CustomButtonWidget(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<RegisterCubit>().registerCubit(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim());
                        }
                      },
                      title: AppTexts.register,
                      titleColor: AppColors.white,
                      buttonColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor),
                  const HeightSpacing(height: 350),
                  Align(
                    alignment: Alignment.center,
                    child: RichTextWidget(
                        onTap: () {
                          GoRouter.of(context).pushReplacementNamed(AppRoutes.loginScreen);
                        },
                        firstText: AppTexts.alreadyHaveAnAccount,
                        secondText: AppTexts.loginNow),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
