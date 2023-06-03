import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';

abstract class AppTextStyle {
  static const small = TextStyle(color: AppColor.black, fontSize: 12);
  static const normal = TextStyle(color: AppColor.black, fontSize: 14);
  static const subtitle = TextStyle(color: AppColor.black, fontSize: 16, fontWeight: FontWeight.w600);
  static const title = TextStyle(color: AppColor.black, fontSize: 18, fontWeight: FontWeight.bold);
  static const emphasis = TextStyle(color: AppColor.black, fontSize: 20, fontWeight: FontWeight.w900);
}
