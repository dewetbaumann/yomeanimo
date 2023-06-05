import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';
import 'package:yomeanimo/presententation/widget/common/yma_radio_button.dart';
import 'package:yomeanimo/presententation/widget/profiles/yma_name_and_profession.dart';
import 'package:yomeanimo/presententation/widget/profiles/yma_profile_photo.dart';

class YMAProfileCard extends StatelessWidget {
  const YMAProfileCard({
    required this.index,
    required this.onTap,
    required this.currentIndex,
  });
  final int index;
  final int currentIndex;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 138,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
        color: Colors.transparent,
        child: Stack(
          children: [
            Row(
              children: [
                YMAProfilePhoto(),
                YMANameAndProfession(),
                Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: YMARadioButton(active: index == currentIndex),
                ),
              ],
            ),
            if (index == currentIndex) _GreyBlur()
          ],
        ),
      ),
    );
  }
}

class _GreyBlur extends StatelessWidget {
  const _GreyBlur();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 138,
      decoration: BoxDecoration(
        color: AppColor.grey.withOpacity(.5),
      ),
    );
  }
}
