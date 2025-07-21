import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learn/core/error/failure.dart';
import 'package:firebase_learn/core/utilies/app_texts.dart';
import 'package:firebase_learn/features/auth/login/data/repo/forgot_password/forgot_password_repo.dart';

class ForgotPasswordRepoFirebaseImplementation implements ForgotPasswordRepo{
  @override
  Future<Either<Failure, void>> forgotPassword({required String email}) async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return right(null);
    }on SocketException {
      return left(FirebaseFailure(message: AppTexts.noInternetConnection));
    }
    catch (e){
      print(e.toString());
      return left(FirebaseFailure(message: AppTexts.exceptionFirebaseError));
    }
  }
}