import 'dart:io';

import 'package:firebase_learn/core/widgets/spacing_widget.dart';
import 'package:firebase_learn/features/home/presentation/controller/cubit/pick_image/pick_image_cubit.dart';
import 'package:firebase_learn/features/home/presentation/view/widgets/pick_image_gallary_or_camera_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class SheetBottomPickImageWidget extends StatelessWidget {
  const SheetBottomPickImageWidget({super.key, required this.pickImageCubit});
  final PickImageCubit pickImageCubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const HeightSpacing(height: 20),
          PickImageGalleryOrCameraWidget(onTap: (){
            pickImageCubit.pickImage(ImageSource.gallery);
          }, icon: Icons.photo_outlined, title: "Gallery",),
          const HeightSpacing(height: 20),
          PickImageGalleryOrCameraWidget(onTap: (){
            pickImageCubit.pickImage(ImageSource.camera);
          }, icon: Icons.camera_alt_outlined, title: "Camera",),
          const HeightSpacing(height: 20)
        ],
      ),
    );
  }
}
