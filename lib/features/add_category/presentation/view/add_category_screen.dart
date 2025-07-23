import 'package:firebase_learn/core/utilies/app_colors.dart';
import 'package:firebase_learn/core/utilies/app_texts.dart';
import 'package:firebase_learn/core/widgets/custom_button_widget.dart';
import 'package:firebase_learn/core/widgets/custom_text_field_widget.dart';
import 'package:firebase_learn/core/widgets/spacing_widget.dart';
import 'package:firebase_learn/features/add_category/presentation/view/widget/add_category_body.dart';
import 'package:firebase_learn/features/auth/widget/arrow_appbar_widget.dart';
import 'package:firebase_learn/features/auth/widget/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {

  TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: const SizedBox(),
        flexibleSpace: const CustomAppbarWidget(
          title: AppTexts.addCategory,
          leading: ArrowAppbarWidget(),
        ),
      ),
      body: AddCategoryBody(categoryController: categoryController),
    );
  }
}
