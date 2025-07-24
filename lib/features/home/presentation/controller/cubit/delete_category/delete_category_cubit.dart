import 'package:bloc/bloc.dart';
import 'package:firebase_learn/features/home/data/repo/delete_category/delete_category_repo.dart';
import 'package:meta/meta.dart';

part 'delete_category_state.dart';

class DeleteCategoryCubit extends Cubit<DeleteCategoryState> {
  DeleteCategoryCubit({required this.deleteCategoryRepo}) : super(DeleteCategoryInitialState());
 final DeleteCategoryRepo deleteCategoryRepo;
 Future<void> deleteCategory({required String id})async{
   emit(DeleteCategoryLoadingState());
   var result =await deleteCategoryRepo.deleteCategory(id: id);
   return result.fold((left) {
     emit(DeleteCategoryFailureState(message: left.message));
   }, (right) {
     emit(DeleteCategorySuccessState());
   });
 }
}
