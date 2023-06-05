import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';
import 'package:yomeanimo/presententation/widget/common/yma_separator.dart';
import 'package:yomeanimo/presententation/widget/profile/yma_customer_name.dart';
import 'package:yomeanimo/presententation/widget/profile/yma_profile_quality.dart';
import 'package:yomeanimo/presententation/widget/profile/yma_title_text.dart';

class YMAProfileDescription extends StatelessWidget {
  const YMAProfileDescription({
    required this.name,
    required this.profesion,
    required this.company,
    required this.notes,
    required this.inverted,
  });

  final String name;
  final String profesion;
  final String company;
  final String notes;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Container(
      width: screen.width,
      height: screen.height - 435,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: inverted ? AppColor.purple : AppColor.white),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            YMACustomerName(name: name, inverted: inverted),
            YMAProfileQuality(inverted: inverted),
            YMATitleText(title: 'Profesión', text: profesion, inverted: inverted),
            YMATitleText(title: 'Company', text: company, inverted: inverted),
            YMASeparator(inverted: inverted),
            YMATitleText(title: 'Notes', text: notes, emphasis: false, inverted: inverted),
          ],
        ),
      ),
    );
  }
}
