part of 'delete_note_cubit.dart';

@immutable
sealed class DeleteNoteState {}

final class DeleteNoteInitialState extends DeleteNoteState {}
final class DeleteNoteLoadingState extends DeleteNoteState {}
final class DeleteNoteFailureState extends DeleteNoteState {
  final String message;
  DeleteNoteFailureState({required this.message});
}
final class DeleteNoteSuccessState extends DeleteNoteState {}
