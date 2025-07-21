import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failure.dart';

abstract class LoginWithGoogleRepo {
  Future<Either<Failure, void>> loginWithGoogle();
}