import 'package:bloc/bloc.dart';
import 'package:firebase_learn/features/note/data/repo/get_note_repo/get_notes_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../add_note/data/model/note_model.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit({required this.getNotesRepo}) : super(GetNotesInitialState());
  final GetNotesRepo getNotesRepo;

  Future<void> getNotesCubit({required String categoryId})async{
    emit(GetNotesLoadingState());
    var result = await getNotesRepo.getNotes(categoryId: categoryId);
    return result.fold((left) => emit(GetNotesFailureState(message: left.message)), (right) => emit(GetNotesSuccessState(notes: right)));
  }

}
