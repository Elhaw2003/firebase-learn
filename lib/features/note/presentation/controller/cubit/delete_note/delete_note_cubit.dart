import 'package:bloc/bloc.dart';
import 'package:firebase_learn/features/note/data/repo/delete_note_repo/delete_note_repo.dart';
import 'package:meta/meta.dart';

part 'delete_note_state.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  DeleteNoteCubit({required this.deleteNoteRepo})
      : super(DeleteNoteInitialState());
  final DeleteNoteRepo deleteNoteRepo;

  Future<void> deleteNoteCubit(
      {required String noteId, required String categoryId}) async {
    emit(DeleteNoteLoadingState());
    final result = await deleteNoteRepo.deleteNote(
        noteId: noteId, categoryId: categoryId);
    result.fold((l) => emit(DeleteNoteFailureState(message: l.message)), (r) =>
        emit(DeleteNoteSuccessState()));
  }
}
