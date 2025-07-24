import 'package:bloc/bloc.dart';
import 'package:firebase_learn/features/add_category/data/model/category_model.dart';
import 'package:firebase_learn/features/home/data/repo/get_categories/get_categories_repo.dart';
import 'package:meta/meta.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit({required this.getCategoriesRepo}) : super(GetCategoriesInitialState());
  final GetCategoriesRepo getCategoriesRepo;
  Future<void> getCategoriesCubit()async{
    emit(GetCategoriesLoadingState());
    var result =await getCategoriesRepo.getCategories();
    return result.fold(
            (left){
              emit(GetCategoriesFailureState(message: left.message));
            },
            (right){
              emit(GetCategoriesSuccessState(categories: right));
            }
    );
  }
}
