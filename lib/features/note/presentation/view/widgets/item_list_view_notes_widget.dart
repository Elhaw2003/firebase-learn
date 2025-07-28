import 'package:firebase_learn/core/app_routes/app_routes.dart';
import 'package:firebase_learn/core/models/update_note_params.dart';
import 'package:firebase_learn/core/utilies/app_colors.dart';
import 'package:firebase_learn/core/utilies/app_styles.dart';
import 'package:firebase_learn/core/widgets/custom_delete_button_widget.dart';
import 'package:firebase_learn/core/widgets/custom_edit_button_widget.dart';
import 'package:firebase_learn/features/add_note/data/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../controller/cubit/get_notes/get_notes_cubit.dart';

class ItemListViewNotesWidget extends StatelessWidget {
  const ItemListViewNotesWidget({super.key, required this.noteModel, required this.categoryId});
  final NoteModel noteModel;
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return  Card(
      color: AppColors.white,
      child: ListTile(
        leading:  CustomEditButtonWidget(
          onPressed: ()async{
            final result = await GoRouter.of(context).pushNamed(AppRoutes.updateNoteScreen,extra: UpdateNoteParams(categoryId: categoryId, noteId: noteModel.noteId!, oldTitle: noteModel.title, oldDescription: noteModel.description));
            if(result == true){
              context.read<GetNotesCubit>().getNotesCubit(categoryId: categoryId);
            }
          },
        ),
        trailing: const CustomDeleteButtonWidget(),
        title: Text(noteModel.title,style: AppStyles.black600wSize16Inter,),
        subtitle: Text(noteModel.description,style: AppStyles.subTitlesStyle,),
      ),
    );
  }
}
