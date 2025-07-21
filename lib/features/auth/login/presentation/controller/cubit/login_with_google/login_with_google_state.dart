part of 'login_with_google_cubit.dart';

@immutable
sealed class LoginWithGoogleState {}

final class LoginWithGoogleInitialState extends LoginWithGoogleState {}
final class LoginWithGoogleLoadingState extends LoginWithGoogleState {}
final class LoginWithGoogleFailureState extends LoginWithGoogleState {
  final String message;
  LoginWithGoogleFailureState({required this.message});
}
final class LoginWithGoogleSuccessState extends LoginWithGoogleState {}
