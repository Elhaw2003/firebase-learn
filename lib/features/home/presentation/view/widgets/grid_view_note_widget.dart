import 'package:firebase_learn/features/add_category/data/model/category_model.dart';
import 'package:firebase_learn/features/home/presentation/view/widgets/item_grid_view_categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewNoteWidget extends StatelessWidget {
  const GridViewNoteWidget({super.key, required this.categories});
  final List<CategoryModel> categories ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.w),
      child: GridView.builder(
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return ItemGridViewCategoriesWidget(categoryModel: categories[index]);
        },
      ),
    );
  }
}
