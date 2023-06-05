import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';
import 'package:yomeanimo/core/config/app_text_style.dart';

class YMAProfileQuality extends StatelessWidget {
  const YMAProfileQuality({required this.inverted});
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      width: 120,
      decoration: BoxDecoration(
        color: inverted ? AppColor.purpleLight : AppColor.grey,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(
              Icons.star,
              size: 15,
              color: inverted ? AppColor.roseRed : AppColor.purple,
            ),
          ),
          Text(
            'High Profile',
            style: AppTextStyle.normal.copyWith(
              color: inverted ? AppColor.white : AppColor.purple,
            ),
          ),
        ],
      ),
    );
  }
}
