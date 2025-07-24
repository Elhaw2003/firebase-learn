part of 'get_categories_cubit.dart';

@immutable
sealed class GetCategoriesState {}

final class GetCategoriesInitialState extends GetCategoriesState {}
final class GetCategoriesLoadingState extends GetCategoriesState {}
final class GetCategoriesFailureState extends GetCategoriesState {
  final String message;
  GetCategoriesFailureState({required this.message});
}
final class GetCategoriesSuccessState extends GetCategoriesState {
  final List<CategoryModel> categories;

  GetCategoriesSuccessState({required this.categories});
}
