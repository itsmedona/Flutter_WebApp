import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/theme/app_theme.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class CardsBasicTabWidget extends StatefulWidget {
  const CardsBasicTabWidget(
      {super.key, required this.mediaQueryData, required this.themeData});
  final ThemeData themeData;
  final MediaQueryData mediaQueryData;

  @override
  State<CardsBasicTabWidget> createState() => _CardsBasicTabWidgetState();
}

class _CardsBasicTabWidgetState extends State<CardsBasicTabWidget> {
  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      child: Column(
        children: [
          Visibility(
            visible: widget.mediaQueryData.size.width >= kScreenWidthLg,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      buildSizedBoxH(kDefaultPadding + kTextPadding),
                      basicCard(
                          'BASIC EXAMPLE',
                          '',
                          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.',
                          ''),
                      buildSizedBoxH(kDefaultPadding),
                      basicCard(
                          'CARD WITH SUBTITLE',
                          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit',
                          'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis eni',
                          ''),
                      buildSizedBoxH(kDefaultPadding),
                      basicCard(
                          'SPECIAL TITLE TREATMENT',
                          '',
                          'With supporting text below as a natural lead-in to additional content',
                          '',
                          true,
                          AppColors.primaryColor),
                      buildSizedBoxH(kDefaultPadding),
                      basicCard(
                          'SPECIAL TITLE TREATMENT',
                          '',
                          'With supporting text below as a natural lead-in to additional content.',
                          '',
                          true,
                          AppColors.buttondangerColor,
                          CrossAxisAlignment.center,
                          TextAlign.center),
                      buildSizedBoxH(kDefaultPadding),
                      basicCard(
                          'SPECIAL TITLE TREATMENT',
                          '',
                          'With supporting text below as a natural lead-in to additional content.',
                          '',
                          true,
                          AppColors.buttonInfoColor,
                          CrossAxisAlignment.end,
                          TextAlign.end)
                    ],
                  ),
                ),
                buildSizedboxW(kDefaultPadding),
                Flexible(
                  child: Column(
                    children: [
                      buildSizedBoxH(kDefaultPadding + kTextPadding),
                      basicCard(
                          'CARD TITLE',
                          'Card subtitle',
                          "Some quick example text to build on the card title and make up the bulk of the card's content.",
                          ''),
                      buildSizedBoxH(kDefaultPadding),
                      basicCard(
                          'CARD TITLE',
                          '',
                          'This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.',
                          'Last updated 3 mins ago'),
                    ],
                  ),
                ),
                buildSizedboxW(kDefaultPadding),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildSizedBoxH(kDefaultPadding + kTextPadding),
                      basicCard(
                          'BASIC EXAMPLE',
                          'Card subtitle',
                          "Some quick example text to build on the card title and make up the bulk of the card's content.",
                          '',
                          false,
                          Colors.transparent,
                          CrossAxisAlignment.center,
                          TextAlign.center),
                      buildSizedBoxH(kDefaultPadding),
                      basicCard(
                          'CARD WITH SUBTITLE',
                          '',
                          'This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.',
                          'Last updated 3 mins ago',
                          false,
                          Colors.transparent,
                          CrossAxisAlignment.end,
                          TextAlign.end),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: widget.mediaQueryData.size.width <= kScreenWidthLg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSizedBoxH(kDefaultPadding + kTextPadding),
                basicCard(
                    'BASIC EXAMPLE',
                    '',
                    'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.',
                    ''),
                buildSizedBoxH(kDefaultPadding),
                basicCard(
                    'CARD WITH SUBTITLE',
                    'Lorem ipsum dolor sit amet, consectetuer adipiscing elit',
                    'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis eni',
                    ''),
                buildSizedBoxH(kDefaultPadding),
                basicCard(
                    'SPECIAL TITLE TREATMENT',
                    '',
                    'With supporting text below as a natural lead-in to additional content',
                    '',
                    true,
                    AppColors.primaryColor),
                buildSizedBoxH(kDefaultPadding),
                basicCard(
                    'SPECIAL TITLE TREATMENT',
                    '',
                    'With supporting text below as a natural lead-in to additional content.',
                    '',
                    true,
                    AppColors.buttondangerColor,
                    CrossAxisAlignment.center,
                    TextAlign.center),
                buildSizedBoxH(kDefaultPadding),
                basicCard(
                    'SPECIAL TITLE TREATMENT',
                    '',
                    'With supporting text below as a natural lead-in to additional content.',
                    '',
                    true,
                    AppColors.buttonInfoColor,
                    CrossAxisAlignment.end,
                    TextAlign.end),
                buildSizedBoxH(kDefaultPadding),
                basicCard(
                    'CARD TITLE',
                    'Card subtitle',
                    "Some quick example text to build on the card title and make up the bulk of the card's content.",
                    ''),
                buildSizedBoxH(kDefaultPadding),
                basicCard(
                    'CARD TITLE',
                    '',
                    'This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.',
                    'Last updated 3 mins ago'),
                buildSizedBoxH(kDefaultPadding),
                basicCard(
                    'BASIC EXAMPLE',
                    'Card subtitle',
                    "Some quick example text to build on the card title and make up the bulk of the card's content.",
                    '',
                    false,
                    Colors.transparent,
                    CrossAxisAlignment.center,
                    TextAlign.center),
                buildSizedBoxH(kDefaultPadding),
                basicCard(
                    'CARD WITH SUBTITLE',
                    '',
                    'This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.',
                    'Last updated 3 mins ago',
                    false,
                    Colors.transparent,
                    CrossAxisAlignment.end,
                    TextAlign.end),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget basicCard(
      String title, String subtitle, String description, String lastUpdatetext,
      [bool isbutton = false,
      Color buttonBgColor = AppColors.whiteColor,
      CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
      TextAlign textAlign = TextAlign.start]) {
    return Container(
      // width: 350,
      width: double.infinity,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: widget.themeData.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.blackColor.withOpacity(0.1), blurRadius: 6)
          ]),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              // color: AppColors.blackColor
            ),
          ),
          buildSizedBoxH(subtitle.isEmpty ? 0 : kTextPadding),
          Visibility(
            visible: subtitle.isEmpty ? false : true,
            child: Text(
              subtitle,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: widget.themeData.textColor.withOpacity(0.5)),
            ),
          ),
          buildSizedBoxH(kDefaultPadding),
          Text(
            description,
            textAlign: textAlign,
            style: TextStyle(
                fontWeight: FontWeight.w500, color: widget.themeData.textColor),
          ),
          buildSizedBoxH(
              isbutton || lastUpdatetext.isNotEmpty ? kDefaultPadding : 0),
          Visibility(
            visible: lastUpdatetext.isEmpty ? false : true,
            child: Text(
              lastUpdatetext,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: widget.themeData.textColor.withOpacity(0.5),
                  fontSize: 12),
            ),
          ),
          Visibility(
            visible: isbutton,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                  backgroundColor: buttonBgColor,
                  foregroundColor: AppColors.blackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Set the border radius as desired
                    // side: BorderSide(
                    //     color: !isNoBorder ? e['color'] : Colors.transparent,
                    //     width: 1.2), // Set the border color and width
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding * 1.1),
                  shadowColor: Colors.transparent),
              child: const Text(
                'Go somewhere',
                style: TextStyle(color: AppColors.whiteColor),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
