import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';
import 'package:yomeanimo/core/config/app_text_style.dart';

class YMACustomerName extends StatelessWidget {
  const YMACustomerName({required this.name, required this.inverted});
  final String name;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              'Customer Name',
              style: AppTextStyle.title.copyWith(
                color: inverted ? AppColor.white : AppColor.purple,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(
            'Juliana Pichot',
            style: AppTextStyle.emphasis.copyWith(
              color: inverted ? AppColor.white : AppColor.purple,
            ),
          ),
        ],
      ),
    );
  }
}
