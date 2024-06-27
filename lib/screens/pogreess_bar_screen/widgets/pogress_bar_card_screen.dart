import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class PogressBarCard extends StatelessWidget {
  final String title;

  final double width;
  final Widget body;

  const PogressBarCard({
    Key? key,
    required this.title,
    required this.width,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final themeData = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: mediaQueryData.size.width >= kScreenWidthMd ? 220.0 : 270,
      width: width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: themeData.cardColor,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Divider(),
                  buildSizedBoxH(kDefaultPadding),
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
