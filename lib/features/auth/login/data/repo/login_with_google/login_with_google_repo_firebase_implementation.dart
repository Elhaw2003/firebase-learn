import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learn/core/error/failure.dart';
import 'package:firebase_learn/core/utilies/app_texts.dart';
import 'package:firebase_learn/features/auth/login/data/repo/login_with_google/login_with_google_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginWithGoogleRepoFirebaseImplementation implements LoginWithGoogleRepo {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Future<Either<Failure, void>> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return left(FirebaseFailure(message: 'Google sign-in was cancelled by the user.'));
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        return left(FirebaseFailure(message: 'Failed to retrieve authentication tokens from Google.'));
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      return right(null);
    } on SocketException {
      return left(FirebaseFailure(message: AppTexts.noInternetConnection));
    } catch (e) {
      return left(FirebaseFailure(message: AppTexts.exceptionFirebaseError));
    }
  }
}
