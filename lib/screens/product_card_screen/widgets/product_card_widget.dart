import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class ProductCard extends StatelessWidget {
  final String subtitle;
  final String title;
  final Widget icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final double width;
  final int price;

  const ProductCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
    required this.width,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    final mediaQueryData = MediaQuery.of(context);

    return SizedBox(
      height: mediaQueryData.size.width <= kScreenWidthMd ? 380 : 395,
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
                  Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppColors.grayWhite),
                      child: Padding(
                        padding: const EdgeInsets.all(kDefaultPadding * 2),
                        child: icon,
                      )),
                  buildSizedBoxH(kDefaultPadding / 2),
                  _buildTitle(title, textTheme, mediaQueryData),
                  buildSizedBoxH(kDefaultPadding / 2),
                  _buildSubTitle(subtitle, textTheme, mediaQueryData),
                  buildSizedBoxH(kDefaultPadding / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ $price',
                        style: textTheme.titleLarge!.copyWith(),
                      ),
                      rating(),
                    ],
                  ),
                  buildSizedBoxH(kDefaultPadding / 2),
                  mediaQueryData.size.width <= kScreenWidthMd
                      ? Container(
                          height: 50,
                          width: mediaQueryData.size.width / 2,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius:
                                  BorderRadius.circular(kDefaultPadding / 2)),
                          child: Center(
                              child: Text(
                            'Add to cart',
                            style: textTheme.labelLarge!
                                .copyWith(color: AppColors.whiteColor),
                          )),
                        )
                      : ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Add to cart',
                            style: textTheme.labelMedium!
                                .copyWith(color: AppColors.whiteColor),
                          ),
                        )
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

Widget rating() {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingBar.builder(
          itemSize: 18,
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: AppColors.starcolor,
          ),
          onRatingUpdate: (rating3) {},
        ),
      ],
    ),
  );
}
