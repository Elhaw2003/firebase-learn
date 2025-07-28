import 'package:firebase_learn/features/auth/login/data/repo/forgot_password/forgot_password_repo_firebase_implementation.dart';
import 'package:firebase_learn/features/auth/login/data/repo/login_with_google/login_with_google_repo_firebase_implementation.dart';
import 'package:firebase_learn/features/auth/login/presentation/controller/cubit/forgot_password/forgot_password_firebase_cubit.dart';
import 'package:firebase_learn/features/auth/login/presentation/controller/cubit/login_with_google/login_with_google_cubit.dart';
import 'package:firebase_learn/features/auth/login/presentation/view/widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../data/repo/login_with_email_and_password/login_with_email_and_password_repo_implementation.dart';
import '../controller/cubit/login_with_email_and_password/login_with_email_and_password_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: LoginBody(
        formKey: formKey,
        emailController: emailController,
        passwordController: passwordController,
        obscureText: obscureText,
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
      ),
    );
  }
}
