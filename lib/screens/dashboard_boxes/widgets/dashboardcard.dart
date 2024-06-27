import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';

class SummarysCard extends StatelessWidget {
  final String title;
  final String value;
  final Widget icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final double width;

  const SummarysCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: themeData.cardColor,
        child: Stack(
          alignment: MediaQuery.of(context).size.width > kScreenWidthSm
              ? Alignment.centerLeft
              : Alignment.center,
          children: [
            Visibility(
              visible: MediaQuery.of(context).size.width > kScreenWidthSm,
              child: Positioned(
                  top: kDefaultPadding * 0.5,
                  right: kDefaultPadding * 0.5,
                  child: icon),
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment:
                    MediaQuery.of(context).size.width < kScreenWidthSm
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                children: [
                  Visibility(
                      visible:
                          MediaQuery.of(context).size.width <= kScreenWidthSm,
                      child: icon),
                  Text(
                    value,
                    style: textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    title,
                    style: textTheme.labelLarge!.copyWith(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
