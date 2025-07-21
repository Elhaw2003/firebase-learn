part of 'forgot_password_firebase_cubit.dart';

@immutable
sealed class ForgotPasswordFirebaseState {}

final class ForgotPasswordFirebaseInitialState extends ForgotPasswordFirebaseState {}
final class ForgotPasswordFirebaseLoadingState extends ForgotPasswordFirebaseState {}
final class ForgotPasswordFirebaseFailureState extends ForgotPasswordFirebaseState {
  final String message;
  ForgotPasswordFirebaseFailureState({required this.message});
}
final class ForgotPasswordFirebaseSuccessState extends ForgotPasswordFirebaseState {}
