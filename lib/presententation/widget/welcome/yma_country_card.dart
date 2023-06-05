import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';
import 'package:yomeanimo/core/config/app_text_style.dart';
import 'package:yomeanimo/models/country_model.dart';

class YMACountryCard extends StatelessWidget {
  const YMACountryCard({required this.country, required this.onTap});

  final Country country;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: <Widget>[
            Image.asset(
              country.image,
              width: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                country.name,
                style: AppTextStyle.normal.copyWith(
                  color: AppColor.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
