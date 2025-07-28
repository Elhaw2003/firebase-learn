import 'package:dartz/dartz.dart';
import 'package:firebase_learn/core/error/failure.dart';
import 'package:firebase_learn/features/add_note/data/model/note_model.dart';

abstract class UpdateNoteRepo {
  Future<Either<Failure, void>> updateNoteRepo({required String categoryId,required NoteModel noteModel});
}