import 'package:bloc/bloc.dart';
import 'package:firebase_learn/features/auth/login/data/repo/login_with_google/login_with_google_repo.dart';
import 'package:meta/meta.dart';

part 'login_with_google_state.dart';

class LoginWithGoogleCubit extends Cubit<LoginWithGoogleState> {
  LoginWithGoogleCubit({required this.loginWithGoogleRepo}) : super(LoginWithGoogleInitialState());
  LoginWithGoogleRepo loginWithGoogleRepo;
  Future<void> loginWithGoogleCubit()async{
    emit(LoginWithGoogleLoadingState());
    var result = await loginWithGoogleRepo.loginWithGoogle();
    return result.fold(
            (left){
              emit(LoginWithGoogleFailureState(message: left.message));
            },
            (right){
              emit(LoginWithGoogleSuccessState());
            });
  }
}
