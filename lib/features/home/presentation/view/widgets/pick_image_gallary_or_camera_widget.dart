import 'package:flutter/material.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/widgets/spacing_widget.dart';

class PickImageGalleryOrCameraWidget extends StatelessWidget {
  const PickImageGalleryOrCameraWidget({super.key, required this.onTap, required this.icon, required this.title});
  final VoidCallback onTap;
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: Icon(icon, size: 40, color: AppColors.primaryColor),
          trailing: Text(title, style: const TextStyle(color: AppColors.primaryColor,fontSize: 16)),
        )
      ),
    );
  }
}
// Icon(icon, size: 40, color: AppColors.primaryColor),
//             Text(title, style: const TextStyle(color: AppColors.primaryColor)),
