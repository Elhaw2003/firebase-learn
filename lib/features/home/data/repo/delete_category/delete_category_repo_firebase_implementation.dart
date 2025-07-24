import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:firebase_learn/core/error/failure.dart';
import 'package:firebase_learn/core/utilies/app_texts.dart';
import 'package:firebase_learn/core/utilies/collections.dart';

import 'delete_category_repo.dart';

class DeleteCategoryRepoFirebaseImplementation implements DeleteCategoryRepo{
  @override
  Future<Either<Failure, void>> deleteCategory({required String id}) async{
    try{
      await FirebaseFirestore.instance.collection(Collections.categories).doc(id).delete();
      return right(null);
    }catch(e){
      return left(FirebaseFailure(message: AppTexts.exceptionFirebaseError));
    }
  }
}