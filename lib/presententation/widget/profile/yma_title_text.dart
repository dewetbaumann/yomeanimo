import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';
import 'package:yomeanimo/core/config/app_text_style.dart';

class YMATitleText extends StatelessWidget {
  const YMATitleText({
    required this.title,
    required this.text,
    this.emphasis = true,
    required this.inverted,
  });

  final String title;
  final String text;
  final bool emphasis;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              title,
              style: emphasis
                  ? AppTextStyle.normal.copyWith(
                      color: inverted ? AppColor.purpleLight : AppColor.greyLight2,
                      fontWeight: FontWeight.w400,
                    )
                  : AppTextStyle.small.copyWith(
                      color: inverted ? AppColor.purpleLight : AppColor.greyLight2,
                    ),
            ),
          ),
          Text(
            text,
            style: emphasis
                ? AppTextStyle.subtitle.copyWith(
                    color: inverted ? AppColor.white : AppColor.purple,
                    fontWeight: FontWeight.w400,
                  )
                : AppTextStyle.normal.copyWith(
                    color: inverted ? AppColor.white : AppColor.purple,
                  ),
          ),
        ],
      ),
    );
  }
}
