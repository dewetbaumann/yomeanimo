import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_routes.dart';

void main() => runApp(const YoMeAnimoApp());

class YoMeAnimoApp extends StatelessWidget {
  const YoMeAnimoApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yo me animo!',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.welcome,
    );
  }
}
