import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class SliderCard extends StatelessWidget {
  final String subtitle;
  final String title;
  final Widget body;
  final double width;

  const SliderCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.width,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    final mediaQueryData = MediaQuery.of(context);

    return SizedBox(
      width: width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: themeData.cardColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildSizedBoxH(kDefaultPadding),
                  _buildTitle(title, textTheme, mediaQueryData),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: body,
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

Row _buildTitle(
    String title, TextTheme textTheme, MediaQueryData mediaQueryData) {
  return Row(
    children: [
      Flexible(
        child: Text(
          title,
          maxLines: mediaQueryData.size.width <= kScreenWidthMd ? 1 : 2,
          overflow: TextOverflow.ellipsis,
          style: textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}

Row _buildSubTitle(
    String subtitle, TextTheme textTheme, MediaQueryData mediaQueryData) {
  return Row(
    children: [
      Flexible(
        child: Text(
          subtitle,
          maxLines: mediaQueryData.size.width <= kScreenWidthMd ? 1 : 2,
          overflow: TextOverflow.ellipsis,
          style: textTheme.labelSmall!.copyWith(),
        ),
      ),
    ],
  );
}
