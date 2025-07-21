import 'package:dartz/dartz.dart';
import 'package:firebase_learn/core/error/failure.dart';

abstract class LoginWithEmailAndPasswordRepo {
  Future<Either<Failure, void>> loginWithEmailAndPassword({required String email, required String password});
}