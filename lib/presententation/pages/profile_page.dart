import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';
import 'package:yomeanimo/core/config/app_images.dart';
import 'package:yomeanimo/core/config/app_routes.dart';
import 'package:yomeanimo/core/config/app_text_style.dart';
import 'package:yomeanimo/presententation/widget/common/yma_button_star.dart';
import 'package:yomeanimo/presententation/widget/common/yma_nav_bar.dart';
import 'package:yomeanimo/presententation/widget/profile/yma_profile_description.dart';
import 'package:yomeanimo/presententation/widget/profile/yma_profile_picture.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage();

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool inverted = false;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: YMANavBar(),
      appBar: AppBar(
        backgroundColor: AppColor.purple,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Image.asset(AppImages.australia, height: 30),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                YMAProfilePicture(photo: AppImages.profilePic),
                YMAProfileDescription(
                  name: 'Juliana Pichot',
                  profesion: 'Bartender',
                  company: 'Jhonny B Good',
                  notes:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo.',
                  inverted: inverted,
                ),
                Container(
                  width: screen.width,
                  height: 100,
                  decoration: BoxDecoration(color: AppColor.greyLight),
                  child: Center(
                    child: TextButton(
                        onPressed: () => Navigator.pushNamed(context, AppRoutes.profiles),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(AppColor.white),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                side: BorderSide(color: AppColor.greyLight2),
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Volver atrás',
                            style: AppTextStyle.title.copyWith(color: AppColor.purple, fontWeight: FontWeight.w400),
                          ),
                        )),
                  ),
                ),
              ],
            ),

            // Star
            Positioned(
              top: 170,
              right: 15,
              child: YMAButtonStar(
                onTap: () => setState(() => inverted = !inverted),
                inverted: inverted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
