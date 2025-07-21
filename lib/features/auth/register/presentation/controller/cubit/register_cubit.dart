import 'package:bloc/bloc.dart';
import 'package:firebase_learn/features/auth/register/data/repo/register_repo.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerRepo}) : super(RegisterInitialState());
  final RegisterRepo registerRepo;
  Future<void> registerCubit({required String email, required String password}) async {
    emit(RegisterLoadingState());
    var result = await registerRepo.register(email: email, password: password);
    return result.fold(
            (left){
              emit(RegisterFailureState(message: left.message));
            },
            (right){
              emit(RegisterSuccessState());
            }
    );
  }
}
