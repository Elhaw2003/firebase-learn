import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../model/note_model.dart';

abstract class AddNoteRepo {
  Future<Either<Failure, void>> addNote({required NoteModel noteModel, required String categoryId});
}