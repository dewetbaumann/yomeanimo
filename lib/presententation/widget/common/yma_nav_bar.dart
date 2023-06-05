import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';
import 'package:yomeanimo/core/config/app_routes.dart';

class YMANavBar extends StatefulWidget {
  const YMANavBar();

  @override
  State<YMANavBar> createState() => _YMANavBarState();
}

class _YMANavBarState extends State<YMANavBar> {
  String currentRoute = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => currentRoute = ModalRoute.of(context)?.settings.name ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      decoration: BoxDecoration(color: AppColor.roseRed),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          TextButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.welcome),
            child: Icon(
              Icons.home,
              color: currentRoute == AppRoutes.welcome ? AppColor.white : AppColor.purple,
              size: 30,
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.profiles),
            child: Icon(
              Icons.search,
              color: currentRoute == AppRoutes.profiles ? AppColor.white : AppColor.purple,
              size: 30,
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.profile),
            child: Icon(
              Icons.person,
              color: currentRoute == AppRoutes.profile ? AppColor.white : AppColor.purple,
              size: 30,
            ),
          ),
          TextButton(
            onPressed: () {}, // Navigator.pushNamed(context, AppRoutes.welcome);
            child: Icon(
              Icons.menu_rounded,
              color: AppColor.purple,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
