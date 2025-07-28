class UpdateNoteParams {
  final String categoryId;
  final String noteId;
  final String oldTitle;
  final String oldDescription;

  UpdateNoteParams({
    required this.categoryId,
    required this.noteId,
    required this.oldTitle,
    required this.oldDescription,
  });
}