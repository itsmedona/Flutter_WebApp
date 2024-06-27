import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/screens/ui_components/widgets/bages_tab_widget.dart';
import 'package:flutter_web_dashboard/screens/ui_components/widgets/labels_tab_widget.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';

class BadgesAndLabelsScreen extends StatefulWidget {
  const BadgesAndLabelsScreen({Key? key}) : super(key: key);

  @override
  State<BadgesAndLabelsScreen> createState() => _BadgesAndLabelsScreenState();
}

class _BadgesAndLabelsScreenState extends State<BadgesAndLabelsScreen> {
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
              title: Lang.current.badgesAndLabels,
              subtitle: Lang.current.badgesAndLabelsSubtitle,
              icon: Assets.images.icons.glasses.svg(
                  height: kDefaultPadding * 2,
                  fit: BoxFit.cover,
                  color: AppColors.buttonSuccessColor)),
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
                        icon: Text(Lang.current.badges,
                            style: textTheme.bodyMedium)),
                    Tab(
                        icon: Text(Lang.current.labels,
                            style: textTheme.bodyMedium)),
                  ],
                ),
              ),
              const Divider(height: 0),
            ],
          ),
          selectedIndex == 0
              ? BadgesTabWidget(
                  mediaQueryData: mediaQueryData, themeData: themeData)
              : LabelsTabWidget(
                  mediaQueryData: mediaQueryData, themeData: themeData),
        ],
      ),
    );
  }
}
