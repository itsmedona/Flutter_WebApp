import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/theme/app_theme.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class LabelsTabWidget extends StatefulWidget {
  const LabelsTabWidget(
      {super.key, required this.mediaQueryData, required this.themeData});
  final MediaQueryData mediaQueryData;
  final ThemeData themeData;

  @override
  State<LabelsTabWidget> createState() => _LabelsTabWidgetState();
}

class _LabelsTabWidgetState extends State<LabelsTabWidget> {
  List listLabels = [
    {'title': 'Primary', 'color': AppColors.primaryColor},
    {'title': 'Secondary', 'color': AppColors.buttonSecondaryColor},
    {'title': 'Success', 'color': AppColors.buttonSuccessColor},
    {'title': 'Info', 'color': AppColors.buttonInfoColor},
    {'title': 'Worning', 'color': AppColors.buttonWarningColor},
    {'title': 'Focus', 'color': AppColors.buttonFocusColor},
    {'title': 'Alt', 'color': AppColors.buttonAltColor},
  ];

  List listLabelsWithButtons = [
    {
      'title': 'Primary',
      'color': AppColors.primaryColor,
      'istransparent': false
    },
    {
      'title': 'Secondary',
      'color': AppColors.buttonSecondaryColor,
      'istransparent': false
    },
    {
      'title': 'Success',
      'color': AppColors.buttonSuccessColor,
      'istransparent': false
    },
    {
      'title': 'Info',
      'color': AppColors.buttonInfoColor,
      'istransparent': false
    },
    {
      'title': 'Worning',
      'color': AppColors.buttonWarningColor,
      'istransparent': false
    },
    {
      'title': 'Focus',
      'color': AppColors.buttonFocusColor,
      'istransparent': false
    },
    {'title': 'Alt', 'color': AppColors.buttonAltColor, 'istransparent': false},
    {'title': 'Link 1', 'color': Colors.transparent, 'istransparent': true},
    {'title': 'Link 2', 'color': Colors.transparent, 'istransparent': true},
    {'title': 'Link 3', 'color': Colors.transparent, 'istransparent': true},
  ];

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      child: Column(
        children: [
          buildSizedBoxH(kDefaultPadding + kTextPadding),
          Visibility(
            visible: widget.mediaQueryData.size.width >= kScreenWidthLg,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: simnpleLabels()),
                buildSizedboxW(kDefaultPadding),
                Expanded(
                    child: simnpleLabelsWithButtons(Lang.current.withButtons)),
              ],
            ),
          ),
          Visibility(
            visible: widget.mediaQueryData.size.width <= kScreenWidthLg,
            child: Column(
              children: [
                simnpleLabels(),
                buildSizedBoxH(kDefaultPadding),
                simnpleLabelsWithButtons(Lang.current.withButtons),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget simnpleLabels() {
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
          labelsColorsList(Lang.current.colors, true),
          buildSizedBoxH(kDefaultPadding),
          const Divider(),
          buildSizedBoxH(kDefaultPadding - kTextPadding),
          labelsColorsList(Lang.current.pills, false),
          buildSizedBoxH(kDefaultPadding),
          const Divider(),
          buildSizedBoxH(kDefaultPadding - kTextPadding),
          labelsColorsList(Lang.current.links, true),
        ],
      ),
    );
  }

  Widget simnpleLabelsWithButtons(String title) {
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
          gridviewIconButtonswithLabelss()
        ],
      ),
    );
  }

  Widget labelsColorsList(String title, bool isRectangle) {
    return Column(
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
        gridviewServiceList(isRectangle)
      ],
    );
  }

  Widget gridviewIconButtonswithLabelss() {
    return Wrap(
      spacing: kDefaultPadding,
      runSpacing: kDefaultPadding,
      children: listLabelsWithButtons
          .map(
            (e) => ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: e['istransparent']
                      ? AppColors.whiteColor
                      : AppColors.blackColor,
                  backgroundColor: e['color'],
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
                  shadowColor: e['istransparent'] ? Colors.transparent : null),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    e['title'],
                    style: TextStyle(
                        color: e['title'] == 'Secondary'
                            ? AppColors.blackColor
                            : e['istransparent']
                                ? widget.themeData.textColor
                                : AppColors.whiteColor),
                  ),
                  buildSizedboxW(kDefaultPadding),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kTextPadding * 2, vertical: 2),
                    decoration: BoxDecoration(
                        color: e['title'] == 'Link 1' ||
                                e['title'] == 'Link 2' ||
                                e['title'] == 'Link 3'
                            ? AppColors.primaryColor
                            : AppColors.whiteColor,
                        borderRadius:
                            BorderRadius.circular(kTextPadding * 1.5)),
                    child: Text(
                      'New',
                      style: TextStyle(
                          color: e['title'] == 'Link 1' ||
                                  e['title'] == 'Link 2' ||
                                  e['title'] == 'Link 3'
                              ? AppColors.whiteColor
                              : AppColors.blackColor,
                          fontSize: kTextPadding * 3),
                    ),
                  )
                ],
              ),
              onPressed: () {},
            ),
          )
          .toList(),
    );
  }

  Widget gridviewServiceList(bool isRectangle) {
    return Wrap(
      spacing: kDefaultPadding,
      runSpacing: kDefaultPadding,
      children: listLabels
          .map(
            (e) => ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: null,
                  backgroundColor: e['color'],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(isRectangle
                        ? 8
                        : kDefaultPadding *
                            3), // Set the border radius as desired
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding - 2,
                      horizontal: kDefaultPadding - kTextPadding),
                  shadowColor: Colors.transparent),
              child: Text(
                e['title'],
                style: TextStyle(
                    color: e['title'] == 'Secondary'
                        ? AppColors.blackColor
                        : AppColors.whiteColor,
                    fontSize: kDefaultPadding),
              ),
              onPressed: () {},
            ),
          )
          .toList(),
    );
  }
}
