import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learn/core/widgets/custom_awesom_dialog_method.dart';
import 'package:firebase_learn/core/widgets/loading_show_dialog_method.dart';
import 'package:firebase_learn/features/auth/register/presentation/controller/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utilies/app_colors.dart';
import '../../../../../../core/utilies/app_texts.dart';
import '../../../../../../core/validators/validators.dart';
import '../../../../../../core/widgets/custom_button_widget.dart';
import '../../../../../../core/widgets/custom_text_field_widget.dart';
import '../../../../../../core/widgets/spacing_widget.dart';
import '../../../../login/presentation/view/login_screen.dart';
import '../../../../widget/rich_text_widget.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  bool obscureText = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                CustomAwesomDialogMethod.awesomeDialog(
                    context: context,
                    title: "Success",
                    desc: AppTexts.createAccountSuccessfully,
                    dialogType: DialogType.success,
                    btnOkColor: AppColors.green,
                    btnOkOnPress: () {
                      FirebaseAuth.instance.currentUser!.sendEmailVerification();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
                        return const LoginScreen();
                      }));
                    }
                );
              } else if (state is RegisterFailureState) {
                CustomAwesomDialogMethod.awesomeDialog(
                    btnOkOnPress: (){
                      Navigator.pop(context);
                    },
                    context: context,
                    title: "Error",
                    desc: state.message,
                    dialogType: DialogType.error,
                    btnOkColor: AppColors.red);
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
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
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
                          Navigator.pop(context);
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
