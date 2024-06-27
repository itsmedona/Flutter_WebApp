import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';

class AlertCard extends StatelessWidget {
  final String title;
  final String value;
  final Color backgroundColor;
  final Color textColor;
  final Widget body;
  final double width;

  const AlertCard(
      {Key? key,
      required this.title,
      required this.value,
      required this.backgroundColor,
      required this.textColor,
      required this.body,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 605.0,
      width: width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: themeData.cardColor,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
                    child: Text(
                      value,
                      style: textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Divider(),
                  body
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildAlertCard extends StatelessWidget {
  final String title;
  final String value;
  final Color backgroundColor;
  final Color textColor;
  final Widget body;
  final double width;

  const BuildAlertCard(
      {Key? key,
      required this.title,
      required this.value,
      required this.backgroundColor,
      required this.textColor,
      required this.body,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 230.0,
      width: width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: themeData.cardColor,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
                    child: Text(
                      value,
                      style: textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Divider(),
                  body
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
