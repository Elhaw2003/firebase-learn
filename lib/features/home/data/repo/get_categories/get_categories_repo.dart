import 'package:dartz/dartz.dart';
import 'package:firebase_learn/core/error/failure.dart';
import 'package:firebase_learn/features/add_category/data/model/category_model.dart';

abstract class GetCategoriesRepo {
  Future<Either<Failure,List<CategoryModel>>> getCategories();
}