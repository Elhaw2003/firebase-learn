import 'package:firebase_learn/core/widgets/custom_failure_widget.dart';
import 'package:firebase_learn/core/widgets/spacing_widget.dart';
import 'package:firebase_learn/features/home/presentation/controller/cubit/get_categories/get_categories_cubit.dart';
import 'package:firebase_learn/features/home/presentation/view/widgets/grid_view_note_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilies/app_colors.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
      builder: (context, state) {
        return Column(
          children: [
            const HeightSpacing(height: 30),
            Expanded(
                child: state is GetCategoriesLoadingState
                       ? const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),)
                       : state is GetCategoriesSuccessState ? GridViewNoteWidget(categories: state.categories,)
                       :state is GetCategoriesFailureState ?  Center(child: CustomFailureWidget(message:state.message),)
                       :const SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }
}
