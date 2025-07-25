import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../add_category/data/model/category_model.dart';

abstract class UpdateCategoryNameRepo {
  Future<Either<Failure, void>> updateCategoryName({required CategoryModel categoryModel});
}