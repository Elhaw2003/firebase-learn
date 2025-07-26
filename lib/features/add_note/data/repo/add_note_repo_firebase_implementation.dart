import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:firebase_learn/core/error/failure.dart';
import 'package:firebase_learn/core/utilies/collections.dart';

import 'package:firebase_learn/features/add_note/data/model/note_model.dart';

import '../../../../core/utilies/app_texts.dart';
import 'add_note_repo.dart';

class AddNoteRepoFirebaseImplementation  implements AddNoteRepo{
  @override
  Future<Either<Failure, void>> addNote({required NoteModel noteModel, required String categoryId}) async{
    try{

      await FirebaseFirestore.instance.collection(Collections.categories).doc(categoryId).collection(Collections.notes).add(noteModel.toJson());

      return right(null);
    }

    catch(e){
      return left(FirebaseFailure(message: AppTexts.exceptionFirebaseError));
    }
  }
}