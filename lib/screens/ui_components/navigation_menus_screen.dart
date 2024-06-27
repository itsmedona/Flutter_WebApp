import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/screens/ui_components/widgets/navigation_menus_horizontal_tab_widget.dart';
import 'package:flutter_web_dashboard/screens/ui_components/widgets/navigation_menus_vertical_tab_widget.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';

class NavigationMenusScreen extends StatefulWidget {
  const NavigationMenusScreen({Key? key}) : super(key: key);

  @override
  State<NavigationMenusScreen> createState() => _NavigationMenusScreenState();
}

class _NavigationMenusScreenState extends State<NavigationMenusScreen> {
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
              title: Lang.current.navigationMenus,
              subtitle: Lang.current.navigationMenuSubtitle,
              icon: Assets.images.png.clipboard
                  .image(height: kDefaultPadding * 2, fit: BoxFit.cover)),
          buildSizedBoxH(kDefaultPadding),
          tabBarIcons(textTheme, mediaQueryData, themeData),
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
                        icon: Text(Lang.current.verticalMenus,
                            style: textTheme.bodyMedium)),
                    Tab(
                        icon: Text(Lang.current.horizontalMenus,
                            style: textTheme.bodyMedium)),
                  ],
                ),
              ),
              const Divider(height: 0),
            ],
          ),
          selectedIndex == 0
              ? NavigationMenusVerticalTabWidget(
                  mediaQueryData: mediaQueryData, themeData: themeData)
              : NavigationMenusHorizontalTabWidget(
                  mediaQueryData: mediaQueryData, themeData: themeData),
          buildSizedBoxH(kDefaultPadding),
        ],
      ),
    );
  }
}
