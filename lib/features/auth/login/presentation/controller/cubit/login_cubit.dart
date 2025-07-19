import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitialState());
  final LoginRepo loginRepo;
  void loginCubit({required String email, required String password}) async{
    emit(LoginLoadingState());
    var result = await loginRepo.login(email: email, password: password);
    return result.fold((left) => emit(LoginFailureState(message: left.message)), (right) => emit(LoginSuccessState()));
  }
}
