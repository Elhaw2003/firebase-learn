import 'package:bloc/bloc.dart';
import 'package:firebase_learn/features/add_category/data/repo/add_category_repo.dart';
import 'package:meta/meta.dart';
import '../../../data/model/category_model.dart';

part 'add_category_state.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit({required this.addCategoryRepo}) : super(AddCategoryInitialState());
  final AddCategoryRepo addCategoryRepo;
  Future<void> addCategoryCubit({required CategoryModel categoryModel})async{
    emit(AddCategoryLoadingState());
    var result = await addCategoryRepo.addCategory(categoryModel: categoryModel);
    return result.fold(
            (left){
              emit(AddCategoryFailureState(message: left.message));
            },
            (right){
              emit(AddCategorySuccessState());
            }
    );
  }
}
