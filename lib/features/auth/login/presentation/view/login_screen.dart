
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
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginWithEmailAndPasswordCubit(loginRepo: LoginWithEmailAndPasswordRepoFirebaseImplementation())),
        BlocProvider(create: (context) => LoginWithGoogleCubit(loginWithGoogleRepo: LoginWithGoogleRepoFirebaseImplementation())),
        BlocProvider(create: (context) => ForgotPasswordFirebaseCubit(forgotPasswordRepo: ForgotPasswordRepoFirebaseImplementation())),
      ],
      child: const Scaffold(
        backgroundColor: AppColors.white,
          body:  LoginBody(),
        ),
    );
  }
}
