import 'package:bloc/bloc.dart';
import 'package:firebase_learn/features/update_note/data/repo/update_note_repo.dart';
import 'package:meta/meta.dart';

import '../../../../add_note/data/model/note_model.dart';

part 'update_note_state.dart';

class UpdateNoteCubit extends Cubit<UpdateNoteState> {
  UpdateNoteCubit({required this.updateNoteRepo}) : super(UpdateNoteInitialState());
  final UpdateNoteRepo updateNoteRepo;
  Future<void> updateNoteCubit({required String categoryId,required NoteModel noteModel})async{
    emit(UpdateNoteLoadingState());
    final result = await updateNoteRepo.updateNoteRepo(categoryId: categoryId, noteModel: noteModel);
    result.fold((l) => emit(UpdateNoteFailureState(message: l.message)), (r) => emit(UpdateNoteSuccessState()));
  }
}
