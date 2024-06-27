import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';

import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/screens/tab_screen/widgets/main_tabbar_widget.dart';
import 'package:flutter_web_dashboard/screens/tab_screen/widgets/tab_card_widget.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  bool advanceView = true;
  bool basicView = false;

  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);
    final themeData = Theme.of(context);
    final mediaQueryData = MediaQuery.of(context);
    var summaryCardCrossAxisCount =
        mediaQueryData.size.width <= kScreenWidthXxl ? 1 : 2;

    return PortalMasterLayout(
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          UIComponenetsAppBar(
            title: Lang.current.tabs,
            subtitle: Lang.current.tabsubtitle,
            icon: Assets.images.png.tab
                .image(height: kDefaultPadding * 2, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final summaryCardWidth = ((constraints.maxWidth -
                        (kDefaultPadding * (summaryCardCrossAxisCount - 1))) /
                    summaryCardCrossAxisCount);
                return Column(
                  children: [
                    MainTabBar(
                      initialindex: 0,
                      tablength: 2,
                      tab1name: 'Advanced',
                      tab2name: 'Basic',
                      onClose: (value) {
                        if (value == 0) {
                          basicView = false;
                          advanceView = true;
                        } else {
                          advanceView = false;
                          basicView = true;
                        }
                        setState(() {});
                      },
                    ),
                    const Divider(color: AppColors.dividerColor, height: 0),
                    buildSizedBoxH(kDefaultPadding + kTextPadding),
                    Visibility(
                        visible: advanceView,
                        child:
                            _buildTabCards(lang, themeData, summaryCardWidth)),
                    Visibility(
                        visible: basicView,
                        child: _buildbasicTabCards(
                            lang, themeData, summaryCardWidth)),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabCards(
      Lang lang, ThemeData themeData, double summaryCardWidth) {
    return EntranceFader(
      child: Wrap(
        direction: Axis.horizontal,
        spacing: kDefaultPadding,
        runSpacing: kDefaultPadding,
        children: [
          TabCard(
              title: lang.newOrders(2),
              value: 'HEADERS WITH TABS',
              icon: Assets.images.png.clipboard
                  .image(height: kDefaultPadding * 2 - kDefaultPadding / 4),
              backgroundColor: themeData.dividerColor,
              textColor: themeData.colorScheme.onPrimary,
              iconColor: Colors.black12,
              width: summaryCardWidth,
              deletebutton: false,
              tabbutton: false,
              tab2header: false,
              tab3header: false,
              tab4header: false,
              tab5header: false,
              tab6header: false,
              tab7header: false),
          TabCard(
              title: lang.todaySales,
              value: 'HEADER ALTERNATE TABS',
              icon: Assets.images.png.cycle
                  .image(height: kDefaultPadding * 2 - kDefaultPadding / 4),
              backgroundColor: themeData.dividerColor,
              textColor: themeData.colorScheme.onPrimary,
              iconColor: Colors.black12,
              width: summaryCardWidth,
              deletebutton: false,
              tabbutton: true,
              tab2header: false,
              tab3header: false,
              tab4header: false,
              tab5header: false,
              tab6header: false,
              tab7header: false),
          TabCard(
              title: lang.newUsers(2),
              value: 'HEADER TABS BUTTONS',
              icon: Assets.images.png.greengift
                  .image(height: kDefaultPadding * 2 - kDefaultPadding / 4),
              backgroundColor: themeData.dividerColor,
              textColor: themeData.colorScheme.onPrimary,
              iconColor: Colors.black12,
              width: summaryCardWidth,
              deletebutton: true,
              tabbutton: false,
              tab2header: true,
              tab3header: false,
              tab4header: false,
              tab5header: false,
              tab6header: false,
              tab7header: false),
          TabCard(
              title: lang.pendingIssues(2),
              value: 'ALTERNATE TABS',
              icon: Assets.images.png.greengift.image(
                  height: kDefaultPadding * 2 - kDefaultPadding / 4,
                  color: AppColors.tabscreenbitton2),
              backgroundColor: themeData.dividerColor,
              textColor: themeData.colorScheme.onPrimary,
              iconColor: Colors.black12,
              width: summaryCardWidth,
              deletebutton: false,
              tabbutton: false,
              tab2header: false,
              tab3header: true,
              tab4header: false,
              tab5header: false,
              tab6header: false,
              tab7header: false),
          TabCard(
              title: lang.pendingIssues(2),
              value: 'HEADER STANDARD BUTTONS',
              icon: Assets.images.png.greengift.image(
                  height: kDefaultPadding * 2 - 2,
                  color: AppColors.secondaryColor),
              backgroundColor: themeData.dividerColor,
              textColor: themeData.colorScheme.onPrimary,
              iconColor: Colors.black12,
              width: summaryCardWidth,
              deletebutton: false,
              tabbutton: false,
              tab2header: false,
              tab3header: false,
              tab4header: false,
              tab5header: true,
              tab6header: false,
              tab7header: false),
          TabCard(
              title: lang.pendingIssues(2),
              value: 'TABS ALTERNATE ANIMATION',
              icon: Assets.images.png.greengift.image(
                  height: kDefaultPadding * 2 - 2,
                  color: AppColors.secondaryColor),
              backgroundColor: themeData.dividerColor,
              textColor: themeData.colorScheme.onPrimary,
              iconColor: Colors.black12,
              width: summaryCardWidth,
              deletebutton: true,
              tabbutton: false,
              tab2header: false,
              tab3header: true,
              tab4header: true,
              tab5header: false,
              tab6header: false,
              tab7header: false),
          TabCard(
              title: lang.pendingIssues(2),
              value: 'HEADER ICON BUTTONS',
              icon: Assets.images.png.greengift.image(
                  height: kDefaultPadding * 2 - kDefaultPadding / 4,
                  color: AppColors.outlinecolor),
              backgroundColor: themeData.dividerColor,
              textColor: themeData.colorScheme.onPrimary,
              iconColor: Colors.black12,
              width: summaryCardWidth,
              deletebutton: true,
              tabbutton: false,
              tab2header: false,
              tab3header: false,
              tab4header: false,
              tab5header: false,
              tab6header: true,
              tab7header: false),
          TabCard(
              title: lang.pendingIssues(2),
              value: 'HEADER ICON',
              icon: Assets.images.png.greengift.image(
                  height: kDefaultPadding * 2 - kDefaultPadding / 4,
                  color: AppColors.starcolor),
              backgroundColor: themeData.dividerColor,
              textColor: themeData.colorScheme.onPrimary,
              iconColor: Colors.black12,
              width: summaryCardWidth,
              deletebutton: false,
              tabbutton: false,
              tab2header: false,
              tab3header: false,
              tab4header: false,
              tab5header: false,
              tab6header: false,
              tab7header: true),
        ],
      ),
    );
  }

  Widget _buildbasicTabCards(
      Lang lang, ThemeData themeData, double summaryCardWidth) {
    return EntranceFader(
      child: Wrap(
        direction: Axis.horizontal,
        spacing: kDefaultPadding,
        runSpacing: kDefaultPadding,
        children: [
          TabCard(
              title: lang.newOrders(2),
              value: 'HEADERS WITH TABS',
              icon: Assets.images.png.clipboard
                  .image(height: kDefaultPadding * 2 - kDefaultPadding / 4),
              backgroundColor: themeData.dividerColor,
              textColor: themeData.colorScheme.onPrimary,
              iconColor: Colors.black12,
              width: summaryCardWidth,
              deletebutton: false,
              tabbutton: false,
              tab2header: false,
              tab3header: false,
              tab4header: false,
              tab5header: false,
              tab6header: false,
              tab7header: false),
          TabCard(
              title: lang.todaySales,
              value: 'HEADER ALTERNATE TABS',
              icon: Assets.images.png.cycle
                  .image(height: kDefaultPadding * 2 - kDefaultPadding / 4),
              backgroundColor: themeData.dividerColor,
              textColor: themeData.colorScheme.onPrimary,
              iconColor: Colors.black12,
              width: summaryCardWidth,
              deletebutton: false,
              tabbutton: true,
              tab2header: false,
              tab3header: false,
              tab4header: false,
              tab5header: false,
              tab6header: false,
              tab7header: false),
          TabCard(
              title: lang.newUsers(2),
              value: 'HEADER TABS BUTTONS',
              icon: Assets.images.png.greengift
                  .image(height: kDefaultPadding * 2 - kDefaultPadding / 4),
              backgroundColor: themeData.dividerColor,
              textColor: themeData.colorScheme.onPrimary,
              iconColor: Colors.black12,
              width: summaryCardWidth,
              deletebutton: true,
              tabbutton: false,
              tab2header: true,
              tab3header: false,
              tab4header: false,
              tab5header: false,
              tab6header: false,
              tab7header: false),
          TabCard(
              title: lang.pendingIssues(2),
              value: 'HEADER STANDARD BUTTONS',
              icon: Assets.images.png.greengift.image(
                  height: kDefaultPadding * 2 - kDefaultPadding / 4,
                  color: AppColors.tabscreenbitton2),
              backgroundColor: themeData.dividerColor,
              textColor: themeData.colorScheme.onPrimary,
              iconColor: Colors.black12,
              width: summaryCardWidth,
              deletebutton: false,
              tabbutton: false,
              tab2header: false,
              tab3header: true,
              tab4header: false,
              tab5header: false,
              tab6header: false,
              tab7header: false),
        ],
      ),
    );
  }
}
