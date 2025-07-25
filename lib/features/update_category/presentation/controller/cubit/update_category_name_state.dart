part of 'update_category_name_cubit.dart';

@immutable
sealed class UpdateCategoryNameState {}

final class UpdateCategoryNameInitialState extends UpdateCategoryNameState {}
final class UpdateCategoryNameLoadingState extends UpdateCategoryNameState {}
final class UpdateCategoryNameFailureState extends UpdateCategoryNameState {
  final String errorMessage;
  UpdateCategoryNameFailureState({required this.errorMessage});
}
final class UpdateCategoryNameSuccessState extends UpdateCategoryNameState {}
