import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failure.dart';

abstract class ForgotPasswordRepo {
  Future<Either<Failure, void>> forgotPassword({required String email});
}