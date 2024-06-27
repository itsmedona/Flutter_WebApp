import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/screens/map_screen/widgets/map.dart';
import 'package:flutter_web_dashboard/screens/map_screen/widgets/map_card.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);
    final themeData = Theme.of(context);
    final mediaQueryData = MediaQuery.of(context);

    var summaryCardCrossAxisCount =
        mediaQueryData.size.width <= kScreenWidthMd ? 1 : 2;

    return PortalMasterLayout(
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          UIComponenetsAppBar(
            title: Lang.current.map,
            subtitle: Lang.current.mapsubtitle,
            icon: Assets.images.icons.mapMarker.svg(
                height: kDefaultPadding * 2,
                fit: BoxFit.cover,
                color: AppColors.buttonAltColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding + kTextPadding),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final summaryCardWidth = ((constraints.maxWidth -
                        (kDefaultPadding * (summaryCardCrossAxisCount - 1))) /
                    summaryCardCrossAxisCount);
                return Column(
                  children: [
                    _buildProductCards(lang, themeData, summaryCardWidth),
                  ],
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
    return EntranceFader(
      child: Wrap(
        direction: Axis.horizontal,
        spacing: kDefaultPadding,
        runSpacing: kDefaultPadding,
        children: [
          MapCard(
              title: 'World Map',
              width: summaryCardWidth,
              map: const WorldMapWidget()),
          MapCard(
            title: "Australia",
            width: summaryCardWidth,
            map: const MapWidget(
              mappath: 'assets/maps/australia.json',
              zoom: true,
            ),
          ),
          MapCard(
            title: "India",
            width: summaryCardWidth,
            map: const MapWidget(
              mappath: 'assets/maps/india.json',
              zoom: true,
            ),
          ),
          MapCard(
            title: "South America",
            width: summaryCardWidth,
            map: const MapWidget(
              mappath: 'assets/maps/south_america.json',
              zoom: true,
            ),
          ),
          MapCard(
            title: "Usa",
            width: summaryCardWidth,
            map: const MapWidget(
              mappath: 'assets/maps/usa.json',
              zoom: true,
            ),
          ),
          MapCard(
            title: "Africa",
            width: summaryCardWidth,
            map: const MapWidget(
              mappath: 'assets/maps/africa.json',
              zoom: true,
            ),
          ),
          MapCard(
            title: "Europe",
            width: summaryCardWidth,
            map: const MapWidget(
              mappath: 'assets/maps/europe.json',
              zoom: true,
            ),
          ),
          MapCard(
            title: "Germony",
            width: summaryCardWidth,
            map: const MapWidget(
              mappath: 'assets/maps/germany.json',
              zoom: true,
            ),
          ),
        ],
      ),
    );
  }
}
