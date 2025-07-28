part of 'update_note_cubit.dart';

@immutable
sealed class UpdateNoteState {}

final class UpdateNoteInitialState extends UpdateNoteState {}
final class UpdateNoteLoadingState extends UpdateNoteState {}
final class UpdateNoteSuccessState extends UpdateNoteState {}
final class UpdateNoteFailureState extends UpdateNoteState {
  final String message;
  UpdateNoteFailureState({required this.message});
}
