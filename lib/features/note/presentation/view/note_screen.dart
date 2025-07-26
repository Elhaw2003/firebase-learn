import 'package:firebase_learn/features/home/presentation/view/widgets/floating_widget.dart';
import 'package:firebase_learn/features/note/presentation/view/widgets/note_body.dart';
import 'package:flutter/material.dart';
import '../../../../core/utilies/app_texts.dart';
import '../../../add_note/presentation/view/add_note_screen.dart';
import '../../../auth/widget/arrow_appbar_widget.dart';
import '../../../auth/widget/custom_appbar_widget.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingWidget(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (c){
              return const AddNoteScreen();
            }));
          },
        ),
      ),
      appBar: AppBar(
        leading: const SizedBox(),
        flexibleSpace: const CustomAppbarWidget(
          title: AppTexts.notesScreen,
          leading: ArrowAppbarWidget(),
        ),
      ),
      body: const NoteBody(),
    );
  }
}
