import 'package:firebase_learn/core/utilies/app_colors.dart';
import 'package:firebase_learn/core/utilies/app_texts.dart';
import 'package:firebase_learn/features/auth/widget/arrow_appbar_widget.dart';
import 'package:firebase_learn/features/auth/widget/custom_appbar_widget.dart';
import 'package:firebase_learn/features/update_category/presentation/view/widget/update_category_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/repo/update_category_name_repo_firebase_implementation.dart';
import '../controller/cubit/update_category_name_cubit.dart';

class UpdateCategoryScreen extends StatefulWidget {
  const UpdateCategoryScreen({super.key, required this.oldName, required this.categoryId});
  final String oldName;
  final String categoryId;
  @override
  State<UpdateCategoryScreen> createState() => _UpdateCategoryScreenState();
}

class _UpdateCategoryScreenState extends State<UpdateCategoryScreen> {

  TextEditingController categoryController = TextEditingController();
  GlobalKey<FormState> formSate = GlobalKey<FormState>();


  @override
  initState() {
    super.initState();
    categoryController.text = widget.oldName;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    categoryController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading:  ArrowAppbarWidget(onPressed: (){GoRouter.of(context).pop(true);},),
          flexibleSpace: const CustomAppbarWidget(
            title: AppTexts.updateCategory,
          ),
        ),
        body: UpdateCategoryBody(categoryController: categoryController,formState: formSate,oldName: widget.oldName,categoryId: widget.categoryId,),
      );
  }
}
