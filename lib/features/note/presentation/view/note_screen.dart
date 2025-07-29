import 'package:firebase_learn/features/home/presentation/view/widgets/floating_widget.dart';
import 'package:firebase_learn/features/note/presentation/controller/cubit/get_notes/get_notes_cubit.dart';
import 'package:firebase_learn/features/note/presentation/view/widgets/note_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../core/utilies/app_colors.dart';
import '../../../../core/utilies/app_texts.dart';
import '../../../auth/widget/arrow_appbar_widget.dart';
import '../../../auth/widget/custom_appbar_widget.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingWidget(
          onPressed: ()async{
            final result = await GoRouter.of(context).pushNamed(AppRoutes.addNoteScreen,extra: categoryId);
            if(result == true){
              context.read<GetNotesCubit>().getNotesCubit(categoryId: categoryId);
            }
          },
        ),
      ),
      appBar: AppBar(
        leading:  ArrowAppbarWidget(onPressed: (){GoRouter.of(context).pop(true);},),
        flexibleSpace: const CustomAppbarWidget(
          title: AppTexts.notesScreen,
        ),
      ),
      body:  NoteBody(categoryId:categoryId),
    );
  }
}
