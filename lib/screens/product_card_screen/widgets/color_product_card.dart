import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class ColorProductCard extends StatefulWidget {
  final String subtitle;
  final String title;
  final Widget icon;

  final Color textColor;
  final Color cardcolor;
  final double width;
  final int price;
  final Color buttonColor;

  const ColorProductCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.textColor,
    required this.cardcolor,
    required this.width,
    required this.price,
    required this.buttonColor,
  }) : super(key: key);

  @override
  State<ColorProductCard> createState() => _ColorProductCardState();
}

class _ColorProductCardState extends State<ColorProductCard> {
  bool islike = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final mediaQueryData = MediaQuery.of(context);

    return SizedBox(
      height: mediaQueryData.size.width <= kScreenWidthMd ? 380 : 400,
      width: widget.width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: widget.cardcolor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildicon(),
                  buildSizedBoxH(kDefaultPadding / 2),
                  Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppColors.grayWhite),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 2,
                            vertical: kDefaultPadding),
                        child: widget.icon,
                      )),
                  buildSizedBoxH(kDefaultPadding / 2),
                  _buildTitle(widget.title, textTheme, mediaQueryData,
                      widget.textColor),
                  buildSizedBoxH(kDefaultPadding / 2),
                  _buildSubTitle(widget.subtitle, textTheme, mediaQueryData,
                      widget.textColor),
                  buildSizedBoxH(kDefaultPadding / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '\$ ${widget.price}',
                        style: textTheme.titleLarge!
                            .copyWith(color: widget.textColor),
                      ),
                    ],
                  ),
                  buildSizedBoxH(kDefaultPadding / 2),
                  Visibility(
                    visible: mediaQueryData.size.width <= kScreenWidthMd
                        ? false
                        : true,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: widget.buttonColor),
                      onPressed: () {},
                      child: Text(
                        'Add to cart',
                        style: textTheme.labelMedium!
                            .copyWith(color: widget.textColor),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: mediaQueryData.size.width <= kScreenWidthMd
                        ? true
                        : false,
                    child: Container(
                      height: 50,
                      width: mediaQueryData.size.width / 2,
                      decoration: BoxDecoration(
                          color: widget.buttonColor,
                          borderRadius:
                              BorderRadius.circular(kDefaultPadding / 2)),
                      child: Center(
                          child: Text(
                        'Add to cart',
                        style: textTheme.labelLarge!
                            .copyWith(color: widget.textColor),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildicon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        rating(),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                islike = !islike;
                setState(() {});
              },
              child: Icon(Icons.favorite,
                  color: islike ? AppColors.errorcolor : AppColors.whiteColor),
            ),
            buildSizedboxW(kDefaultPadding / 2),
            const Icon(
              Icons.share,
              color: AppColors.whiteColor,
            ),
          ],
        ),
      ],
    );
  }

  Row _buildTitle(String title, TextTheme textTheme,
      MediaQueryData mediaQueryData, Color textColor) {
    return Row(
      children: [
        Flexible(
          child: Text(
            title,
            maxLines: mediaQueryData.size.width <= kScreenWidthMd ? 1 : 2,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.w600, color: textColor),
          ),
        ),
      ],
    );
  }

  Row _buildSubTitle(String subtitle, TextTheme textTheme,
      MediaQueryData mediaQueryData, Color textColor) {
    return Row(
      children: [
        Flexible(
          child: Text(
            subtitle,
            maxLines: mediaQueryData.size.width <= kScreenWidthMd ? 1 : 2,
            overflow: TextOverflow.ellipsis,
            style: textTheme.labelSmall!.copyWith(color: textColor),
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
}
