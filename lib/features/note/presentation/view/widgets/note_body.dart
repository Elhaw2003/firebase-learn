import 'package:firebase_learn/core/widgets/spacing_widget.dart';
import 'package:firebase_learn/features/note/presentation/controller/cubit/get_notes/get_notes_cubit.dart';
import 'package:firebase_learn/features/note/presentation/view/widgets/list_view_notes_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/widgets/custom_failure_widget.dart';

class NoteBody extends StatelessWidget {
  const NoteBody({super.key, required this.categoryId});
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: RefreshIndicator(
        backgroundColor: AppColors.white,
        // elevation: 0,
        color: AppColors.primaryColor,
        onRefresh: () async{
          context.read<GetNotesCubit>().getNotesCubit(categoryId: categoryId);
        },
        child: Column(
          children: [
            const HeightSpacing(height: 20),
            Expanded(
                child: BlocBuilder<GetNotesCubit, GetNotesState>(
                  builder: (context, state) {
                    return state is GetNotesLoadingState
                        ? const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),)
                        : state is GetNotesFailureState
                        ? Center(child: CustomFailureWidget(message: state.message,))
                        : state is GetNotesSuccessState ? ListViewNotesWidget(notes: state.notes,categoryId: categoryId,)
                        : const SizedBox.shrink();
                  },
                )
            ),
          ],
        ),
      ),
    );
  }
}
