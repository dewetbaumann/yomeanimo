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
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, AppRoutes.welcome, (_) => false),
            child: Icon(
              Icons.home,
              color: currentRoute == AppRoutes.welcome ? AppColor.purple : AppColor.white,
              size: 30,
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, AppRoutes.profiles, (_) => false),
            child: Icon(
              Icons.search,
              color: currentRoute == AppRoutes.profiles ? AppColor.purple : AppColor.white,
              size: 30,
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, AppRoutes.profile, (_) => false),
            child: Icon(
              Icons.share,
              color: currentRoute == AppRoutes.profile ? AppColor.purple : AppColor.white,
              size: 30,
            ),
          ),
          TextButton(
            onPressed: () {}, // Navigator.pushNamedAndRemoveUntil(context, AppRoutes.welcome, (_) => false);
            child: Icon(
              Icons.menu_rounded,
              color: AppColor.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
