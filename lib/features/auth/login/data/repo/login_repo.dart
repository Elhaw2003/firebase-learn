import 'package:dartz/dartz.dart';
import 'package:firebase_learn/core/error/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, void>> login({required String email, required String password});
}