import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';
import 'package:yomeanimo/core/config/app_text_style.dart';

class YMAButtonSlider extends StatefulWidget {
  const YMAButtonSlider();

  @override
  State<YMAButtonSlider> createState() => _YMAButtonSliderState();
}

class _YMAButtonSliderState extends State<YMAButtonSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _YMAButtonSliderItem(
          text: 'Todos',
          action: () => setState(() => currentIndex = 0),
          index: 0,
          currentIndex: currentIndex,
        ),
        _YMAButtonSliderItem(
          text: 'Destino',
          action: () => setState(() => currentIndex = 1),
          index: 1,
          currentIndex: currentIndex,
        ),
      ],
    );
  }
}

class _YMAButtonSliderItem extends StatelessWidget {
  const _YMAButtonSliderItem({
    required this.text,
    required this.action,
    required this.currentIndex,
    required this.index,
  });

  final String text;
  final VoidCallback action;
  final int index;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              style: AppTextStyle.title.copyWith(fontWeight: FontWeight.w600, color: AppColor.purple),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .35,
              margin: const EdgeInsets.only(top: 10),
              height: 5,
              color: currentIndex == index ? AppColor.purple : AppColor.white,
            ),
          ],
        ),
      ),
    );
  }
}
