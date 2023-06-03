import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';
import 'package:yomeanimo/presententation/widget/common/countries_list.dart';
import 'package:yomeanimo/presententation/widget/welcome/yma_country_card.dart';

class YMAExpansibleCountriesList extends StatefulWidget {
  const YMAExpansibleCountriesList();

  @override
  State<YMAExpansibleCountriesList> createState() => _YMAExpansibleCountriesListState();
}

class _YMAExpansibleCountriesListState extends State<YMAExpansibleCountriesList> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool isExpanded = true;
  bool showList = true;
  final duration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: duration,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final _countries = countriesList.map((c) => YMACountryCard(country: c)).toList();

    return AnimatedContainer(
      width: screen.width * .5,
      height: isExpanded ? 164 : 45,
      duration: duration,
      padding: isExpanded ? const EdgeInsets.all(15) : EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Stack(
        children: <Widget>[
          // last flag
          Visibility(
            visible: !showList,
            child: _countries.last,
          ),

          // List of countries
          Visibility(
            visible: isExpanded,
            child: Column(
              children: _countries,
            ),
          ),

          // Show list button
          GestureDetector(
            onTap: () async {
              if (animationController.isDismissed) {
                animationController.forward();
              } else {
                animationController.reverse();
              }

              setState(() => isExpanded = !isExpanded);
              await Future.delayed(duration);
              // if (!isExpanded) {
              //   setState(() => showList = false);
              // } else {  setState(() => showList = !showList); }
              setState(() => showList = !showList);
              // await Future.delayed(duration);
            },
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Container(
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(color: AppColor.white),
                child: AnimatedIcon(
                  progress: animationController,
                  icon: AnimatedIcons.close_menu,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
