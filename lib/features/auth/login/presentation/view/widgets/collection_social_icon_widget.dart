import 'package:flutter/material.dart';

import '../../../../../../generated/assets.dart';
import '../../../../widget/social_icon_widget.dart';

class CollectionSocialIconWidget extends StatelessWidget {
  const CollectionSocialIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SocialIconWidget(iconPath: Assets.iconsFacebookIcon),
      SocialIconWidget(iconPath: Assets.iconsGoogleIcon),
      SocialIconWidget(iconPath: Assets.iconsCibAppleIcon),
    ],
    );
  }
}
