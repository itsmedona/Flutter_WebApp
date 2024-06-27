import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/screens/carousels_screen/widgets/slider.dart';
import 'package:flutter_web_dashboard/screens/carousels_screen/widgets/slider_card.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';

class CarouselSliderScreen extends StatefulWidget {
  const CarouselSliderScreen({Key? key}) : super(key: key);
  State<CarouselSliderScreen> createState() => _CarouselSliderScreenState();
}

class _CarouselSliderScreenState extends State<CarouselSliderScreen> {
  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);
    final themeData = Theme.of(context);
    final mediaQueryData = MediaQuery.of(context);

    var summaryCardCrossAxisCount = mediaQueryData.size.width <= kScreenWidthMd
        ? 1
        : mediaQueryData.size.width <= kScreenWidthXxl
            ? 2
            : 3;

    return PortalMasterLayout(
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          UIComponenetsAppBar(
            title: Lang.current.carousels,
            subtitle: Lang.current.carouselsSubtitle,
            icon: Assets.images.png.moon
                .image(height: kDefaultPadding * 2, fit: BoxFit.cover),
          ),
          // buildSizedBoxH(kDefaultPadding),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding + kTextPadding),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final summaryCardWidth = ((constraints.maxWidth -
                        (kDefaultPadding * (summaryCardCrossAxisCount - 1))) /
                    summaryCardCrossAxisCount);
                return EntranceFader(
                  child: Column(
                    children: [
                      _buildsliderCards(lang, themeData, summaryCardWidth),
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

  Widget _buildsliderCards(
      Lang lang, ThemeData themeData, double summaryCardWidth) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: kDefaultPadding,
      runSpacing: kDefaultPadding,
      children: [
        SliderCard(
          title: 'NO CENTER SLIDER',
          subtitle:
              "Stepping into Style:   Embrace Comfort and Style with Our Trendsetting Shoe Collection",
          width: summaryCardWidth,
          body: const NoCenterSlider(),
        ),
        SliderCard(
          title: 'IMAGE SLIDER',
          subtitle:
              "Stepping into Style:   Embrace Comfort and Style with Our Trendsetting Shoe Collection",
          width: summaryCardWidth,
          body: const ImageSlider(),
        ),
        SliderCard(
          title: 'COMPLICATED IMAGE SLIDER',
          subtitle:
              "Stepping into Style:   Embrace Comfort and Style with Our Trendsetting Shoe Collection",
          width: summaryCardWidth,
          body: const ComplicatedImage(),
        ),
        SliderCard(
          title: 'ENLATGE STRATEGY SLIDER',
          subtitle:
              "Stepping into Style:   Embrace Comfort and Style with Our Trendsetting Shoe Collection",
          width: summaryCardWidth,
          body: const EnlargeStrategy(),
        ),
        SliderCard(
          title: 'MANUALLY CONTROLLED SLIDER',
          subtitle:
              "Stepping into Style:   Embrace Comfort and Style with Our Trendsetting Shoe Collection",
          width: summaryCardWidth,
          body: const ManuallyControlledSlider(),
        ),
        SliderCard(
          title: 'NO LOOP SLIDER',
          subtitle:
              "Stepping into Style:   Embrace Comfort and Style with Our Trendsetting Shoe Collection",
          width: summaryCardWidth,
          body: const NoonLooping(),
        ),
        SliderCard(
          title: 'FULL SCREEN SLIDER',
          subtitle:
              "Stepping into Style:   Embrace Comfort and Style with Our Trendsetting Shoe Collection",
          width: summaryCardWidth,
          body: const FullscreenSlider(),
        ),
        SliderCard(
          title: 'CAROUSEL WITH INDICATOR',
          subtitle:
              "Stepping into Style:   Embrace Comfort and Style with Our Trendsetting Shoe Collection",
          width: summaryCardWidth,
          body: const CarouselWithIndicator(),
        ),
        SliderCard(
          title: 'PREFETCH IMAGE SLIDER',
          subtitle:
              "Stepping into Style:   Embrace Comfort and Style with Our Trendsetting Shoe Collection",
          width: summaryCardWidth,
          body: const PrefetchImage(),
        ),
        SliderCard(
          title: 'MULTIPLE ITEM SLIDER',
          subtitle:
              "Stepping into Style:   Embrace Comfort and Style with Our Trendsetting Shoe Collection",
          width: summaryCardWidth,
          body: const MultipleItem(),
        ),
        SliderCard(
          title: 'ENLATGE STRATEGY ZOOM SLIDER',
          subtitle:
              "Stepping into Style:   Embrace Comfort and Style with Our Trendsetting Shoe Collection",
          width: summaryCardWidth,
          body: const EnlargeStrategyZoom(),
        ),
        SliderCard(
          title: 'BASIC SLIDER',
          subtitle:
              "Stepping into Style:   Embrace Comfort and Style with Our Trendsetting Shoe Collection",
          width: summaryCardWidth,
          body: const Basic(),
        ),
      ],
    );
  }
}
