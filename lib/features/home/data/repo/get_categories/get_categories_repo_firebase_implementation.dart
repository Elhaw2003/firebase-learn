import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learn/core/error/failure.dart';
import 'package:firebase_learn/core/utilies/collections.dart';
import 'package:firebase_learn/features/add_category/data/model/category_model.dart';
import 'package:firebase_learn/features/home/data/repo/get_categories/get_categories_repo.dart';

import '../../../../../core/utilies/app_texts.dart';

class GetCategoriesRepoFirebaseImplementation implements GetCategoriesRepo {
  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(Collections.categories)
          .orderBy("createdAt", descending: false)
          .where("userId",isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      List<CategoryModel> categories = querySnapshot.docs.map((doc) {
        return CategoryModel.fromJson(doc);
      }).toList();
      return right(categories);
    } on SocketException {
      return left(FirebaseFailure(message: AppTexts.noInternetConnection));
    } catch (e) {
      print(e.toString());
      return left(FirebaseFailure(message: e.toString()));
    }
  }
}
