import 'package:flutter/material.dart';
import 'package:yomeanimo/core/config/app_color.dart';
import 'package:yomeanimo/core/config/app_images.dart';
import 'package:yomeanimo/core/config/app_routes.dart';
import 'package:yomeanimo/core/config/app_text_style.dart';
import 'package:yomeanimo/presententation/widget/common/buttons/yma_button.dart';
import 'package:yomeanimo/presententation/widget/common/yma_nav_bar.dart';
import 'package:yomeanimo/presententation/widget/welcome/yma_background_image.dart';
import 'package:yomeanimo/presententation/widget/welcome/yma_expansible_countries_list.dart';
import 'package:yomeanimo/presententation/widget/welcome/yma_welcome_title.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColor.white,
      bottomNavigationBar: YMANavBar(),
      body: SafeArea(
        child: Stack(
          children: [
            // background image
            YMABackgroundImage(),

            // main content
            Container(
              width: screen.width,
              height: screen.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(AppImages.logo, width: 200),
                  ),

                  // Texts: Empieza a buscar, YoMeAnimers, ¿Qué destino te interesa?
                  YMAWelcomeTitle(),

                  // List of Countries
                  YMAExpansibleCountriesList(),

                  // Button: Buscar YoMeAnimers
                  YMAButton(
                    text: 'Buscar YoMeAnimers',
                    onTap: () => Navigator.pushNamed(context, AppRoutes.profiles),
                    width: screen.width * .5,
                    style: AppTextStyle.title.copyWith(color: AppColor.white),
                    margin: const EdgeInsets.only(top: 5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
