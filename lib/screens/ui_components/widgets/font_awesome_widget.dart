import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/theme/app_theme.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class FontAwesomeWidget extends StatefulWidget {
  const FontAwesomeWidget(
      {super.key, required this.mediaQueryData, required this.themeData});
  final ThemeData themeData;
  final MediaQueryData mediaQueryData;

  @override
  State<FontAwesomeWidget> createState() => _FontAwesomeWidgetState();
}

class _FontAwesomeWidgetState extends State<FontAwesomeWidget> {
  List fontAwesomeIconsGredientList = [
    // {'icon': Assets.images.png.favorite},
    {'icon': Assets.images.png.rocket},
    {'icon': Assets.images.png.moon},
    {'icon': Assets.images.png.phoneCall},
    // {'icon': Assets.images.png.settingsGearIcon},
    {'icon': Assets.images.png.house},
    {'icon': Assets.images.gif.icons8Services},
    {'icon': Assets.images.gif.loader},
    {'icon': Assets.images.png.play},
    {'icon': Assets.images.png.code},
    {'icon': Assets.images.png.greengift},
    {'icon': Assets.images.png.umbrella},
  ];
  List fontAwesomeIconsList = [
    {
      'title': 'arrow-left-long-solid',
      'icon': Assets.images.fontAwesome.arrowLeftLongSolid
    },
    {
      'title': 'arrow-right-long-solid',
      'icon': Assets.images.fontAwesome.arrowRightLongSolid
    },
    {'title': 'award-solid', 'icon': Assets.images.fontAwesome.awardSolid},
    {
      'title': 'chevron-down-solid',
      'icon': Assets.images.fontAwesome.chevronDownSolid
    },
    {
      'title': 'chevron-left-solid',
      'icon': Assets.images.fontAwesome.chevronLeftSolid
    },
    {
      'title': 'chevron-right-solid',
      'icon': Assets.images.fontAwesome.chevronRightSolid
    },
    {
      'title': 'chevron-up-solid',
      'icon': Assets.images.fontAwesome.chevronUpSolid
    },
    {'title': 'cloud-solid', 'icon': Assets.images.fontAwesome.cloudSolid},
    {'title': 'code-solid', 'icon': Assets.images.fontAwesome.codeSolid},
    {'title': 'gift-solid', 'icon': Assets.images.fontAwesome.giftSolid},
    {
      'title': 'hourglass-end-solid',
      'icon': Assets.images.fontAwesome.hourglassEndSolid
    },
    {
      'title': 'right-to-bracket-solid',
      'icon': Assets.images.fontAwesome.rightToBracketSolid
    },
    {'title': 'unlock-solid', 'icon': Assets.images.fontAwesome.unlockSolid},
    {
      'title': 'volume-low-solid',
      'icon': Assets.images.fontAwesome.volumeLowSolid
    }
  ];
  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      child: Column(
        children: [
          buildSizedBoxH(kDefaultPadding + kTextPadding),
          fontAwesomeIconsHorizontalList(),
          buildSizedBoxH(kDefaultPadding),
          fontAwesomeIconsVerticalList(true),
          buildSizedBoxH(kDefaultPadding),
          fontAwesomeIconsVerticalList(false),
        ],
      ),
    );
  }

  Widget fontAwesomeIconsHorizontalList() {
    return Container(
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
            Lang.current.gradientIcon,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: widget.themeData.textColor),
          ),
          buildSizedBoxH(kDefaultPadding),
          gridviewpe7GredientIconList(),
          buildSizedBoxH(kDefaultPadding),
        ],
      ),
    );
  }

  Widget fontAwesomeIconsVerticalList(bool isText) {
    return Container(
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
          buildSizedBoxH(kDefaultPadding),
          gridviewFontAwesomeIconList(isText),
          buildSizedBoxH(kDefaultPadding),
        ],
      ),
    );
  }

  Widget gridviewpe7GredientIconList() {
    return Center(
      child: Wrap(
        spacing: kDefaultPadding,
        runSpacing: kDefaultPadding,
        children: fontAwesomeIconsGredientList
            .map(
              (e) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black.withOpacity(0.2),
                    backgroundColor: widget.themeData.canvasColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Set the border radius as desired
                        side: const BorderSide(
                            color: AppColors.buttonBorderColor, width: 2)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 2.5,
                        vertical: kDefaultPadding * 2.5),
                    shadowColor: Colors.transparent),
                child: e['icon'].image(height: kDefaultPadding * 5),
                onPressed: () {},
              ),
            )
            .toList(),
      ),
    );
  }

  Widget gridviewFontAwesomeIconList(bool isText) {
    return Center(
      child: Wrap(
        spacing: kDefaultPadding,
        runSpacing: kDefaultPadding,
        children: fontAwesomeIconsList
            .map(
              (e) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black.withOpacity(0.2),
                    backgroundColor: widget.themeData.canvasColor,
                    fixedSize: Size.fromWidth(
                        widget.mediaQueryData.size.width >= kScreenWidthSm
                            ? 200
                            : 300),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Set the border radius as desired
                        side: const BorderSide(
                            color: AppColors.buttonBorderColor, width: 2)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                        vertical: kDefaultPadding * 1.2),
                    shadowColor: Colors.transparent),
                child: Column(
                  children: [
                    e['icon'].svg(
                        height: kDefaultPadding * 2,
                        color: widget.themeData.textColor),
                    buildSizedBoxH(isText ? kTextPadding * 2.5 : 0),
                    Visibility(
                      visible: isText,
                      child: Text(e['title'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color:
                                  widget.themeData.textColor.withOpacity(0.5))),
                    )
                  ],
                ),
                onPressed: () {},
              ),
            )
            .toList(),
      ),
    );
  }
}
