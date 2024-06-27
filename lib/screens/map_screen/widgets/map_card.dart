import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class MapCard extends StatelessWidget {
  final String title;
  final Widget map;
  final double width;

  const MapCard({
    Key? key,
    required this.title,
    required this.width,
    required this.map,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    final mediaQueryData = MediaQuery.of(context);

    return SizedBox(
      height: 380,
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
                  buildSizedBoxH(kDefaultPadding / 2),
                  _buildTitle(title, textTheme, mediaQueryData),
                  const Divider(),
                  buildSizedBoxH(kDefaultPadding / 2),
                  map,
                  buildSizedBoxH(kDefaultPadding / 2),
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
