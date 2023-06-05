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
  late YMACountryCard currentCountry;
  List<YMACountryCard> _countries = [];

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: duration,
    );
    for (int i = 0; i < countriesList.length; i++) {
      final c = YMACountryCard(
        country: countriesList[i],
        onTap: () {
          setState(() => currentCountry = _countries[i]);
          expandList();
        },
      );

      if (i == 0) currentCountry = c;
      _countries.add(c);
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

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
            child: currentCountry,
          ),

          // List of countries
          Visibility(
            visible: showList,
            child: Column(children: _countries),
          ),

          // Show list button
          GestureDetector(
            onTap: () => expandList(),
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

  expandList() async {
    if (animationController.isDismissed) {
      animationController.forward();
    } else {
      animationController.reverse();
    }

    await Future.delayed(duration);
    if (isExpanded) {
      setState(() => showList = false);
      setState(() => isExpanded = false);
    } else {
      setState(() => isExpanded = true);
      await Future.delayed(duration);
      setState(() => showList = true);
    }
  }
}
