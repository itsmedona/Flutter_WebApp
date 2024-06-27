import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/screens/dashboard_boxes/widgets/dashboardBoxes.dart';
import 'package:flutter_web_dashboard/screens/dashboard_boxes/widgets/dashboardcard.dart';
import 'package:flutter_web_dashboard/theme/app_theme.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';
import '../dashboard_screen/widgets/dashboard_card_widgets.dart';

class DashboardBoxesScreen extends StatefulWidget {
  const DashboardBoxesScreen({Key? key}) : super(key: key);

  @override
  State<DashboardBoxesScreen> createState() => _DashboardBoxesScreenState();
}

class _DashboardBoxesScreenState extends State<DashboardBoxesScreen> {
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
            title: Lang.current.DashboardBox,
            subtitle: Lang.current.Dashboardboxestitle,
            icon: Assets.images.png.star
                .image(height: kDefaultPadding * 2, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding + kTextPadding),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return EntranceFader(
                  child: Column(
                    children: [
                      _buildProductCards(
                          summaryCardCrossAxisCount, lang, themeData),
                      buildSizedBoxH(kDefaultPadding),
                      const Divider(),
                      buildSizedBoxH(kDefaultPadding),
                      _builddashboardCard(
                          summaryCardCrossAxisCount, lang, themeData),
                      buildSizedBoxH(kDefaultPadding),
                      const Divider(),
                      buildSizedBoxH(kDefaultPadding),
                      _buildcolorBox(
                          summaryCardCrossAxisCount, lang, themeData),
                      buildSizedBoxH(kDefaultPadding),
                      const Divider(),
                      buildSizedBoxH(kDefaultPadding),
                      _buildchartcolorBox(
                          summaryCardCrossAxisCount, lang, themeData)
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
      int summaryCardCrossAxisCount, Lang lang, ThemeData themeData) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final summaryCardWidth = ((constraints.maxWidth -
                (kDefaultPadding * (summaryCardCrossAxisCount - 1))) /
            summaryCardCrossAxisCount);

        return Wrap(
          direction: Axis.horizontal,
          spacing: kDefaultPadding,
          runSpacing: kDefaultPadding,
          children: [
            SummarysCard(
              title: 'Time Management',
              value: '87.4',
              icon:
                  Assets.images.png.favorite.image(height: kDefaultPadding * 3),
              backgroundColor: themeData.dividerColor,
              textColor: themeData.colorScheme.onPrimary,
              iconColor: Colors.black45,
              width: summaryCardWidth,
            ),
            SummarysCard(
              title: lang.todaySales,
              value: '+12%',
              icon: Assets.images.png.greengift
                  .image(height: kDefaultPadding * 3),
              backgroundColor: themeData.dividerColor,
              textColor: themeData.colorScheme.onPrimary,
              iconColor: AppColors.secondaryColor,
              width: summaryCardWidth,
            ),
            SummarysCard(
              title: 'Bank Balance',
              value: '44.5',
              icon: Assets.images.png.car.image(height: kDefaultPadding * 4),
              backgroundColor: themeData.dividerColor,
              textColor: themeData.colorScheme.onPrimary,
              iconColor: AppColors.primaryColor,
              width: summaryCardWidth,
            ),
            SummarysCard(
              title: lang.pendingIssues(2),
              value: '50',
              icon:
                  Assets.images.png.circular.image(height: kDefaultPadding * 3),
              backgroundColor: themeData.dividerColor,
              textColor: themeData.colorScheme.onPrimary,
              iconColor: AppColors.buttonWarningColor,
              width: summaryCardWidth,
            ),
          ],
        );
      },
    );
  }
}

Widget _buildcolorBox(
    int summaryCardCrossAxisCount, Lang lang, ThemeData themeData) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final summaryCardWidth = ((constraints.maxWidth -
              (kDefaultPadding * (summaryCardCrossAxisCount - 1))) /
          summaryCardCrossAxisCount);

      return Wrap(
        direction: Axis.horizontal,
        spacing: kDefaultPadding,
        runSpacing: kDefaultPadding,
        children: [
          DashboardBoxCard(
            title: lang.newOrders(2),
            value: '57.4 %',
            icon: Assets.images.png.hourglass
                .image(height: kDefaultPadding * 2.5),
            backgroundColor: themeData.cardColor,
            textColor: themeData.textColor,
            iconColor: AppColors.primaryColor,
            width: summaryCardWidth,
            subtitle: '28.9 %',
            ispogressbar: false,
            image: Assets.images.svg.chart
                .svg(height: kDefaultPadding * kTextPadding * 2),
          ),
          DashboardBoxCard(
            title: lang.todaySales,
            value: '+38%',
            icon: Assets.images.png.car.image(height: kDefaultPadding * 2.5),
            backgroundColor: themeData.cardColor,
            textColor: themeData.textColor,
            iconColor: AppColors.secondaryColor,
            width: summaryCardWidth,
            subtitle: '50.7 %',
            ispogressbar: false,
            image: Assets.images.png.chart3.image(
                fit: BoxFit.fill,
                color: AppColors.buttonSuccessColor,
                height: kDefaultPadding * kTextPadding * 2),
          ),
          DashboardBoxCard(
            title: lang.newUsers(2),
            value: '39.2 K',
            icon: Assets.images.png.rocket.image(height: kDefaultPadding * 2.5),
            backgroundColor: themeData.cardColor,
            textColor: themeData.textColor,
            iconColor: AppColors.buttonWarningColor,
            width: summaryCardWidth,
            subtitle: '80.1 %',
            ispogressbar: false,
            image: Assets.images.png.chart2.image(
                fit: BoxFit.fill,
                color: AppColors.buttonWarningColor,
                height: kDefaultPadding * kTextPadding * 2),
          ),
          DashboardBoxCard(
            title: lang.pendingIssues(2),
            value: '50.2 K',
            icon:
                Assets.images.png.foamHand.image(height: kDefaultPadding * 2.5),
            backgroundColor: themeData.cardColor,
            textColor: themeData.textColor,
            iconColor: AppColors.buttonSuccessColor,
            width: summaryCardWidth,
            subtitle: '150.5 %',
            ispogressbar: false,
            image: Assets.images.jpg.chart11.image(
                height: kDefaultPadding * kTextPadding * 2, fit: BoxFit.fill),
          ),
        ],
      );
    },
  );
}

Widget _buildchartcolorBox(
    int summaryCardCrossAxisCount, Lang lang, ThemeData themeData) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final summaryCardWidth = ((constraints.maxWidth -
              (kDefaultPadding * (summaryCardCrossAxisCount - 1))) /
          summaryCardCrossAxisCount);

      return Wrap(
        direction: Axis.horizontal,
        spacing: kDefaultPadding,
        runSpacing: kDefaultPadding,
        children: [
          DashboardBoxCard(
            title: lang.newOrders(2),
            value: '57.4 %',
            icon: Assets.images.png.hourglass
                .image(height: kDefaultPadding * 2.5),
            backgroundColor: themeData.cardColor,
            textColor: themeData.textColor,
            iconColor: AppColors.primaryColor,
            width: summaryCardWidth,
            subtitle: '28.9 %',
            ispogressbar: true,
          ),
          DashboardBoxCard(
            title: lang.todaySales,
            value: '+38%',
            icon: Assets.images.png.car.image(height: kDefaultPadding * 2.5),
            backgroundColor: themeData.cardColor,
            textColor: themeData.textColor,
            iconColor: AppColors.secondaryColor,
            width: summaryCardWidth,
            subtitle: '50.7 %',
            ispogressbar: true,
          ),
          DashboardBoxCard(
            title: lang.newUsers(2),
            value: '39.2 K',
            icon: Assets.images.png.rocket.image(height: kDefaultPadding * 2.5),
            backgroundColor: themeData.cardColor,
            textColor: themeData.textColor,
            iconColor: AppColors.buttonWarningColor,
            width: summaryCardWidth,
            subtitle: '80.1 %',
            ispogressbar: true,
          ),
          DashboardBoxCard(
            title: lang.pendingIssues(2),
            value: '50.2 K',
            icon:
                Assets.images.png.foamHand.image(height: kDefaultPadding * 2.5),
            backgroundColor: themeData.cardColor,
            textColor: themeData.textColor,
            iconColor: AppColors.buttonSuccessColor,
            width: summaryCardWidth,
            subtitle: '150.5 %',
            ispogressbar: true,
          ),
        ],
      );
    },
  );
}

Widget _builddashboardCard(
    int dashboardCardCount, Lang lang, ThemeData themeData) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final summaryCardWidth = ((constraints.maxWidth -
              (kDefaultPadding * (dashboardCardCount - 1))) /
          dashboardCardCount);

      return Wrap(
        direction: Axis.horizontal,
        spacing: kDefaultPadding,
        runSpacing: kDefaultPadding,
        children: [
          DashboardCard(
            title: lang.newOrders(2),
            value: '87.4',
            icon:
                Assets.images.png.secured.image(height: kDefaultPadding * 2.5),
            backgroundColor: AppColors.pinkpurplesidebar,
            textColor: themeData.colorScheme.onPrimary,
            // iconColor: Colors.black12,
            width: summaryCardWidth,
            subtitle: '54.9 %',
          ),
          DashboardCard(
            title: lang.todaySales,
            value: '+12%',
            icon: Assets.images.png.layers.image(height: kDefaultPadding * 2.5),
            backgroundColor: AppColors.navyblue,
            textColor: themeData.colorScheme.onPrimary,
            // iconColor: Colors.black12,
            width: summaryCardWidth,
            subtitle: '62.7 %',
          ),
          DashboardCard(
            title: lang.newUsers(2),
            value: '17.2 K',
            icon: Assets.images.png.greengift
                .image(height: kDefaultPadding * 2.5),
            backgroundColor: AppColors.greenblack,
            textColor: themeData.colorScheme.onPrimary,
            // iconColor: Colors.black12,
            width: summaryCardWidth,
            subtitle: '72.1 %',
          ),
          DashboardCard(
            title: lang.pendingIssues(2),
            value: '63.2 K',
            icon: Assets.images.png.dashboard
                .image(height: kDefaultPadding * 2.5),
            backgroundColor: AppColors.buttonGradi,
            textColor: themeData.colorScheme.onPrimary,
            // iconColor: Colors.black12,
            width: summaryCardWidth,
            subtitle: '175.5 %',
          ),
        ],
      );
    },
  );
}
