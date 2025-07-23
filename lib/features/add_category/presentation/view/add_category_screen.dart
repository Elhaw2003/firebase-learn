import 'package:firebase_learn/core/utilies/app_colors.dart';
import 'package:firebase_learn/core/utilies/app_texts.dart';
import 'package:firebase_learn/features/add_category/data/repo/add_category_repo_firebase_implementation.dart';
import 'package:firebase_learn/features/add_category/presentation/controller/cubit/add_category_cubit.dart';
import 'package:firebase_learn/features/add_category/presentation/view/widget/add_category_body.dart';
import 'package:firebase_learn/features/auth/widget/arrow_appbar_widget.dart';
import 'package:firebase_learn/features/auth/widget/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {

  TextEditingController categoryController = TextEditingController();
  GlobalKey<FormState> formSate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCategoryCubit(addCategoryRepo: AddCategoryRepoFirebaseImplementation()),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: const SizedBox(),
          flexibleSpace: const CustomAppbarWidget(
            title: AppTexts.addCategory,
            leading: ArrowAppbarWidget(),
          ),
        ),
        body: AddCategoryBody(categoryController: categoryController,formState: formSate,),
      ),
    );
  }
}
