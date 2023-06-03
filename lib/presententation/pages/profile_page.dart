import 'package:flutter/material.dart';
import 'package:yomeanimo/presententation/widget/common/yma_nav_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: YMANavBar(),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
