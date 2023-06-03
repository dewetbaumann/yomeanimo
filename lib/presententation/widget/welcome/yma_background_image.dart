import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';
import 'package:yomeanimo/core/config/app_images.dart';

class YMABackgroundImage extends StatelessWidget {
  const YMABackgroundImage();

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Stack(
      children: [
        // Image
        Container(
          width: screen.width,
          height: screen.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.background),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Purple tone
        Container(
          width: screen.width,
          height: screen.height,
          decoration: BoxDecoration(
            color: AppColor.purple.withOpacity(.78),
          ),
        )
      ],
    );
  }
}
