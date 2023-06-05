import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';

class YMAButtonStar extends StatelessWidget {
  const YMAButtonStar({required this.onTap, this.inverted = false});
  final VoidCallback onTap;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: inverted ? AppColor.white : AppColor.roseRed,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            inverted ? Icons.check : Icons.star,
            color: !inverted ? AppColor.white : AppColor.roseRed,
            size: 45,
          ),
        ),
      ),
    );
  }
}
