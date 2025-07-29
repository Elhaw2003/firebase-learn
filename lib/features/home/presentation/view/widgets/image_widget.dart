import 'dart:io';

import 'package:firebase_learn/features/home/presentation/controller/cubit/pick_image/pick_image_cubit.dart';
import 'package:firebase_learn/features/home/presentation/view/widgets/sheet_bottom_pick_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilies/app_colors.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<PickImageCubit, PickImageState>(
        builder: (context, state) {
          var imageCubit = BlocProvider.of<PickImageCubit>(context);
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  showBottomSheet(
                    backgroundColor: AppColors.borderTextFieldColor,
                    context: context,
                    builder: (context) =>  SheetBottomPickImageWidget(pickImageCubit: imageCubit,),
                  );
                },
                child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(80),
                        border: Border.all(color: AppColors.primaryColor)),
                    child: imageCubit.image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Image.file(
                              File(imageCubit.image!.path),
                              fit: BoxFit.fill,
                            ))
                        : const Icon(
                            Icons.add_a_photo,
                            size: 50,
                            color: AppColors.primaryColor,
                          )),
              )
            ],
          );
        },
      ),
    );
  }
}
//: ClipRRect(
//                 borderRadius: BorderRadius.circular(80),
//                 child: Image.file(
//                   File(imageCubit.image!.path),
//                   fit: BoxFit.cover,
//                 )),
