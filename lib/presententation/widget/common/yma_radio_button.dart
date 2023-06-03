import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';

class YMARadioButton extends StatelessWidget {
  const YMARadioButton({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    const double size = 28;

    return GestureDetector(
      child: Container(
        width: size,
        height: size,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColor.purple,
            width: 3,
          ),
        ),
        child: active
            ? Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.purple,
                ),
              )
            : null,
      ),
    );
  }
}
