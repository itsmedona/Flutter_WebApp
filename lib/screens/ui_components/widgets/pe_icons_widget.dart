import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/theme/app_theme.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class Pe7IconsWidget extends StatefulWidget {
  const Pe7IconsWidget(
      {super.key, required this.mediaQueryData, required this.themeData});
  final MediaQueryData mediaQueryData;
  final ThemeData themeData;

  @override
  State<Pe7IconsWidget> createState() => _Pe7IconsWidgetState();
}

class _Pe7IconsWidgetState extends State<Pe7IconsWidget> {
  List pe7IconsGredientList = [
    {'icon': Assets.images.png.favorite},
    {'icon': Assets.images.png.moon},
    {'icon': Assets.images.png.rocket},
    {'icon': Assets.images.png.phoneCall},
    {'icon': Assets.images.png.car},
    {'icon': Assets.images.png.settingsGearIcon},
    {'icon': Assets.images.png.tab},
    {'icon': Assets.images.png.play},
    {'icon': Assets.images.png.house},
    {'icon': Assets.images.png.greengift},
    {'icon': Assets.images.png.umbrella},
    {'icon': Assets.images.png.code},
  ];
  List pe7IconsList = [
    {'title': 'pe-7s-album', 'icon': Assets.images.icons.album},
    {'title': 'pe-7s-arc', 'icon': Assets.images.icons.arc},
    {'title': 'pe-7s-back-2', 'icon': Assets.images.icons.back2},
    {'title': 'pe-7s-bandaid', 'icon': Assets.images.icons.bandaid},
    {'title': 'pe-7s-car', 'icon': Assets.images.icons.car},
    {'title': 'pe-7s-diamond', 'icon': Assets.images.icons.diamond},
    {'title': 'pe-7s-door-lock', 'icon': Assets.images.icons.doorLock},
    {'title': 'pe-7s-eyedropper', 'icon': Assets.images.icons.eyedropper},
    {'title': 'pe-7s-female', 'icon': Assets.images.icons.female},
    {'title': 'pe-7s-gym', 'icon': Assets.images.icons.gym},
    {'title': 'pe-7s-hammer', 'icon': Assets.images.icons.hammer},
    {'title': 'pe-7s-headphones', 'icon': Assets.images.icons.headphones},
    {'title': 'pe-7s-helm', 'icon': Assets.images.icons.helm},
    {'title': 'pe-7s-hourglass', 'icon': Assets.images.icons.hourglass},
    {'title': 'pe-7s-leaf', 'icon': Assets.images.icons.leaf},
    {'title': 'pe-7s-magic-wand', 'icon': Assets.images.icons.magicWand},
    {'title': 'pe-7s-male', 'icon': Assets.images.icons.male},
    {'title': 'pe-7s-map-2', 'icon': Assets.images.icons.map2},
    {'title': 'pe-7s-next-2', 'icon': Assets.images.icons.next2},
    {'title': 'pe-7s-paint-bucket', 'icon': Assets.images.icons.paintBucket},
    {'title': 'pe-7s-pendrive', 'icon': Assets.images.icons.pendrive},
    {'title': 'pe-7s-photo', 'icon': Assets.images.icons.photo},
    {'title': 'pe-7s-piggy', 'icon': Assets.images.icons.piggy},
    {'title': 'pe-7s-plugin', 'icon': Assets.images.icons.plugin},
    {'title': 'pe-7s-refresh-2', 'icon': Assets.images.icons.refresh2},
    {'title': 'pe-7s-rocket', 'icon': Assets.images.icons.rocket},
    {
      'title': 'pe-7s-cloud-download',
      'icon': Assets.images.icons.cloudDownload
    },
    {
      'title': 'pe-7s-angle-up-circle',
      'icon': Assets.images.icons.angleUpCircle
    },
    {'title': 'pe-7s-close-circle', 'icon': Assets.images.icons.closeCircle},
    {'title': 'pe-7s-id', 'icon': Assets.images.icons.id},
    {'title': 'pe-7s-angle-up', 'icon': Assets.images.icons.angleUp},
    {'title': 'pe-7s-cloud-upload', 'icon': Assets.images.icons.cloudUpload},
    {'title': 'pe-7s-cash', 'icon': Assets.images.icons.cash},
    {'title': 'pe-7s-close', 'icon': Assets.images.icons.close},
    {'title': 'pe-7s-bluetooth', 'icon': Assets.images.icons.bluetooth},
    {'title': 'pe-7s-filter', 'icon': Assets.images.icons.filter},
    {'title': 'pe-7s-flag', 'icon': Assets.images.icons.flag},
    {'title': 'pe-7s-folder', 'icon': Assets.images.icons.folder},
    {'title': 'pe-7s-gift', 'icon': Assets.images.icons.gift},
    {'title': 'pe-7s-help1', 'icon': Assets.images.icons.help1},
    {'title': 'pe-7s-help2', 'icon': Assets.images.icons.help2},
    {'title': 'pe-7s-home', 'icon': Assets.images.icons.home},
    {'title': 'pe-7s-info', 'icon': Assets.images.icons.info},
    {'title': 'pe-7s-junk', 'icon': Assets.images.icons.junk},
    {'title': 'pe-7s-keypad', 'icon': Assets.images.icons.keypad},
    {'title': 'pe-7s-less', 'icon': Assets.images.icons.less},
    {'title': 'pe-7s-light', 'icon': Assets.images.icons.light},
    {'title': 'pe-7s-like', 'icon': Assets.images.icons.like},
    {'title': 'pe-7s-link', 'icon': Assets.images.icons.link},
    {'title': 'pe-7s-lintern', 'icon': Assets.images.icons.lintern},
    {'title': 'pe-7s-lock', 'icon': Assets.images.icons.lock},
    {'title': 'pe-7s-look', 'icon': Assets.images.icons.look},
    {'title': 'pe-7s-loop', 'icon': Assets.images.icons.loop},
    {'title': 'pe-7s-magnet', 'icon': Assets.images.icons.magnet},
    {'title': 'pe-7s-mail-open-file', 'icon': Assets.images.icons.mailOpenFile},
    {'title': 'pe-7s-mail-open', 'icon': Assets.images.icons.mailOpen},
    {'title': 'pe-7s-micro', 'icon': Assets.images.icons.micro},
    {'title': 'pe-7s-monitor', 'icon': Assets.images.icons.monitor},
  ];
  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      child: Column(
        children: [
          buildSizedBoxH(kDefaultPadding + kTextPadding),
          pe7IconsHorizontalList(),
          buildSizedBoxH(kDefaultPadding),
          pe7IconsVerticalList(),
        ],
      ),
    );
  }

  Widget pe7IconsHorizontalList() {
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

  Widget pe7IconsVerticalList() {
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
          gridviewpe7IconList(),
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
        children: pe7IconsGredientList
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

  Widget gridviewpe7IconList() {
    return Center(
      child: Wrap(
        spacing: kDefaultPadding,
        runSpacing: kDefaultPadding,
        children: pe7IconsList
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
                    e['icon'].svg(color: widget.themeData.textColor),
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
