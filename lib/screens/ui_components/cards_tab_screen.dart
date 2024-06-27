import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/screens/ui_components/widgets/cards_basic_tab_widget.dart';
import 'package:flutter_web_dashboard/screens/ui_components/widgets/cards_color_state_tab_widget.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final themeData = Theme.of(context);
    final mediaQueryData = MediaQuery.of(context);
    return PortalMasterLayout(
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          UIComponenetsAppBar(
              title: Lang.current.cards,
              subtitle: Lang.current.cardsubtitle,
              icon: Assets.images.png.clipboard
                  .image(height: kDefaultPadding * 2, fit: BoxFit.cover)),
          buildSizedBoxH(kDefaultPadding),
          tabBarIcons(textTheme, mediaQueryData, themeData),
          buildSizedBoxH(kDefaultPadding),
        ],
      ),
    );
  }

  Widget tabBarIcons(
      TextTheme textTheme, MediaQueryData mediaQueryData, ThemeData themeData) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              SizedBox(
                height: 55,
                child: TabBar(
                  onTap: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                  automaticIndicatorColorAdjustment: false,
                  dragStartBehavior: DragStartBehavior.down,
                  isScrollable: true,
                  tabs: [
                    Tab(
                        icon: Text(Lang.current.basic,
                            style: textTheme.bodyMedium)),
                    Tab(
                        icon: Text(Lang.current.colorStates,
                            style: textTheme.bodyMedium)),
                  ],
                ),
              ),
              const Divider(height: 0),
            ],
          ),
          selectedIndex == 0
              ? CardsBasicTabWidget(
                  mediaQueryData: mediaQueryData, themeData: themeData)
              : CardsColorStateTabWidget(
                  mediaQueryData: mediaQueryData, themeData: themeData)
        ],
      ),
    );
  }
}
