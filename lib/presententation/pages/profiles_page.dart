import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';
import 'package:yomeanimo/core/config/app_images.dart';
import 'package:yomeanimo/core/config/app_text_style.dart';
import 'package:yomeanimo/presententation/widget/common/yma_nav_bar.dart';
import 'package:yomeanimo/presententation/widget/profiles/yma_button_slider.dart';
import 'package:yomeanimo/presententation/widget/profiles/yma_profile_card.dart';

class ProfilesPage extends StatefulWidget {
  const ProfilesPage();

  @override
  State<ProfilesPage> createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: YMANavBar(),
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.purple,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Image.asset(
          AppImages.australia,
          height: 30,
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
                child: Text(
                  'YoMeAnimers',
                  style: AppTextStyle.title.copyWith(
                    color: AppColor.purple,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              YMAButtonSlider(),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: List.generate(
                    10,
                    (i) => YMAProfileCard(
                      index: i,
                      currentIndex: currentIndex,
                      onTap: () => setState(() => currentIndex = i),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
