import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class CardsColorStateTabWidget extends StatefulWidget {
  const CardsColorStateTabWidget(
      {super.key, required this.mediaQueryData, required this.themeData});
  final ThemeData themeData;
  final MediaQueryData mediaQueryData;

  @override
  State<CardsColorStateTabWidget> createState() =>
      _CardsColorStateTabWidgetState();
}

class _CardsColorStateTabWidgetState extends State<CardsColorStateTabWidget> {
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
                Flexible(child: colorstatecommon()),
                buildSizedboxW(kDefaultPadding),
                Flexible(child: colorstatecommon()),
                buildSizedboxW(kDefaultPadding),
                Flexible(
                  child: Column(
                    children: [
                      buildSizedBoxH(kDefaultPadding + kTextPadding),
                      basicCard('Header', AppColors.primaryColor, true),
                      buildSizedBoxH(kDefaultPadding),
                      basicCard('SPECIAL TITLE TREATMENT',
                          AppColors.primaryColor, true),
                      buildSizedBoxH(kDefaultPadding),
                      basicCard('SPECIAL TITLE TREATMENT',
                          AppColors.buttonWarningColor, true),
                      buildSizedBoxH(kDefaultPadding),
                      basicCard('SPECIAL TITLE TREATMENT',
                          AppColors.buttonSuccessColor, true),
                      buildSizedBoxH(kDefaultPadding),
                      basicCard('SPECIAL TITLE TREATMENT',
                          AppColors.buttonInfoColor, true),
                      buildSizedBoxH(kDefaultPadding),
                      basicCard('SPECIAL TITLE TREATMENT',
                          AppColors.buttonFocusColor, true),
                      buildSizedBoxH(kDefaultPadding),
                      basicCard('SPECIAL TITLE TREATMENT',
                          AppColors.buttonAltColor, true)
                    ],
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: widget.mediaQueryData.size.width <= kScreenWidthLg,
            child: Column(
              children: [
                colorstatecommon(),
                buildSizedboxW(kDefaultPadding),
                colorstatecommon(),
                buildSizedboxW(kDefaultPadding),
                buildSizedBoxH(kDefaultPadding + kTextPadding),
                basicCard('Header', AppColors.primaryColor, true),
                buildSizedBoxH(kDefaultPadding),
                basicCard(
                    'SPECIAL TITLE TREATMENT', AppColors.primaryColor, true),
                buildSizedBoxH(kDefaultPadding),
                basicCard('SPECIAL TITLE TREATMENT',
                    AppColors.buttonWarningColor, true),
                buildSizedBoxH(kDefaultPadding),
                basicCard('SPECIAL TITLE TREATMENT',
                    AppColors.buttonSuccessColor, true),
                buildSizedBoxH(kDefaultPadding),
                basicCard(
                    'SPECIAL TITLE TREATMENT', AppColors.buttonInfoColor, true),
                buildSizedBoxH(kDefaultPadding),
                basicCard('SPECIAL TITLE TREATMENT', AppColors.buttonFocusColor,
                    true),
                buildSizedBoxH(kDefaultPadding),
                basicCard(
                    'SPECIAL TITLE TREATMENT', AppColors.buttonAltColor, true)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget colorstatecommon() {
    return Column(
      children: [
        buildSizedBoxH(kDefaultPadding + kTextPadding),
        basicCard('PRIMARY CARD SHADOW', AppColors.primaryColor),
        buildSizedBoxH(kDefaultPadding),
        basicCard('SECONDARY CARD SHADOW', AppColors.buttonSecondaryColor),
        buildSizedBoxH(kDefaultPadding),
        basicCard('WARNING CARD SHADOW', AppColors.buttonWarningColor),
        buildSizedBoxH(kDefaultPadding),
        basicCard('SUCCESS CARD SHADOW', AppColors.buttonSuccessColor),
        buildSizedBoxH(kDefaultPadding),
        basicCard('INFO CARD SHADOW', AppColors.buttonInfoColor),
        buildSizedBoxH(kDefaultPadding),
        basicCard('FOCUS CARD SHADOW', AppColors.buttonFocusColor),
        buildSizedBoxH(kDefaultPadding),
        basicCard('ALTERNATE CARD SHADOW', AppColors.buttonAltColor)
      ],
    );
  }

  Widget basicCard(String title, Color border, [bool isbgColor = false]) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(title == 'Header' ? 0 : kDefaultPadding),
      decoration: BoxDecoration(
          color: isbgColor ? border : widget.themeData.cardColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: border),
          boxShadow: [
            BoxShadow(color: border.withOpacity(0.1), blurRadius: 6)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title == 'Header'
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize:
                          Size.fromWidth(MediaQuery.of(context).size.width),
                      backgroundColor: AppColors.whiteColor.withOpacity(0.1),
                      alignment: Alignment.centerLeft,
                      foregroundColor: null,
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding * 1.1,
                          horizontal: kDefaultPadding),
                      shadowColor: Colors.transparent),
                  child: Text(
                    title,
                    style: const TextStyle(color: AppColors.whiteColor),
                  ),
                  onPressed: () {},
                )
              : Text(
                  title,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: isbgColor ? AppColors.whiteColor : null),
                ),
          buildSizedBoxH(kDefaultPadding),
          title == 'Header'
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Text(
                      'With supporting text below as a natural lead-in to additional content',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: isbgColor
                              ? AppColors.whiteColor
                              : AppColors.blackColor)),
                )
              : Text(
                  'With supporting text below as a natural lead-in to additional content',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: isbgColor ? AppColors.whiteColor : null),
                ),
          buildSizedBoxH(title == 'Header' ? kDefaultPadding : 0),
          title == 'Header'
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize:
                          Size.fromWidth(MediaQuery.of(context).size.width),
                      backgroundColor: AppColors.whiteColor.withOpacity(0.1),
                      alignment: Alignment.centerLeft,
                      foregroundColor: null,
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding * 1.1,
                          horizontal: kDefaultPadding),
                      shadowColor: Colors.transparent),
                  child: const Text(
                    'Footer',
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                  onPressed: () {},
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
