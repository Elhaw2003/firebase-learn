import 'package:dartz/dartz.dart';
import 'package:firebase_learn/core/error/failure.dart';

abstract class RegisterRepo {
Future<Either<Failure, void>> register({required String email, required String password});
}