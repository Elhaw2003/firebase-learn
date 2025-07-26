import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_learn/core/error/failure.dart';
import 'package:firebase_learn/core/utilies/collections.dart';
import 'package:firebase_learn/features/add_category/data/model/category_model.dart';
import 'package:firebase_learn/features/update_category/data/repo/update_category_name_repo.dart';

import '../../../../../core/utilies/app_texts.dart';

class UpdateCategoryNameRepoFirebaseImplementation implements UpdateCategoryNameRepo {
  @override
  Future<Either<Failure, void>> updateCategoryName({required CategoryModel categoryModel}) async{

    try{

    var response  = await FirebaseFirestore.instance.collection(Collections.categories);

    response.doc(categoryModel.categoryId).update(categoryModel.toJson());
    return right(null);
    }catch(e){
      return left(FirebaseFailure(message: AppTexts.exceptionFirebaseError));
    }

  }
}
// set => add ===========> documentId not found
// set => update ===========> documentId found
// set => {
//   merge == false ============> field is deleted  because it delete userId
//
//   merge == true ============> field not deleted  ==> (update)
//
// }