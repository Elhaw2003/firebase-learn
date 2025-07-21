import 'package:bloc/bloc.dart';
import 'package:firebase_learn/features/auth/login/data/repo/forgot_password/forgot_password_repo.dart';
import 'package:meta/meta.dart';

part 'forgot_password_firebase_state.dart';

class ForgotPasswordFirebaseCubit extends Cubit<ForgotPasswordFirebaseState> {
  ForgotPasswordFirebaseCubit({required this.forgotPasswordRepo}) : super(ForgotPasswordFirebaseInitialState());
  ForgotPasswordRepo forgotPasswordRepo;
  Future<void> forgotPasswordCubit({required String email})async{
     emit(ForgotPasswordFirebaseLoadingState());
    var result = await forgotPasswordRepo.forgotPassword(email: email);
    return result.fold((left) => emit(ForgotPasswordFirebaseFailureState(message: left.message)), (right) => emit(ForgotPasswordFirebaseSuccessState()));
  }
}
