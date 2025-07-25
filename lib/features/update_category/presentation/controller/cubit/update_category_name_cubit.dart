import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../add_category/data/model/category_model.dart';
import '../../../data/repo/update_category_name_repo.dart';


part 'update_category_name_state.dart';

class UpdateCategoryNameCubit extends Cubit<UpdateCategoryNameState> {
  UpdateCategoryNameCubit({required this.updateCategoryNameRepo}) : super(UpdateCategoryNameInitialState());
  final UpdateCategoryNameRepo updateCategoryNameRepo;

  Future<void> updateCategoryNameCubit({required CategoryModel categoryModel})async{

    emit(UpdateCategoryNameLoadingState());

    var result = await updateCategoryNameRepo.updateCategoryName(categoryModel: categoryModel);
    return result.fold((left) {
      emit(UpdateCategoryNameFailureState(errorMessage: left.message));
    }, (right) {
      emit(UpdateCategoryNameSuccessState());
    });

  }
}
