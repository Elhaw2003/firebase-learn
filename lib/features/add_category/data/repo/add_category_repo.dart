import 'package:dartz/dartz.dart';
import 'package:firebase_learn/core/error/failure.dart';
import 'package:firebase_learn/features/add_category/data/model/category_model.dart';

abstract class AddCategoryRepo{
  Future<Either<Failure,void>> addCategory({required CategoryModel categoryModel});
}