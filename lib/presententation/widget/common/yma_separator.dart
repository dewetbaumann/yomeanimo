import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';

class YMASeparator extends StatelessWidget {
  const YMASeparator({required this.inverted});
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 10),
      width: screen.width,
      height: 3,
      color: inverted ? AppColor.white : AppColor.purple,
    );
  }
}
