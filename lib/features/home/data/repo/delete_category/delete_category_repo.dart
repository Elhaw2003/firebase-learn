import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';

abstract class DeleteCategoryRepo {
  Future<Either<Failure, void>> deleteCategory({required String id});
}