import 'package:bloc/bloc.dart';
import 'package:firebase_learn/features/add_note/data/repo/add_note_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/model/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit({required this.addNoteRepo}) : super(AddNoteInitialState());

  final AddNoteRepo addNoteRepo;

  Future<void> addNoteCubit({required NoteModel noteModel, required String categoryId})async{

    emit(AddNoteLoadingState());

    var result = await addNoteRepo.addNote(noteModel: noteModel, categoryId: categoryId);

    return result.fold(
            (left){
              emit(AddNoteFailureState(message: left.message));
            },
            (right){
              emit(AddNoteSuccessState());
            }
    );

  }

}
