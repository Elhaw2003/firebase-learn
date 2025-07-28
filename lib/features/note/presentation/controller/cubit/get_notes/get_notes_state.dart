part of 'get_notes_cubit.dart';

@immutable
sealed class GetNotesState {}

final class GetNotesInitialState extends GetNotesState {}
final class GetNotesLoadingState extends GetNotesState {}
final class GetNotesSuccessState extends GetNotesState {
  final List<NoteModel> notes;
  GetNotesSuccessState({required this.notes});
}
final class GetNotesFailureState extends GetNotesState {
  final String message;
  GetNotesFailureState({required this.message});
}
