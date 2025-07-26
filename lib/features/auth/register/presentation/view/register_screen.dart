import 'package:firebase_learn/core/utilies/app_colors.dart';
import 'package:firebase_learn/features/auth/register/data/repo/register_repo_implementation.dart';
import 'package:firebase_learn/features/auth/register/presentation/controller/cubit/register_cubit.dart';
import 'package:firebase_learn/features/auth/register/presentation/view/widgets/register_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool obscureText = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
 void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(registerRepo: RegisterRepoFirebaseImplementation()),
      child:  Scaffold(
        backgroundColor: AppColors.white,
        body: RegisterBody(
          obscureText: obscureText,
          formKey: formKey,
          userNameController: userNameController,
          emailController: emailController,
          passwordController: passwordController,
          onPressed: (){
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
      ),
    );
  }
}
