import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_learn/core/utilies/app_texts.dart';
import 'package:firebase_learn/core/widgets/custom_awesom_dialog_method.dart';
import 'package:firebase_learn/core/widgets/loading_show_dialog_method.dart';
import 'package:firebase_learn/features/note/presentation/controller/cubit/delete_note/delete_note_cubit.dart';
import 'package:firebase_learn/features/note/presentation/controller/cubit/get_notes/get_notes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_styles.dart';
import '../../../../../core/widgets/custom_delete_button_widget.dart';

class DeleteNoteWidget extends StatelessWidget {
  const DeleteNoteWidget({super.key, required this.categoryId, required this.noteId});
  final String categoryId;
  final String noteId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteNoteCubit, DeleteNoteState>(
      listener: (context, state) {
        if (state is DeleteNoteLoadingState) {
          LoadingShowDialogMethod.showLoadingDialog(context);
        } else if (state is DeleteNoteSuccessState) {
          Navigator.of(context, rootNavigator: true).pop();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              AppTexts.deletedNoteSuccessfully,
              style: AppStyles.white700wSize12Inter,
            ),
            duration: const Duration(seconds: 1),
            backgroundColor: AppColors.green,
          ));
          context.read<GetNotesCubit>().getNotesCubit(categoryId: categoryId);
        } else if (state is DeleteNoteFailureState) {
          Navigator.of(context, rootNavigator: true).pop();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              state.message,
              style: AppStyles.white700wSize12Inter,
            ),
            duration: const Duration(seconds: 1),
            backgroundColor: AppColors.red,
          ));
        }
      },
      builder: (context, state) {
        return CustomDeleteButtonWidget(
          onPressed: () {
            CustomAwesomDialogMethod.awesomeDialog(
                context: context,
                title: AppTexts.warning,
                desc: "Are You Sure You Want To Delete This Note ?",
                dialogType: DialogType.warning,
                btnOkOnPress: () {
                  context.read<DeleteNoteCubit>().deleteNoteCubit(noteId: noteId,categoryId: categoryId);
                },
              cancelOnPress: () {}
            );
          },
        );
      },
    );
  }
}
