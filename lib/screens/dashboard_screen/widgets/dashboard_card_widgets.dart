import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final LinearGradient backgroundColor;
  final Color textColor;
  final Color? iconColor;
  final double width;
  final Widget icon;
  final String subtitle;

  const DashboardCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    this.iconColor,
    required this.width,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 199.0,
      width: width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
              color: iconColor ?? null,
              gradient: iconColor == null ? backgroundColor : null),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: kDefaultPadding),
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: AppColors.grayWhite, shape: BoxShape.circle),
                  child:
                      Padding(padding: const EdgeInsets.all(8.0), child: icon),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
