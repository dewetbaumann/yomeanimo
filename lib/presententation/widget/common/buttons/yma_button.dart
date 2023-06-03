import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';

class YMAButton extends StatelessWidget {
  const YMAButton({
    required this.text,
    required this.onTap,
    this.width,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.style,
  });

  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final String text;
  final VoidCallback onTap;
  final double? width;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
          fixedSize: MaterialStateProperty.all(Size(width ?? 0, 0)),
          backgroundColor: MaterialStateProperty.all<Color>(AppColor.roseRed),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
