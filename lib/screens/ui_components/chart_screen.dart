import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/screens/ui_components/widgets/chart_circular_charts_tabs_widget.dart';
import 'package:flutter_web_dashboard/screens/ui_components/widgets/chart_liner_bar_charts_tabs_widget.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final mediaQueryData = MediaQuery.of(context);
    return PortalMasterLayout(
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          UIComponenetsAppBar(
              title: Lang.current.chartJS,
              subtitle: Lang.current.chartJSSubtitle,
              icon: Assets.images.png.clipboard
                  .image(height: kDefaultPadding * 2, fit: BoxFit.cover)),
          buildSizedBoxH(kDefaultPadding),
          tabBarIcons(textTheme, mediaQueryData),
        ],
      ),
    );
  }

  Widget tabBarIcons(TextTheme textTheme, MediaQueryData mediaQueryData) {
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
                        icon: Text(Lang.current.circularCharts,
                            style: textTheme.bodyMedium)),
                    Tab(
                        icon: Text(Lang.current.linesAndBarsCharts,
                            style: textTheme.bodyMedium)),
                  ],
                ),
              ),
              const Divider(height: 0),
            ],
          ),
          buildSizedBoxH(kDefaultPadding + kTextPadding),
          selectedIndex == 0
              ? ChartCircularChartsTabsWidget(mediaQueryData: mediaQueryData)
              : ChartLinerBarChartsTabsWidget(mediaQueryData: mediaQueryData),
          buildSizedBoxH(kDefaultPadding),
        ],
      ),
    );
  }
}
