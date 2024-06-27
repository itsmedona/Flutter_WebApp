import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class DashboardBoxCard extends StatelessWidget {
  final String title;
  final String value;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final double width;
  final Widget icon;
  final String subtitle;
  final bool ispogressbar;
  final Widget? image;

  const DashboardBoxCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
    required this.width,
    required this.subtitle,
    required this.ispogressbar,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: !ispogressbar ? 250.0 : 225,
      width: width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: backgroundColor,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            !ispogressbar
                ? image!
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child:
                        _linearProgressIndicator(context, 0.4, iconColor, true),
                  ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding / 2),
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: AppColors.grayWhite, shape: BoxShape.circle),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0), child: icon),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
                      child: Text(
                        value,
                        style: textTheme.headlineMedium!.copyWith(
                            fontWeight: FontWeight.w600, color: textColor),
                      ),
                    ),
                    Text(
                      title,
                      style: textTheme.labelSmall!.copyWith(color: textColor),
                    ),
                    buildSizedBoxH(kDefaultPadding),
                    Text(
                      subtitle,
                      style: textTheme.labelMedium!.copyWith(color: textColor),
                    ),
                    buildSizedBoxH(kDefaultPadding),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _linearProgressIndicator(BuildContext context, double? value,
      Color color, bool withBottomPadding) {
    final themeData = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
          bottom: (withBottomPadding ? kDefaultPadding * 1.5 : 0.0)),
      child: Theme(
        data: themeData.copyWith(
          colorScheme: themeData.colorScheme.copyWith(primary: color),
        ),
        child: LinearProgressIndicator(
          value: value,
          backgroundColor: themeData.scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
