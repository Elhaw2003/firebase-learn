import 'package:firebase_learn/core/widgets/custom_lottie_widget.dart';
import 'package:firebase_learn/features/add_category/data/model/category_model.dart';
import 'package:firebase_learn/features/home/presentation/view/widgets/item_stack_grid_view_categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../../core/utilies/app_texts.dart';
import '../../../../../generated/assets.dart';

class GridViewNoteWidget extends StatelessWidget {
  const GridViewNoteWidget({super.key, required this.categories});
  final List<CategoryModel> categories ;
  @override
  Widget build(BuildContext context) {
    return categories.isEmpty ?
    const Center(child: CustomLottieWidget(name: Assets.lottiesNoCategoryData))
        : GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredGrid(
          columnCount: 2,
          delay: const Duration(milliseconds: 500),
          position: index,
          duration: const Duration(milliseconds: 375),
          child: SlideAnimation(
            verticalOffset: 200.0,
            child: FadeInAnimation(
              child: ItemStackGridViewCategoriesWidget(categoryModel: categories[index],),
            ),
          ),
        );
      },
    );
  }
}
