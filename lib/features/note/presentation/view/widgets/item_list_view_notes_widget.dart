import 'package:firebase_learn/core/utilies/app_colors.dart';
import 'package:firebase_learn/core/utilies/app_styles.dart';
import 'package:firebase_learn/core/widgets/custom_delete_category_button_widget.dart';
import 'package:firebase_learn/core/widgets/custom_edit_category_button_widget.dart';
import 'package:firebase_learn/features/add_note/data/model/note_model.dart';
import 'package:flutter/material.dart';

class ItemListViewNotesWidget extends StatelessWidget {
  const ItemListViewNotesWidget({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return  Card(
      color: AppColors.white,
      child: ListTile(
        leading: const CustomEditCategoryButtonWidget(),
        trailing: const CustomDeleteCategoryButtonWidget(),
        title: Text(noteModel.title,style: AppStyles.black600wSize16Inter,),
        subtitle: Text(noteModel.description,style: AppStyles.subTitlesStyle,),
      ),
    );
  }
}
