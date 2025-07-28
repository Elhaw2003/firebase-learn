import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_learn/core/error/failure.dart';
import 'package:firebase_learn/core/utilies/collections.dart';
import 'package:firebase_learn/features/add_note/data/model/note_model.dart';
import 'package:firebase_learn/features/note/data/repo/get_note_repo/get_notes_repo.dart';

import '../../../../../core/utilies/app_texts.dart';

class GetNotesRepoFirebaseImplementation implements GetNotesRepo{
  @override
  Future<Either<Failure, List<NoteModel>>> getNotes({required String categoryId}) async{
    try{

      final response = await FirebaseFirestore.instance.collection(Collections.categories).doc(categoryId).collection(Collections.notes).orderBy("createdAt",descending: false).get();
      List<NoteModel> notes = response.docs.map((doc){
        return NoteModel.fromJson(doc.data());
      }).toList();

      return right(notes);

    }
    catch(e){
      return left(FirebaseFailure(message: AppTexts.exceptionFirebaseError));
    }
  }
}