import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_learn/core/utilies/app_texts.dart';
import 'package:firebase_learn/core/validators/validators.dart';
import 'package:firebase_learn/core/widgets/custom_button_widget.dart';
import 'package:firebase_learn/core/widgets/custom_text_field_widget.dart';
import 'package:firebase_learn/core/widgets/spacing_widget.dart';
import 'package:firebase_learn/features/add_note/data/model/note_model.dart';
import 'package:firebase_learn/features/add_note/presentation/controller/cubit/add_note_cubit.dart';
import 'package:firebase_learn/features/update_note/presentation/controller/cubit/update_note_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_styles.dart';
import '../../../../../core/widgets/loading_show_dialog_method.dart';

class UpdateNoteBody extends StatelessWidget {
  const UpdateNoteBody({super.key,
    required this.titleController,
    required this.descriptionController,
    required this.formKey, required this.noteId, required this.categoryId,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey;
  final String noteId;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: BlocConsumer<UpdateNoteCubit, UpdateNoteState>(
            listener: (context, state) {
              if (state is UpdateNoteLoadingState) {
                LoadingShowDialogMethod.showLoadingDialog(context);
              }
              else if(state is UpdateNoteSuccessState){
                Navigator.of(context,rootNavigator: true).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.green,
                    duration: const Duration(seconds: 1),
                    content: Text(AppTexts.updateNoteSuccessfully,style: AppStyles.white700wSize12Inter),
                ));
                GoRouter.of(context).pop(true);
              }
              else if(state is UpdateNoteFailureState){
                Navigator.of(context,rootNavigator: true).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 1),
                    content: Text(state.message,style: AppStyles.white700wSize12Inter),
                    backgroundColor: AppColors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return Column(
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
                        context.read<UpdateNoteCubit>().updateNoteCubit(
                          categoryId: categoryId,
                          noteModel: NoteModel(
                            title: titleController.text.trim(),
                            description: descriptionController.text.trim(),
                            noteId: noteId,
                          )
                        );
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
