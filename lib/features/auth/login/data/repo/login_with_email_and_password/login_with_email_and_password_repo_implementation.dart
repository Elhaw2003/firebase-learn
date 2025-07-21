import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_learn/core/error/failure.dart';
import 'package:firebase_learn/core/utilies/app_texts.dart';

import 'login_with_email_and_password_repo.dart';

class LoginWithEmailAndPasswordRepoFirebaseImplementation implements LoginWithEmailAndPasswordRepo{
  @override
  Future<Either<Failure, void>> loginWithEmailAndPassword({required String email, required String password}) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
      );
      if(credential.user!.emailVerified == false){
        return left(FirebaseFailure(message: AppTexts.pleaseVerifyYourEmail));
      }
      return right(null);
    } on SocketException catch (e) {
      return left(FirebaseFailure(message: AppTexts.noInternetConnection));
    }
    on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found' || e.code == 'invalid-credential') {
        return left(FirebaseFailure(message: AppTexts.noUserFound));
      } else if (e.code == 'wrong-password' || e.code == 'invalid-credential') {
        return left(FirebaseFailure(message: AppTexts.wrongPassword));
      }
      else{
        print(e.toString());
        return left(FirebaseFailure(message: e.toString()));
      }
    } catch (e) {
      print(e.toString());
      return left(FirebaseFailure(message: "Ops something went wrong....."));
    }
  }
}