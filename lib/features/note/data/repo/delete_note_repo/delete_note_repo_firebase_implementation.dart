import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:firebase_learn/core/error/failure.dart';

import '../../../../../core/utilies/app_texts.dart';
import '../../../../../core/utilies/collections.dart';
import 'delete_note_repo.dart';

class DeleteNoteRepoFirebaseImplementation implements DeleteNoteRepo{
  @override
  Future<Either<Failure, void>> deleteNote({required String noteId, required String categoryId}) async{


    try{

      await FirebaseFirestore.instance.collection(Collections.categories).doc(categoryId).collection(Collections.notes).doc(noteId).delete();

      return right(null);



    }

    catch(e){

      return left(FirebaseFailure(message: AppTexts.exceptionFirebaseError));
    }


  }
}