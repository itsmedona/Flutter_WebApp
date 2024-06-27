import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';

class UtilitiesScreen extends StatefulWidget {
  const UtilitiesScreen({Key? key}) : super(key: key);

  @override
  State<UtilitiesScreen> createState() => _UtilitiesScreenState();
}

class _UtilitiesScreenState extends State<UtilitiesScreen> {
  List dotColorsList = [
    {'color': AppColors.primaryColor, 'gradient': AppColors.primaryGradi},
    {
      'color': AppColors.buttonSecondaryColor,
      'gradient': AppColors.buttonSecondaryGradi
    },
    {
      'color': AppColors.buttonSuccessColor,
      'gradient': AppColors.buttonSuccessGradi
    },
    {'color': AppColors.buttonInfoColor, 'gradient': AppColors.buttonInfoGradi},
    {
      'color': AppColors.buttonWarningColor,
      'gradient': AppColors.buttonWarningGradi
    },
    {
      'color': AppColors.buttonFocusColor,
      'gradient': AppColors.buttonFocusColorGradi
    },
    {
      'color': AppColors.buttonAltColor,
      'gradient': AppColors.buttonAltColorGradi
    },
  ];

  List bgImagesList = [
    {'images': Assets.images.wallpaper.bgImage1},
    {'images': Assets.images.wallpaper.bgImage2},
    {'images': Assets.images.wallpaper.bgImage3},
    {'images': Assets.images.wallpaper.bgImage4},
    {'images': Assets.images.wallpaper.bgImage5},
    {'images': Assets.images.wallpaper.bgImage6},
    {'images': Assets.images.wallpaper.bgImage7},
    {'images': Assets.images.wallpaper.bgImage8},
    {'images': Assets.images.wallpaper.bgImage9},
  ];

  List opacityList = [
    {
      'title': ".withOpacity-01 - .withOpacity-09",
      'subtitle':
          "Adding this class to any element sets the opacity to 1% ... 9%"
    },
    {
      'title': ".withOpacity-2 - .withOpacity-10",
      'subtitle':
          "Adding this class to any element sets the opacity to 10% ... 100%"
    },
    {
      'title': ".withOpacity-01",
      'subtitle': "Adding this class to any element sets the opacity to 10%"
    },
    {
      'title': ".withOpacity-15",
      'subtitle': "	Adding this class to any element sets the opacity to 15%"
    },
  ];

  // late List<AnimatedTextExample> _examples;
  // int _index = 0;
  // int _tapCount = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   _examples = animatedTextExamples(onTap: () {
  //     print('Tap Event');
  //     setState(() {
  //       _tapCount++;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final mediaQueryData = MediaQuery.of(context);
    return PortalMasterLayout(
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          UIComponenetsAppBar(
              title: Lang.current.utilities,
              subtitle: Lang.current.UtilitiesSubtitle,
              icon: Assets.images.png.applewatch
                  .image(height: kDefaultPadding * 2, fit: BoxFit.cover)),
          buildSizedBoxH(kDefaultPadding),
          EntranceFader(
            child: Column(
              children: [
                Visibility(
                  visible: mediaQueryData.size.width >= kScreenWidthLg,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          child: animateCSSCard(
                              themeData, 'FLUTTER ANIME.CSS', false)),
                      buildSizedboxW(kDefaultPadding),
                      Flexible(
                          child: reactAnimeCSSCard(
                              themeData, 'FLUTTER TEXT ANIME')),
                    ],
                  ),
                ),
                Visibility(
                  visible: mediaQueryData.size.width <= kScreenWidthLg,
                  child: Column(
                    children: [
                      animateCSSCard(themeData, 'FLUTTER ANIME.CSS', false),
                      buildSizedBoxH(kDefaultPadding),
                      reactAnimeCSSCard(themeData, 'FLUTTER TEXT ANIME'),
                    ],
                  ),
                ),
                buildSizedBoxH(kDefaultPadding),
                Visibility(
                  visible: mediaQueryData.size.width >= kScreenWidthLg,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            dotsColors('SOLID COLORS', false, themeData),
                            buildSizedBoxH(kDefaultPadding),
                            dotsColors('GRADIENT COLORS', true, themeData),
                          ],
                        ),
                      ),
                      buildSizedboxW(kDefaultPadding),
                      Flexible(child: textColors('TEXT COLORS', themeData)),
                    ],
                  ),
                ),
                Visibility(
                  visible: mediaQueryData.size.width <= kScreenWidthLg,
                  child: Column(
                    children: [
                      dotsColors('SOLID COLORS', false, themeData),
                      buildSizedBoxH(kDefaultPadding),
                      dotsColors('GRADIENT COLORS', true, themeData),
                      buildSizedBoxH(kDefaultPadding),
                      textColors('TEXT COLORS', themeData),
                    ],
                  ),
                ),
                buildSizedBoxH(kDefaultPadding),
                bgImages('BACKGROUND IMAGES', mediaQueryData, themeData),
                buildSizedBoxH(kDefaultPadding),
                animateCSSCard(themeData, 'Flutter Helpers', true),
                buildSizedBoxH(kDefaultPadding),
                Visibility(
                  visible: mediaQueryData.size.width >= kScreenWidthLg,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          child: opacityAndBreadcrumbsCard(
                              'OPACITY', false, themeData)),
                      buildSizedboxW(kDefaultPadding),
                      Flexible(
                          child: opacityAndBreadcrumbsCard(
                              'BREADCRUMBS', true, themeData)),
                    ],
                  ),
                ),
                Visibility(
                  visible: mediaQueryData.size.width <= kScreenWidthLg,
                  child: Column(
                    children: [
                      opacityAndBreadcrumbsCard('OPACITY', false, themeData),
                      buildSizedBoxH(kDefaultPadding),
                      opacityAndBreadcrumbsCard('BREADCRUMBS', true, themeData),
                    ],
                  ),
                ),
                buildSizedBoxH(kDefaultPadding),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Colorize Text Style
  final _colorizeTextStyle = const TextStyle(fontSize: 14.0);

// Colorize Colors
  final _colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  Widget animateCSSCard(ThemeData themeData, String title, bool isShadow) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: isShadow ? AppColors.containerBgColor : themeData.cardColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: isShadow
                  ? AppColors.terxtBgColor.withOpacity(0.2)
                  : Colors.transparent),
          boxShadow: isShadow
              ? []
              : [
                  BoxShadow(
                      color: AppColors.blackColor.withOpacity(0.1),
                      blurRadius: 6)
                ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: isShadow ? AppColors.terxtBgColor : null),
          ),
          buildSizedBoxH(kDefaultPadding),
          Text(
            isShadow
                ? 'All Flutter 4 helper classes available in the official Flutter documentation are also available in ArchitectUI: Spacing, resets, typography utilities, sizing and others.'
                : "animate_do is a powerful Flutter package that simplifies the process of adding stunning and smooth animations to UI elements. With an intuitive API, it offers a variety of pre-built animations, including fadeIn, fadeInLeft, bounceIn, zoomIn, and many more. Developers can easily apply these animations to widgets, buttons, cards, and other UI components with just a few lines of code, without the need for complex animations setups. This package significantly reduces development time while elevating the visual appeal and user experience of Flutter applications, making it a popular choice for animating UI elements effortlessly.",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: isShadow ? AppColors.terxtBgColor : null),
          ),
          Visibility(
            visible: !isShadow ? true : false,
            child: Column(
              children: [
                buildSizedBoxH(kDefaultPadding),
                Center(
                  child: FadeInLeft(
                      animate: true,
                      delay: const Duration(seconds: 1),
                      duration: const Duration(seconds: 2),
                      child: animeButton('', AppColors.buttonSuccessColor)),
                ),
                // Center(child: animeButton('', AppColors.buttonSuccessColor)),
                buildSizedBoxH(kTextPadding),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget opacityAndBreadcrumbsCard(
      String title, bool isShadow, ThemeData themeData) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: themeData.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.blackColor.withOpacity(0.1), blurRadius: 6)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          buildSizedBoxH(kDefaultPadding),
          isShadow
              ? Column(
                  children: [
                    Container(
                      height: 50,
                      padding: const EdgeInsets.only(left: kDefaultPadding),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: themeData.canvasColor,
                          borderRadius:
                              BorderRadius.circular(kTextPadding * 1.5)),
                      child: const Text(
                        'Home',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    buildSizedBoxH(kDefaultPadding),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.only(left: kDefaultPadding),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: themeData.canvasColor,
                          borderRadius:
                              BorderRadius.circular(kTextPadding * 1.5)),
                      child: const Row(
                        children: [
                          Text(
                            'Home  ',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppColors.tabbarlableColor),
                          ),
                          Text(
                            '/  Library',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    buildSizedBoxH(kDefaultPadding),
                    Container(
                      height: 50,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: kDefaultPadding),
                      decoration: BoxDecoration(
                          color: themeData.canvasColor,
                          borderRadius:
                              BorderRadius.circular(kTextPadding * 1.5)),
                      child: const Row(
                        children: [
                          Text(
                            'Home  ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.tabbarlableColor),
                          ),
                          Text(
                            '/  ',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            ' Library  ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.tabbarlableColor),
                          ),
                          Text(
                            '/  Data',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.dividerColor)),
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: opacityList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: kDefaultPadding),
                                    child: Text(
                                      opacityList[index]['title'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    height: 80,
                                    child: VerticalDivider(
                                        width: 0,
                                        color: AppColors.dividerColor)),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: kDefaultPadding),
                                    child: Text(
                                      opacityList[index]['subtitle'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Divider(height: 0)
                          ],
                        );
                      }),
                ),
        ],
      ),
    );
  }

  Widget reactAnimeCSSCard(ThemeData themeData, String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: themeData.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.blackColor.withOpacity(0.1), blurRadius: 6)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          buildSizedBoxH(kDefaultPadding),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     animeButton('1', AppColors.buttonSuccessColor),
          //     buildSizedboxW(kDefaultPadding),
          //     animeButton('2', AppColors.buttonWarningColor),
          //     buildSizedboxW(kDefaultPadding),
          //     animeButton('3', AppColors.buttonFocusColor)
          //   ],
          // ),
          // buildSizedBoxH(kDefaultPadding),
          // const Divider(),
          // buildSizedBoxH(kDefaultPadding),
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              ColorizeAnimatedText(
                  'The animated_text_kit is a fantastic Flutter animation kit that empowers developers to integrate dynamic and visually appealing text animations into their applications with ease. This versatile package offers a plethora of pre-built animated text widgets, such as Fade, Typer, Scale, Rotate, and more, enabling developers to create captivating typographic effects effortlessly',
                  textStyle: _colorizeTextStyle,
                  colors: _colorizeColors),
            ],
            onTap: () {},
          ),
          buildSizedBoxH(kDefaultPadding),
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TyperAnimatedText(
                '" By customizing parameters like duration, text style, alignment, and more, developers can tailor the animations to suit their apps specific design and branding. "',
              ),
            ],
            onTap: () {},
          ),
          buildSizedBoxH(kDefaultPadding),
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TyperAnimatedText(
                "Whether it's adding subtle transitions or eye-catching effects, the animated_text_kit elevates the user experience, making apps more engaging and visually delightful for users.",
              ),
            ],
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget animeButton(String title, Color bgColor) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(30, 30),
          backgroundColor: bgColor,
          foregroundColor: AppColors.blackColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(50), // Set the border radius as desired
          ),
          padding:
              const EdgeInsets.symmetric(vertical: kTextPadding, horizontal: 0),
          shadowColor: Colors.transparent),
      child: Text(title,
          style: const TextStyle(color: AppColors.whiteColor, fontSize: 12)),
      onPressed: () {},
    );
  }

  Widget gredientButton(Gradient? gradient) {
    return Container(
      height: 23,
      width: 23,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), gradient: gradient),
    );
  }

  Widget dotsColors(String title, bool gradient, ThemeData themeData) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: themeData.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.blackColor.withOpacity(0.1), blurRadius: 6)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          buildSizedBoxH(kDefaultPadding),
          gridviewDotsList(29, gradient)
        ],
      ),
    );
  }

  Widget bgImages(
      String title, MediaQueryData mediaQueryData, ThemeData themeData) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: themeData.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.blackColor.withOpacity(0.1), blurRadius: 6)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          buildSizedBoxH(kDefaultPadding),
          bgImageList(mediaQueryData)
        ],
      ),
    );
  }

  Widget textColors(String title, ThemeData themeData) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: themeData.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.blackColor.withOpacity(0.1), blurRadius: 6)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          buildSizedBoxH(kDefaultPadding / 1.5),
          textColorsText(
              'Fusce dapibus, tellus ac cursus commodo, tortor mauris nibh.',
              AppColors.textgreyColor),
          buildSizedBoxH(kDefaultPadding / 1.5),
          textColorsText(
              'Nullam id dolor id nibh ultricies vehicula ut id elit.',
              AppColors.primaryColor),
          buildSizedBoxH(kDefaultPadding / 1.5),
          textColorsText(
              'Duis mollis, est non commodo luctus, nisi erat porttitor ligula.',
              AppColors.buttonSuccessColor),
          buildSizedBoxH(kDefaultPadding / 1.5),
          textColorsText(
              'Maecenas sed diam eget risus varius blandit sit amet non magna.',
              AppColors.buttonInfoColor),
          buildSizedBoxH(kDefaultPadding / 1.5),
          textColorsText('Etiam porta sem malesuada magna mollis euismod.',
              AppColors.buttonWarningColor),
          buildSizedBoxH(kDefaultPadding / 1.5),
          textColorsText('Donec ullamcorper nulla non metus auctor fringilla.',
              AppColors.buttondangerColor)
        ],
      ),
    );
  }

  Widget textColorsText(String text, Color textColor) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w500, color: textColor),
    );
  }

  Widget gridviewDotsList(double fontSize, bool gradient) {
    return Wrap(
      spacing: kTextPadding * 2,
      runSpacing: kTextPadding * 2,
      runAlignment: WrapAlignment.center,
      children: dotColorsList
          .map((e) => !gradient
              ? animeButton('', e['color'])
              : gredientButton(e['gradient']))
          .toList(),
    );
  }

  Widget bgImageList(MediaQueryData mediaQueryData) {
    return Center(
      child: Wrap(
        spacing: kDefaultPadding,
        runSpacing: kDefaultPadding,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        children: bgImagesList
            .map((e) => Column(
                  children: [
                    e['images'].image(
                        height: 370,
                        width: mediaQueryData.size.width >= kScreenWidthSm
                            ? 330
                            : double.infinity,
                        fit: BoxFit.fill)
                  ],
                ))
            .toList(),
      ),
    );
  }
}

class AnimatedTextExample {
  final String label;
  final Color? color;
  final Widget child;

  const AnimatedTextExample({
    required this.label,
    required this.color,
    required this.child,
  });
}
