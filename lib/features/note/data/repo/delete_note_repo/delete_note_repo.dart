import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';

abstract class DeleteNoteRepo{
  Future<Either<Failure, void>> deleteNote({required String noteId, required String categoryId});
}