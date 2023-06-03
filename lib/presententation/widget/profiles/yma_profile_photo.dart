import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';
import 'package:yomeanimo/core/config/app_text_style.dart';

class YMAProfilePhoto extends StatelessWidget {
  const YMAProfilePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 129,
      height: 138,
      decoration: BoxDecoration(color: AppColor.purple),
      child: Center(
        child: Text(
          'Foto',
          style: AppTextStyle.title.copyWith(color: AppColor.white),
        ),
      ),
    );
  }
}
