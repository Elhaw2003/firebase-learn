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
import 'package:go_router/go_router.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/widgets/custom_awesom_dialog_method.dart';
import '../../../../../core/widgets/loading_show_dialog_method.dart';

class AddNoteBody extends StatelessWidget {
  const AddNoteBody(
      {super.key,
      required this.titleController,
      required this.descriptionController,
      required this.formKey,
      required this.categoryId});

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteLoadingState) {
          LoadingShowDialogMethod.showLoadingDialog(context);
        } else if (state is AddNoteSuccessState) {
          Navigator.of(context, rootNavigator: true).pop();
          CustomAwesomDialogMethod.awesomeDialog(
              context: context,
              title: "Success",
              desc: AppTexts.addedNoteSuccessfully,
              dialogType: DialogType.success,
              btnOkColor: AppColors.green,
              btnOkOnPress: () {
                GoRouter.of(context).pop(true);
        });
        }else if (state is AddNoteFailureState) {
          Navigator.of(context, rootNavigator: true).pop();
          CustomAwesomDialogMethod.awesomeDialog(
              context: context,
              title: "Error",
              desc: state.message,
              dialogType: DialogType.error,
              btnOkColor: AppColors.red,
              btnOkOnPress: () {});
        }
      },
      builder: (context, state) {
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
                  const HeightSpacing(height: 100),
                  CustomButtonWidget(
                    title: AppTexts.addNotes,
                    titleColor: AppColors.white,
                    buttonColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AddNoteCubit>().addNoteCubit(
                            noteModel: NoteModel(
                                title: titleController.text.trim(),
                                description: descriptionController.text.trim()),
                            categoryId: categoryId
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
