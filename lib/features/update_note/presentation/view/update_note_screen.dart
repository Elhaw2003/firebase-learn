import 'package:firebase_learn/core/utilies/app_texts.dart';
import 'package:firebase_learn/features/auth/widget/arrow_appbar_widget.dart';
import 'package:firebase_learn/features/auth/widget/custom_appbar_widget.dart';
import 'package:firebase_learn/features/update_note/presentation/view/widgets/update_note_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utilies/app_colors.dart';

class UpdateNoteScreen extends StatefulWidget {
  const UpdateNoteScreen({super.key});

  @override
  State<UpdateNoteScreen> createState() => _UpdateNoteScreenState();
}

class _UpdateNoteScreenState extends State<UpdateNoteScreen> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: ArrowAppbarWidget(onPressed: (){GoRouter.of(context).pop(true);}),
        flexibleSpace: const CustomAppbarWidget(title: AppTexts.updateNote),
      ),
      body: UpdateNoteBody(
        descriptionController: descriptionController,
        titleController: titleController,
        formKey: formKey,
      ),
    );
  }
}
