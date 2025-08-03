import 'package:firebase_learn/features/add_note/data/model/note_model.dart';
import 'package:firebase_learn/features/note/presentation/view/widgets/item_list_view_notes_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_lottie_widget.dart';
import '../../../../../core/widgets/spacing_widget.dart';
import '../../../../../generated/assets.dart';

class ListViewNotesWidget extends StatelessWidget {
  const ListViewNotesWidget({super.key, required this.notes, required this.categoryId});
  final List<NoteModel> notes;
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return notes.isEmpty ? const Center(child: CustomLottieWidget(name: Assets.lottiesNoNotesFound)) : ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: notes.length,
      separatorBuilder: (context, index) => const HeightSpacing(height: 20),
      itemBuilder: (context, index) {
        return  ItemListViewNotesWidget(noteModel: notes[index],categoryId: categoryId,);
      },
    );
  }
}
