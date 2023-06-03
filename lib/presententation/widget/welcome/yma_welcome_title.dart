import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';
import 'package:yomeanimo/core/config/app_text_style.dart';

class YMAWelcomeTitle extends StatelessWidget {
  const YMAWelcomeTitle();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Empieza a buscar',
          style: AppTextStyle.subtitle.copyWith(color: AppColor.white),
        ),
        Text(
          'YoMeAnimers!',
          style: AppTextStyle.emphasis.copyWith(color: AppColor.white),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: Text(
            '¿Qué destino te interesa?',
            style: AppTextStyle.small.copyWith(
              color: AppColor.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
