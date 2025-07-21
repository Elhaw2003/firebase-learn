part of 'login_with_email_and_password_cubit.dart';

@immutable
sealed class LoginWithEmailAndPasswordState {}

final class LoginWithEmailAndPasswordInitialState extends LoginWithEmailAndPasswordState {}
final class LoginWithEmailAndPasswordLoadingState extends LoginWithEmailAndPasswordState {}
final class LoginWithEmailAndPasswordSuccessState extends LoginWithEmailAndPasswordState {}
final class LoginWithEmailAndPasswordFailureState extends LoginWithEmailAndPasswordState {
  final String message;
  LoginWithEmailAndPasswordFailureState({required this.message});
}
