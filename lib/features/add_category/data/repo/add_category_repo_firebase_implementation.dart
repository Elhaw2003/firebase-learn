import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_learn/core/error/failure.dart';
import 'package:firebase_learn/core/utilies/app_texts.dart';
import 'package:firebase_learn/features/add_category/data/model/category_model.dart';
import 'package:firebase_learn/features/add_category/data/repo/add_category_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/utilies/collections.dart';
class AddCategoryRepoFirebaseImplementation implements AddCategoryRepo{
  @override
  Future<Either<Failure, void>> addCategory({required CategoryModel categoryModel}) async{
    try{
      await FirebaseFirestore.instance.collection(Collections.categories).add(categoryModel.toJson());
      return right(null);
    } on SocketException {
      return left(FirebaseFailure(message: AppTexts.noInternetConnection));
    }catch(e){
      return left(FirebaseFailure(message: AppTexts.exceptionFirebaseError));
    }
  }
}