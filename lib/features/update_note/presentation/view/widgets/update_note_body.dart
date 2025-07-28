import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_learn/core/utilies/app_texts.dart';
import 'package:firebase_learn/core/validators/validators.dart';
import 'package:firebase_learn/core/widgets/custom_button_widget.dart';
import 'package:firebase_learn/core/widgets/custom_text_field_widget.dart';
import 'package:firebase_learn/core/widgets/spacing_widget.dart';
import 'package:firebase_learn/features/add_note/data/model/note_model.dart';
import 'package:firebase_learn/features/add_note/presentation/controller/cubit/add_note_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilies/app_colors.dart';
class UpdateNoteBody extends StatelessWidget {
  const UpdateNoteBody(
      {super.key,
        required this.titleController,
        required this.descriptionController,
        required this.formKey,
        });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const HeightSpacing(height: 30),
                  CustomTextFieldWidget(
                      validator: (value) {
                        return MyValidators.addedNoteValidator(value);
                      },
                      hintText: AppTexts.enterYourNote,
                      controller: titleController),
                  const HeightSpacing(height: 50),
                  CustomTextFieldWidget(
                    validator: (value) {
                      return MyValidators.addedDescriptionNoteValidator(value);
                    },
                    hintText: AppTexts.enterDescription,
                    controller: descriptionController,
                    minLines: 3,
                    maxLines: 6,
                  ),
                  const HeightSpacing(height: 150),
                  CustomButtonWidget(
                    title: AppTexts.updateNote,
                    titleColor: AppColors.white,
                    buttonColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
