import 'package:firebase_learn/core/utilies/app_colors.dart';
import 'package:firebase_learn/features/auth/register/data/repo/register_repo_implementation.dart';
import 'package:firebase_learn/features/auth/register/presentation/controller/cubit/register_cubit.dart';
import 'package:firebase_learn/features/auth/register/presentation/view/widgets/register_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(registerRepo: RegisterRepoFirebaseImplementation()),
      child: const Scaffold(
        backgroundColor: AppColors.white,
        body: RegisterBody(),
      ),
    );
  }
}
