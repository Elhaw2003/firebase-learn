import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_learn/core/error/failure.dart';
import 'package:firebase_learn/core/utilies/collections.dart';
import 'package:firebase_learn/features/add_category/data/model/category_model.dart';
import 'package:firebase_learn/features/home/data/repo/get_categories/get_categories_repo.dart';

import '../../../../../core/utilies/app_texts.dart';

class GetCategoriesRepoFirebaseImplementation implements GetCategoriesRepo{
  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async{
    try{

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(Collections.categories).get();

      List<CategoryModel>categories = querySnapshot.docs.map((doc){
        return CategoryModel.fromJson(doc.data() as Map<String,dynamic>);
      }).toList();
      return right(categories);
    }
    on SocketException {
      return left(FirebaseFailure(message: AppTexts.noInternetConnection));
    }
    catch(e){
      return left(FirebaseFailure(message: AppTexts.exceptionFirebaseError));
    }
  }
}