
import 'package:firebase_learn/features/auth/login/presentation/view/widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../data/repo/login_repo_implementation.dart';
import '../controller/cubit/login_cubit.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(loginRepo: LoginRepoFirebaseImplementation()),
      child: const Scaffold(
        backgroundColor: AppColors.white,
          body:  LoginBody(),
        ),
    );
  }
}
