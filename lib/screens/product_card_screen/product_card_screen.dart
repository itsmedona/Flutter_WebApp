import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/screens/product_card_screen/widgets/color_product_card.dart';
import 'package:flutter_web_dashboard/screens/product_card_screen/widgets/product_card_widget.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';

class ProductCardScreen extends StatefulWidget {
  const ProductCardScreen({Key? key}) : super(key: key);

  @override
  State<ProductCardScreen> createState() => _ProductCardScreenState();
}

class _ProductCardScreenState extends State<ProductCardScreen> {
  bool advanceView = true;
  bool basicView = false;

  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);
    final themeData = Theme.of(context);
    final mediaQueryData = MediaQuery.of(context);

    var summaryCardCrossAxisCount = mediaQueryData.size.width <= kScreenWidthMd
        ? 1
        : mediaQueryData.size.width <= kScreenWidthXxl
            ? 2
            : 4;

    return PortalMasterLayout(
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          UIComponenetsAppBar(
            title: Lang.current.productcard,
            subtitle: Lang.current.productsubTitle,
            icon: Assets.images.png.star
                .image(height: kDefaultPadding * 2, fit: BoxFit.cover),
          ),
          // buildSizedBoxH(kDefaultPadding),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final summaryCardWidth = ((constraints.maxWidth -
                        (kDefaultPadding * (summaryCardCrossAxisCount - 1))) /
                    summaryCardCrossAxisCount);
                return EntranceFader(
                  child: Column(
                    children: [
                      buildSizedBoxH(kDefaultPadding / 2),
                      _buildProductCards(lang, themeData, summaryCardWidth),
                      buildSizedBoxH(kDefaultPadding),
                      _buildcolorProductCards(
                          lang, themeData, summaryCardWidth),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCards(
      Lang lang, ThemeData themeData, double summaryCardWidth) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: kDefaultPadding,
      runSpacing: kDefaultPadding,
      children: [
        ProductCard(
          title:
              'ComfyStep Lightweight & quality Sneakers for Everyday Comfort',
          subtitle:
              "Stepping into Style:   Embrace Comfort and Style with Our Trendsetting Shoe Collection",
          price: Random().nextInt(1000),
          icon: Assets.images.png.shoes
              .image(height: kDefaultPadding * kTextPadding * 2),
          backgroundColor: themeData.dividerColor,
          textColor: themeData.colorScheme.onPrimary,
          iconColor: Colors.black12,
          width: summaryCardWidth,
        ),
        ProductCard(
          title: "MiniTime Classic Analog Watch - Small, Stylish, and Timeless",
          subtitle:
              "Timeless Elegance: Experience Luxury with Our Exquisite Watch Collection",
          price: Random().nextInt(1000),
          icon: Assets.images.png.watch
              .image(height: kDefaultPadding * kTextPadding * 2),
          backgroundColor: themeData.dividerColor,
          textColor: themeData.colorScheme.onPrimary,
          iconColor: Colors.black12,
          width: summaryCardWidth,
        ),
        ProductCard(
          title:
              'PocketSound Bluetooth Headset - Small and Portable for On-the-Go Listening',
          subtitle:
              "Unleash Your Audio Journey: Immerse Yourself in Superior Sound with Our Cutting-Edge Headphones",
          price: Random().nextInt(1000),
          icon: Assets.images.png.headphone
              .image(height: kDefaultPadding * kTextPadding * 2),
          backgroundColor: themeData.dividerColor,
          textColor: themeData.colorScheme.onPrimary,
          iconColor: Colors.black12,
          width: summaryCardWidth,
        ),
        ProductCard(
          title:
              "ClassicFit Cotton Neavy blue  T-Shirt - Timeless Comfort and Style",
          subtitle:
              "Elevate Your Wardrobe: Embrace Comfort and Style with Our Versatile T-Shirt Collection",
          price: Random().nextInt(1000),
          icon: Assets.images.png.tshirt
              .image(height: kDefaultPadding * kTextPadding * 2),
          backgroundColor: themeData.dividerColor,
          textColor: themeData.colorScheme.onPrimary,
          iconColor: Colors.black12,
          width: summaryCardWidth,
        ),
      ],
    );
  }
}

Widget _buildcolorProductCards(
    Lang lang, ThemeData themeData, double summaryCardWidth) {
  return Wrap(
    direction: Axis.horizontal,
    spacing: kDefaultPadding,
    runSpacing: kDefaultPadding,
    children: [
      ColorProductCard(
        title: 'UrbanTote Leather Handbag - Modern Elegance for Everyday',
        subtitle:
            "Carry Fashionably: Complete Your Look with our Chic and Functional Handbag Collection",
        price: Random().nextInt(1000),
        icon: Assets.images.png.bag
            .image(height: kDefaultPadding * kTextPadding * 2),
        textColor: AppColors.whiteColor,
        cardcolor: Colors.blue.shade100,
        buttonColor: Colors.blue,
        width: summaryCardWidth,
      ),
      ColorProductCard(
        title: "I-phone 13 Redefining Excellence in Mobile Technology",
        subtitle:
            "Seamless Innovation: Experience the Next Level of Technology with the Latest iPhone",
        price: Random().nextInt(1000),
        icon: Assets.images.png.iphone
            .image(height: kDefaultPadding * kTextPadding * 2),
        textColor: AppColors.whiteColor,
        cardcolor: Colors.indigo.shade100,
        buttonColor: Colors.indigo,
        width: summaryCardWidth,
      ),
      ColorProductCard(
        title:
            "GlowRadiance Facial Serum - Illuminate Your Skin's Natural Beauty",
        subtitle:
            "Unlock Your Natural Radiance: Enhance Your Beauty with our Transformative Beauty Product Line",
        price: Random().nextInt(1000),
        icon: Assets.images.png.beautyproduct
            .image(height: kDefaultPadding * kTextPadding * 2),
        textColor: AppColors.whiteColor,
        cardcolor: Colors.green.shade100,
        buttonColor: Colors.green,
        width: summaryCardWidth,
      ),
      ColorProductCard(
        title: "I-Watch  Redefining Excellence in watch Technology",
        subtitle:
            "Stay Connected. Stay Active. Stay Stylish: Experience the Power of Apple Watch on Your Wrist",
        price: Random().nextInt(1000),
        icon: Assets.images.png.applewatch
            .image(height: kDefaultPadding * kTextPadding * 2),
        textColor: AppColors.whiteColor,
        cardcolor: Colors.purple.shade200,
        buttonColor: Colors.purple,
        width: summaryCardWidth,
      ),
    ],
  );
}
