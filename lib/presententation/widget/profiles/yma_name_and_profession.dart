import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';
import 'package:yomeanimo/core/config/app_text_style.dart';

class YMANameAndProfession extends StatelessWidget {
  const YMANameAndProfession();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Nombre y apellido',
            style: AppTextStyle.emphasis.copyWith(
              color: AppColor.purple,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Text(
          'Profesión',
          style: AppTextStyle.subtitle.copyWith(
            color: AppColor.purple,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
