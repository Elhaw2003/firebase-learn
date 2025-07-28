import 'package:firebase_learn/core/utilies/app_colors.dart';
import 'package:firebase_learn/features/add_note/presentation/view/widgets/add_note_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utilies/app_texts.dart';
import '../../../auth/widget/arrow_appbar_widget.dart';
import '../../../auth/widget/custom_appbar_widget.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key, required this.categoryId});
  final String categoryId;
  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading:  ArrowAppbarWidget(onPressed: (){GoRouter.of(context).pop(true);},),
        flexibleSpace: const CustomAppbarWidget(
          title: AppTexts.addNotes,
        ),
      ),
      body: AddNoteBody(
        descriptionController: descriptionController,
        titleController: titleController,
        formKey: formKey,
        categoryId: widget.categoryId,
      ),
    );
  }
}
