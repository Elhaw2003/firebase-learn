import 'package:dartz/dartz.dart';
import 'package:firebase_learn/core/error/failure.dart';

import '../../../../add_note/data/model/note_model.dart';

abstract class GetNotesRepo {
  Future<Either<Failure, List<NoteModel>>> getNotes({required String categoryId});
}