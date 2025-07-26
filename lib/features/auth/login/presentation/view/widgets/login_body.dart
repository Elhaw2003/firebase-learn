import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utilies/app_colors.dart';
import '../../../../../../core/utilies/app_texts.dart';
import '../../../../../../core/validators/validators.dart';
import '../../../../../../core/widgets/custom_awesom_dialog_method.dart';
import '../../../../../../core/widgets/custom_button_widget.dart';
import '../../../../../../core/widgets/custom_text_field_widget.dart';
import '../../../../../../core/widgets/loading_show_dialog_method.dart';
import '../../../../../../core/widgets/spacing_widget.dart';
import '../../../../../../generated/assets.dart';
import '../../../../../home/presentation/view/home_screen.dart';
import '../../../../register/presentation/view/register_screen.dart';
import '../../../../widget/or_login_register_widget.dart';
import '../../../../widget/rich_text_widget.dart';
import '../../controller/cubit/forgot_password/forgot_password_firebase_cubit.dart';
import '../../controller/cubit/login_with_email_and_password/login_with_email_and_password_cubit.dart';
import '../../controller/cubit/login_with_google/login_with_google_cubit.dart';
import 'forgot_password_widget.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key, required this.formKey, required this.emailController, required this.passwordController, required this.obscureText, required this.onPressed});
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool obscureText;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
            child: MultiBlocListener(
                listeners: [
                  BlocListener<LoginWithEmailAndPasswordCubit,
                      LoginWithEmailAndPasswordState>(
                    listener: (context, state) {
                      if (state is LoginWithEmailAndPasswordLoadingState) {
                        LoadingShowDialogMethod.showLoadingDialog(context);
                      } else
                      if (state is LoginWithEmailAndPasswordSuccessState) {
                        Navigator.of(context, rootNavigator: true).pop();
                        CustomAwesomDialogMethod.awesomeDialog(
                            context: context,
                            title: "Success",
                            desc: AppTexts.loginSuccessfully,
                            dialogType: DialogType.success,
                            btnOkColor: AppColors.green,
                            btnOkOnPress: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (c) {
                                    return const HomeScreen();
                                  }));
                            });
                      } else
                      if (state is LoginWithEmailAndPasswordFailureState) {
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
                  ),
                  BlocListener<LoginWithGoogleCubit, LoginWithGoogleState>(
                    listener: (context, state) {
                      if (state is LoginWithGoogleLoadingState) {
                        LoadingShowDialogMethod.showLoadingDialog(context);
                      } else if (state is LoginWithGoogleSuccessState) {
                        Navigator.of(context, rootNavigator: true).pop();
                        CustomAwesomDialogMethod.awesomeDialog(
                            context: context,
                            title: "Success",
                            desc: AppTexts.loginSuccessfully,
                            dialogType: DialogType.success,
                            btnOkColor: AppColors.green,
                            btnOkOnPress: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (c) {
                                    return const HomeScreen();
                                  }));
                            });
                      } else if (state is LoginWithGoogleFailureState) {
                        Navigator.of(context, rootNavigator: true).pop();
                        CustomAwesomDialogMethod.awesomeDialog(
                            context: context,
                            title: "Error",
                            desc: state.message,
                            dialogType: DialogType.error,
                            autoHide: const Duration(seconds: 3)
                        );
                      }
                    },
                  ),
                  BlocListener<ForgotPasswordFirebaseCubit, ForgotPasswordFirebaseState>(
                    listener: (context, state) {
                      if (state is ForgotPasswordFirebaseLoadingState) {
                        LoadingShowDialogMethod.showLoadingDialog(context);
                      } else if (state is ForgotPasswordFirebaseSuccessState) {
                        Navigator.of(context, rootNavigator: true).pop();
                        CustomAwesomDialogMethod.awesomeDialog(
                            context: context,
                            title: "Success",
                            desc: AppTexts.verifyYourEmailForChangePassword,
                            dialogType: DialogType.success,
                            btnOkColor: AppColors.green,
                            autoHide: const Duration(seconds: 3)
                        );
                      } else if (state is ForgotPasswordFirebaseFailureState) {
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
                  ),
                ],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeightSpacing(height: 100),
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: ForgotPasswordWidget(
                          onPressed: () {
                            if(emailController.text.isEmpty){
                              CustomAwesomDialogMethod.awesomeDialog(
                                context: context,
                                title: "Error",
                                desc: AppTexts.enterYourEmail,
                                dialogType: DialogType.error,
                                autoHide: const Duration(seconds: 1),
                              );
                            }
                            else{
                              context.read<ForgotPasswordFirebaseCubit>().forgotPasswordCubit(email: emailController.text.trim());
                            }
                          }
                      ),
                    ),
                    const HeightSpacing(height: 15),
                    BlocBuilder<LoginWithEmailAndPasswordCubit,
                        LoginWithEmailAndPasswordState>(
                      builder: (context, state) {
                        return CustomButtonWidget(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context
                                    .read<LoginWithEmailAndPasswordCubit>()
                                    .loginWithEmailAndPasswordCubit(
                                    email: emailController.text.trim(),
                                    password:
                                    passwordController.text.trim());
                              }
                            },
                            title: AppTexts.login,
                            titleColor: AppColors.white,
                            buttonColor: AppColors.primaryColor,
                            borderColor: AppColors.primaryColor);
                      },
                    ),
                    const HeightSpacing(height: 22),
                    const OrLoginRegisterWidget(
                      text: AppTexts.orLoginWith,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    BlocBuilder<LoginWithGoogleCubit, LoginWithGoogleState>(
                      builder: (context, state) {
                        return CustomButtonWidget(
                          title: AppTexts.loginWithGoogle,
                          titleColor: AppColors.white,
                          buttonColor: AppColors.red,
                          borderColor: AppColors.red,
                          iconPath: Assets.iconsGoogleIcon,
                          onPressed: () {
                            context.read<LoginWithGoogleCubit>().loginWithGoogleCubit();
                          },
                        );
                      },
                    ),
                    const HeightSpacing(height: 250),
                    Align(
                      alignment: Alignment.center,
                      child: RichTextWidget(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (c) {
                                  return const RegisterScreen();
                                }));
                          },
                          firstText: AppTexts.doNotHaveAnAccount,
                          secondText: AppTexts.registerNow),
                    ),
                  ],
                ))),
      ),
    );
  }
}
