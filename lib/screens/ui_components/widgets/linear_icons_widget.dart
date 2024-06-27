import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/theme/app_theme.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class LinearIconsWidget extends StatefulWidget {
  const LinearIconsWidget(
      {super.key, required this.mediaQueryData, required this.themeData});
  final ThemeData themeData;
  final MediaQueryData mediaQueryData;

  @override
  State<LinearIconsWidget> createState() => _LinearIconsWidgetState();
}

class _LinearIconsWidgetState extends State<LinearIconsWidget> {
  List linearIconsGredientList = [
    {'icon': Assets.images.png.layers},
    {'icon': Assets.images.png.hourglass},
    {'icon': Assets.images.png.padlock},
    {'icon': Assets.images.png.remove},
    {'icon': Assets.images.png.shoppingBag},
    {'icon': Assets.images.png.star},
    {'icon': Assets.images.png.house},
    {'icon': Assets.images.png.tablet},
    {'icon': Assets.images.png.weather},
    {'icon': Assets.images.png.circular},
    {'icon': Assets.images.png.secured},
  ];
  List linearIconsList = [
    {'title': 'airplay', 'icon': Assets.images.icons.airplay},
    {'title': 'alarm', 'icon': Assets.images.icons.alarm},
    {'title': 'albums', 'icon': Assets.images.icons.albums},
    {'title': 'anchor', 'icon': Assets.images.icons.anchor},
    {'title': 'attention', 'icon': Assets.images.icons.attention},
    {'title': 'back', 'icon': Assets.images.icons.back},
    {'title': 'ball', 'icon': Assets.images.icons.ball},
    {'title': 'battery', 'icon': Assets.images.icons.battery},
    {'title': 'bell', 'icon': Assets.images.icons.bell},
    {'title': 'bicycle', 'icon': Assets.images.icons.bicycle},
    {'title': 'bookmarks', 'icon': Assets.images.icons.bookmarks},
    {'title': 'box1', 'icon': Assets.images.icons.box1},
    {'title': 'box2', 'icon': Assets.images.icons.box2},
    {'title': 'browser', 'icon': Assets.images.icons.browser},
    {'title': 'calculator', 'icon': Assets.images.icons.calculator},
    {'title': 'call', 'icon': Assets.images.icons.call},
    {'title': 'camera', 'icon': Assets.images.icons.camera},
    {'title': 'cart', 'icon': Assets.images.icons.cart},
    {'title': 'chat', 'icon': Assets.images.icons.chat},
    {'title': 'check', 'icon': Assets.images.icons.check},
    {'title': 'back-2', 'icon': Assets.images.icons.back2},
    {'title': 'bandaid', 'icon': Assets.images.icons.bandaid},
    {'title': 'cloud', 'icon': Assets.images.icons.cloud},
    {'title': 'coffee', 'icon': Assets.images.icons.coffee},
    {'title': 'comment', 'icon': Assets.images.icons.comment},
    {'title': 'compass', 'icon': Assets.images.icons.compass},
    {'title': 'config', 'icon': Assets.images.icons.config},
    {'title': 'copy-file', 'icon': Assets.images.icons.copyFile},
    {'title': 'credit', 'icon': Assets.images.icons.credit},
    {'title': 'crop', 'icon': Assets.images.icons.crop},
    {'title': 'angle-down-circle', 'icon': Assets.images.icons.angleDownCircle},
    {'title': 'angle-down', 'icon': Assets.images.icons.angleDown},
    {'title': 'angle-left-circle', 'icon': Assets.images.icons.angleLeftCircle},
    {'title': 'angle-left', 'icon': Assets.images.icons.angleLeft},
    {
      'title': 'angle-right-circle',
      'icon': Assets.images.icons.angleRightCircle
    },
    {'title': 'angle-right', 'icon': Assets.images.icons.angleRight},
    {'title': 'gleam', 'icon': Assets.images.icons.gleam},
    {'title': 'glasses', 'icon': Assets.images.icons.glasses},
    {'title': 'graph', 'icon': Assets.images.icons.graph},
    {'title': 'graph1', 'icon': Assets.images.icons.graph1},
    {'title': 'graph2', 'icon': Assets.images.icons.graph2},
    {'title': 'culture', 'icon': Assets.images.icons.culture},
    {'title': 'cup', 'icon': Assets.images.icons.cup},
    {'title': 'date', 'icon': Assets.images.icons.date},
    {'title': 'diskette', 'icon': Assets.images.icons.diskette},
    {'title': 'display1', 'icon': Assets.images.icons.display1},
    {'title': 'display2', 'icon': Assets.images.icons.display2},
    {'title': 'download', 'icon': Assets.images.icons.download},
    {'title': 'drawer', 'icon': Assets.images.icons.drawer},
    {'title': 'drop', 'icon': Assets.images.icons.drop},
    {'title': 'edit', 'icon': Assets.images.icons.edit},
    {'title': 'exapnd2', 'icon': Assets.images.icons.exapnd2},
    {'title': 'exapnd1', 'icon': Assets.images.icons.expand1},
    {'title': 'file', 'icon': Assets.images.icons.file},
  ];
  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      child: Column(
        children: [
          buildSizedBoxH(kDefaultPadding + kTextPadding),
          linearIconsHorizontalList(),
          buildSizedBoxH(kDefaultPadding),
          linearIconsVerticalList(),
          buildSizedBoxH(kDefaultPadding),
        ],
      ),
    );
  }

  Widget linearIconsHorizontalList() {
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

  Widget linearIconsVerticalList() {
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
          gridviewlinearIconList(),
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
        children: linearIconsGredientList
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
                        horizontal: kDefaultPadding * 2.2,
                        vertical: kDefaultPadding * 2.2),
                    shadowColor: Colors.transparent),
                child: e['icon'].image(height: kDefaultPadding * 2.8),
                onPressed: () {},
              ),
            )
            .toList(),
      ),
    );
  }

  Widget gridviewlinearIconList() {
    return Center(
      child: Wrap(
        spacing: kDefaultPadding,
        runSpacing: kDefaultPadding,
        children: linearIconsList
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
                    buildSizedBoxH(kTextPadding * 2.5),
                    Text(e['title'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: widget.themeData.textColor.withOpacity(0.5)))
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
