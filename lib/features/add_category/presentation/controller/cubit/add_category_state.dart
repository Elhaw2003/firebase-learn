part of 'add_category_cubit.dart';

@immutable
sealed class AddCategoryState {}

final class AddCategoryInitialState extends AddCategoryState {}
final class AddCategoryLoadingState extends AddCategoryState {}
final class AddCategoryFailureState extends AddCategoryState {
  final String message;

  AddCategoryFailureState({required this.message});
}
final class AddCategorySuccessState extends AddCategoryState {}
