import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_learn/core/error/failure.dart';
import 'package:firebase_learn/core/utilies/collections.dart';
import 'package:firebase_learn/features/update_note/data/repo/update_note_repo.dart';

import '../../../../core/utilies/app_texts.dart';
import '../../../add_note/data/model/note_model.dart';

class UpdateNoteRepoFirebaseImplementation implements UpdateNoteRepo{
  @override
  Future<Either<Failure, void>> updateNoteRepo({required String categoryId,required NoteModel noteModel}) async{

    try{

      await FirebaseFirestore.instance.collection(Collections.categories).doc(categoryId).collection(Collections.notes).doc(noteModel.noteId).update(noteModel.toJson());

      return right(null);


    }



    catch(e){
      return left(FirebaseFailure(message: AppTexts.exceptionFirebaseError));
    }


  }
}