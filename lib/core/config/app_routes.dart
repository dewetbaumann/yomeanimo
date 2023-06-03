import 'package:flutter/material.dart';
import 'package:yomeanimo/presententation/pages/profile_page.dart';
import 'package:yomeanimo/presententation/pages/profiles_page.dart';
import 'package:yomeanimo/presententation/pages/welcome_page.dart';

abstract class AppRoutes {
  static const profile = '/profile';
  static const welcome = '/welcome';
  static const profiles = '/profiles';

  static final Map<String, Widget Function(BuildContext)> routes = {
    profile: (_) => const ProfilePage(),
    welcome: (_) => const WelcomePage(),
    profiles: (_) => const ProfilesPage(),
  };
}
