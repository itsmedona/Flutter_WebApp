import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class NavigationMenusHorizontalTabWidget extends StatefulWidget {
  const NavigationMenusHorizontalTabWidget(
      {super.key, required this.mediaQueryData, required this.themeData});
  final ThemeData themeData;
  final MediaQueryData mediaQueryData;

  @override
  State<NavigationMenusHorizontalTabWidget> createState() =>
      _NavigationMenusHorizontalTabWidgetState();
}

class _NavigationMenusHorizontalTabWidgetState
    extends State<NavigationMenusHorizontalTabWidget> {
  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      child: Column(
        children: [
          buildSizedBoxH(kDefaultPadding + kTextPadding),
          horizontalCard('HORIZONTAL MENU', false),
          buildSizedBoxH(kDefaultPadding),
          horizontalCard('ACTIVE LINKS', true)
        ],
      ),
    );
  }

  Widget horizontalCard(String title, bool isButtonBg) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.blackColor.withOpacity(0.1), blurRadius: 6)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor)),
          buildSizedBoxH(kDefaultPadding - kTextPadding),
          SizedBox(
            height: 35,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                verticalMenuList('Link', '', Colors.transparent,
                    Colors.transparent, isButtonBg),
                verticalMenuList('Link', 'NEW', AppColors.buttonSuccessColor),
                verticalMenuList(
                    'Another Link', '512', AppColors.buttonWarningColor),
                verticalMenuList('Disabled Link', '', Colors.transparent),
              ],
            ),
          ),
          buildSizedBoxH(kTextPadding * 3.5),
          const Divider(),
          buildSizedBoxH(kTextPadding * 3.5),
          Wrap(
            spacing: MediaQuery.of(context).size.width / 99,
            runSpacing: 20,
            children: [
              _buildPopupMenuItem('Link', '', AppColors.buttonSecondaryColor,
                  Icons.inbox, isButtonBg),
              _buildPopupMenuItem(
                  'Link', '12', AppColors.buttondangerColor, Icons.book),
              _buildPopupMenuItem('Another Link', '', Colors.transparent),
              _buildPopupMenuItem(
                  'Disabled Link', '', Colors.transparent, Icons.file_open),
            ],
          ),
          buildSizedBoxH(kTextPadding * 3.5),
          const Divider(),
          buildSizedBoxH(kTextPadding * 3.5),
          Wrap(
            spacing: MediaQuery.of(context).size.width / 8,
            runSpacing: 15,
            children: [
              _buildPopupMenuItem('Link', '', AppColors.buttonSecondaryColor,
                  Icons.inbox, isButtonBg, true),
              _buildPopupMenuItem(
                  'Link', 'New', AppColors.buttonSuccessColor, Icons.book),
              _buildPopupMenuItem('Another Link', '', Colors.transparent),
              _buildPopupMenuItem(
                  'Disabled Link', '', Colors.transparent, Icons.file_open),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPopupMenuItem(String title, String buttonText, Color bgColor,
      [IconData? iconData, bool isButtonBg = false, bool isSecond = false]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Container(
        height: isButtonBg ? 35 : null,
        width: isButtonBg
            ? isSecond
                ? MediaQuery.of(context).size.width / 5.6
                : 70
            : null,
        padding: const EdgeInsets.symmetric(horizontal: kTextPadding * 2),
        decoration: BoxDecoration(
            color: isButtonBg ? AppColors.primaryColor : null,
            borderRadius: BorderRadius.circular(kTextPadding)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: iconData != null,
                  child: Icon(iconData,
                      color: isButtonBg
                          ? AppColors.whiteColor.withOpacity(0.6)
                          : AppColors.textgreyColor,
                      size: kDefaultPadding),
                ),
                buildSizedboxW(iconData != null ? kTextPadding * 2 : 0),
                Text(title,
                    style: TextStyle(
                        color: title == 'Disabled Link'
                            ? AppColors.textgreyColor
                            : isButtonBg
                                ? AppColors.whiteColor
                                : AppColors.tabbarlableColor)),
              ],
            ),
            buildSizedboxW(buttonText.isNotEmpty ? kTextPadding * 2 : 0),
            Visibility(
              visible: buttonText.isEmpty ? false : true,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: kTextPadding * 2, vertical: kTextPadding - 2),
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(kTextPadding)),
                child: Text(
                  buttonText,
                  style: TextStyle(
                      color: buttonText == '86'
                          ? AppColors.blackColor
                          : AppColors.whiteColor,
                      fontSize: kTextPadding * 3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget verticalMenuList(String title, String buttonText, Color bgColor,
      [Color textColor = AppColors.whiteColor, bool isButtonBg = false]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Container(
        height: isButtonBg ? 35 : null,
        width: isButtonBg ? 50 : null,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: kTextPadding * 2),
        decoration: BoxDecoration(
            color: isButtonBg ? AppColors.primaryColor : null,
            borderRadius: BorderRadius.circular(kTextPadding)),
        child: Text(title,
            style: TextStyle(
                color: title == 'Disabled Link'
                    ? AppColors.textgreyColor
                    : isButtonBg
                        ? AppColors.whiteColor
                        : AppColors.tabbarlableColor)),
      ),
    );
  }
}
