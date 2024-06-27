import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/theme/app_theme.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class BadgesTabWidget extends StatefulWidget {
  const BadgesTabWidget(
      {super.key, required this.mediaQueryData, required this.themeData});
  final ThemeData themeData;
  final MediaQueryData mediaQueryData;

  @override
  State<BadgesTabWidget> createState() => _BadgesTabWidgetState();
}

class _BadgesTabWidgetState extends State<BadgesTabWidget> {
  List listProduct = [
    {'title': 'Primary', 'color': AppColors.primaryColor, 'istranspent': false},
    {
      'title': 'Secondary',
      'color': AppColors.buttonSecondaryColor,
      'istranspent': false
    },
    {
      'title': 'Success',
      'color': AppColors.buttonSuccessColor,
      'istranspent': false
    },
    {'title': 'Info', 'color': AppColors.buttonInfoColor, 'istranspent': false},
    {
      'title': 'Worning',
      'color': AppColors.buttonWarningColor,
      'istranspent': false
    },
    {
      'title': 'Focus',
      'color': AppColors.buttonFocusColor,
      'istranspent': false
    },
    {'title': 'Alt', 'color': AppColors.buttonAltColor, 'istranspent': false},
    {'title': 'Link 1', 'color': Colors.transparent, 'istranspent': true},
    {'title': 'Link 2', 'color': Colors.transparent, 'istranspent': true},
    {'title': 'Link 3', 'color': Colors.transparent, 'istranspent': true},
  ];

  List dotList = [
    {'color': AppColors.primaryColor},
    {'color': AppColors.buttonSecondaryColor},
    {'color': AppColors.buttonSuccessColor},
    {'color': AppColors.buttonInfoColor},
    {'color': AppColors.buttonWarningColor},
    {'color': AppColors.buttonFocusColor},
    {'color': AppColors.buttonAltColor},
  ];

  List iconButtonsList = [
    {'icon': Assets.images.icons.map, 'color': AppColors.primaryColor},
    {
      'icon': Assets.images.icons.bookmarks,
      'color': AppColors.buttonSuccessColor
    },
    {'icon': Assets.images.icons.bell, 'color': AppColors.buttonInfoColor},
  ];

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      child: Column(
        children: [
          buildSizedBoxH(kDefaultPadding + kTextPadding),
          Visibility(
            visible: widget.mediaQueryData.size.width >= kScreenWidthLg,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: simnpleBadge(Lang.current.withButtons, true)),
                    buildSizedboxW(kDefaultPadding),
                    Expanded(
                        child:
                            simnpleBadge(Lang.current.badgeDotButtons, false)),
                  ],
                ),
                buildSizedBoxH(kDefaultPadding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: badgesDots(Lang.current.badgeDots, true)),
                    buildSizedboxW(kDefaultPadding),
                    Expanded(
                        child: badgesDots(Lang.current.iconButtonsWith, false)),
                  ],
                )
              ],
            ),
          ),
          Visibility(
            visible: widget.mediaQueryData.size.width <= kScreenWidthLg,
            child: Column(
              children: [
                simnpleBadge(Lang.current.withButtons, true),
                buildSizedBoxH(kDefaultPadding),
                simnpleBadge(Lang.current.badgeDotButtons, false),
                buildSizedBoxH(kDefaultPadding),
                badgesDots(Lang.current.badgeDots, true),
                buildSizedBoxH(kDefaultPadding),
                badgesDots(Lang.current.iconButtonsWith, false)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget simnpleBadge(String title, bool isSolid) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: widget.themeData.textColor),
          ),
          buildSizedBoxH(kDefaultPadding),
          gridviewServiceList(isSolid),
        ],
      ),
    );
  }

  Widget badgesDots(String title, bool isIcon) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: widget.themeData.textColor),
          ),
          buildSizedBoxH(kDefaultPadding),
          isIcon ? badgesDotsList() : iconButtonswithBadgesList()
        ],
      ),
    );
  }

  Widget badgesDotsList() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
                child: gridviewDotsList(kDefaultPadding - kTextPadding, false)),
            buildSizedboxW(kDefaultPadding),
            Flexible(child: gridviewDotsList(kDefaultPadding, false)),
            buildSizedboxW(kDefaultPadding),
            Flexible(child: gridviewDotsList(kDefaultPadding * 1.5, false))
          ],
        ),
        buildSizedBoxH(kDefaultPadding),
        const Divider(),
        buildSizedBoxH(kDefaultPadding + kTextPadding),
        Align(
            alignment: Alignment.centerLeft,
            child: gridviewDotsList(kDefaultPadding * 1.5, true)),
        buildSizedBoxH(kDefaultPadding),
      ],
    );
  }

  Widget iconButtonswithBadgesList() {
    return Row(
      children: [
        Flexible(child: gridviewIconButtonswithBadges(false)),
        buildSizedboxW(kDefaultPadding),
        Flexible(child: gridviewIconButtonswithBadges(true)),
      ],
    );
  }

  Widget gridviewDotsList(double fontSize, bool isBorder) {
    return Wrap(
      spacing: kTextPadding,
      runSpacing: kTextPadding * 2,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: dotList
          .map(
            (e) => Container(
              height: fontSize,
              width: fontSize,
              decoration: BoxDecoration(
                  color: isBorder ? AppColors.whiteColor : e['color'],
                  borderRadius: const BorderRadius.all(
                      Radius.circular(kDefaultPadding * 3)),
                  border: Border.all(
                      color: isBorder ? e['color'] : Colors.transparent,
                      width: kTextPadding)),
            ),
          )
          .toList(),
    );
  }

  Widget gridviewIconButtonswithBadges(bool isNumber) {
    return Wrap(
      spacing: kTextPadding,
      runSpacing: kTextPadding * 2,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: iconButtonsList
          .map(
            (e) => Stack(
              alignment: Alignment.topRight,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.whiteColor,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Set the border radius as desired
                        side: const BorderSide(
                            color: Colors.transparent,
                            width: 1.2), // Set the border color and width
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding * 1.1,
                          horizontal: kDefaultPadding - kTextPadding),
                      shadowColor: Colors.transparent),
                  child: e['icon'].svg(
                      height: kDefaultPadding * 2,
                      fit: BoxFit.cover,
                      color: widget.themeData.textColor),
                  onPressed: () {},
                ),
                !isNumber
                    ? Padding(
                        padding: const EdgeInsets.only(
                            right: kTextPadding * 2, top: kTextPadding),
                        child: Assets.images.svg.status
                            .svg(height: kDefaultPadding, fit: BoxFit.cover),
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kTextPadding * 2),
                        decoration: BoxDecoration(
                            color: e['color'],
                            borderRadius:
                                BorderRadius.circular(kDefaultPadding)),
                        child: const Text(
                          '6',
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: kTextPadding * 3),
                        ),
                      )
              ],
            ),
          )
          .toList(),
    );
  }

  Widget gridviewServiceList(bool isSolid) {
    return Wrap(
      spacing: kDefaultPadding,
      runSpacing: kDefaultPadding,
      children: listProduct
          .map(
            (e) => Stack(
              alignment: Alignment.topRight,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: e['istranspent']
                          ? AppColors.whiteColor
                          : AppColors.blackColor,
                      backgroundColor:
                          e['istranspent'] ? Colors.transparent : e['color'],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Set the border radius as desired
                        side: const BorderSide(
                            color: Colors.transparent,
                            width: 1.2), // Set the border color and width
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding * 1.1,
                          horizontal: kDefaultPadding - kTextPadding),
                      shadowColor:
                          e['istranspent'] ? Colors.transparent : null),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        e['title'],
                        style: TextStyle(
                            color: e['title'] == 'Secondary'
                                ? AppColors.blackColor
                                : e['istranspent']
                                    ? widget.themeData.textColor
                                    : AppColors.whiteColor),
                      ),
                      buildSizedboxW(
                          isSolid ? kDefaultPadding - kTextPadding : 0),
                      isSolid
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kTextPadding * 2),
                              decoration: BoxDecoration(
                                  color: e['istranspent']
                                      ? AppColors.primaryColor
                                      : AppColors.whiteColor,
                                  borderRadius:
                                      BorderRadius.circular(kDefaultPadding)),
                              child: Text(
                                '6',
                                style: TextStyle(
                                    color: e['istranspent']
                                        ? AppColors.whiteColor
                                        : AppColors.blackColor,
                                    fontSize: kTextPadding * 3),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  onPressed: () {},
                ),
                !isSolid
                    ? Align(
                        widthFactor: 0.1,
                        heightFactor: 0.1,
                        child: Assets.images.svg.status
                            .svg(height: kDefaultPadding, fit: BoxFit.cover),
                      )
                    : const SizedBox.shrink()
              ],
            ),
          )
          .toList(),
    );
  }
}
