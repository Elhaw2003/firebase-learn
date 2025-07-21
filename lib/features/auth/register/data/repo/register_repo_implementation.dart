import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learn/core/error/failure.dart';
import 'package:firebase_learn/core/utilies/app_texts.dart';
import 'package:firebase_learn/features/auth/register/data/repo/register_repo.dart';

class RegisterRepoFirebaseImplementation implements RegisterRepo{
  @override
  Future<Either<Failure, void>> register({required String email, required String password}) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(null);
    } on SocketException catch (e) {
      return left(FirebaseFailure(message: AppTexts.noInternetConnection));
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(FirebaseFailure(message: AppTexts.passwordIsWeek));
      } else if (e.code == 'email-already-in-use') {
        return left(FirebaseFailure(message: AppTexts.emailIsAlreadyInUse));
      }
      else{
        return left(FirebaseFailure(message: AppTexts.exceptionFirebaseError));
      }
    } catch (e) {
      return left(FirebaseFailure(message: AppTexts.exceptionFirebaseError));
    }
  }
}