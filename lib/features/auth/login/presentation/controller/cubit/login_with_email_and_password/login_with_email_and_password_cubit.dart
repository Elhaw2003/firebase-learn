import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/repo/login_with_email_and_password/login_with_email_and_password_repo.dart';

part 'login_with_email_and_password_state.dart';

class LoginWithEmailAndPasswordCubit extends Cubit<LoginWithEmailAndPasswordState> {
  LoginWithEmailAndPasswordCubit({required this.loginRepo}) : super(LoginWithEmailAndPasswordInitialState());
  final LoginWithEmailAndPasswordRepo loginRepo;
  Future<void> loginWithEmailAndPasswordCubit({required String email, required String password}) async{
    emit(LoginWithEmailAndPasswordLoadingState());
    var result = await loginRepo.loginWithEmailAndPassword(email: email, password: password);
    return result.fold((left) => emit(LoginWithEmailAndPasswordFailureState(message: left.message)), (right) => emit(LoginWithEmailAndPasswordSuccessState()));
  }
}
