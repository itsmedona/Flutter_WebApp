import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/screens/dashboard_screen/widgets/dashboard_card_widgets.dart';
import 'package:flutter_web_dashboard/screens/dashboard_screen/widgets/summary_card.dart';
import 'package:flutter_web_dashboard/theme/app_theme.dart';
import 'package:flutter_web_dashboard/widgets/card_header.dart';
import 'package:flutter_web_dashboard/widgets/line_chart_card.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _dataTableHorizontalScrollController = ScrollController();

  @override
  void dispose() {
    _dataTableHorizontalScrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);
    final themeData = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final summaryCardCrossAxisCount = (size.width >= kScreenWidthLg ? 4 : 2);
    const dashboardCardCount = 2;

    return PortalMasterLayout(
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          UIComponenetsAppBar(
            title: Lang.current.dashboardtitle,
            subtitle: Lang.current.dashboardsubtitle,
            icon: Assets.images.png.rocket
                .image(height: kDefaultPadding * 2, fit: BoxFit.cover),
          ),
          buildSizedBoxH(kDefaultPadding),
          EntranceFader(
            child: Column(
              children: [
                Visibility(
                  visible: (size.width >= kScreenWidthXxl),
                  child: Row(
                    children: [
                      Expanded(child: _buildChart()),
                      buildSizedboxW(kDefaultPadding),
                      Expanded(
                          child: _builddashboardCard(
                              dashboardCardCount, lang, themeData)),
                    ],
                  ),
                ),
                Visibility(
                    visible: (size.width <= kScreenWidthXxl),
                    child: _buildChart()),
                Visibility(
                  visible: (size.width <= kScreenWidthXxl),
                  child:
                      _builddashboardCard(dashboardCardCount, lang, themeData),
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final summaryCardWidth = ((constraints.maxWidth -
                            (kDefaultPadding *
                                (summaryCardCrossAxisCount - 1))) /
                        summaryCardCrossAxisCount);

                    return Wrap(
                      direction: Axis.horizontal,
                      spacing: kDefaultPadding,
                      runSpacing: kDefaultPadding,
                      children: [
                        SummaryCard(
                          title: lang.newOrders(2),
                          value: '87.4',
                          icon: Icons.shopping_cart_rounded,
                          backgroundColor: themeData.dividerColor,
                          textColor: themeData.colorScheme.onPrimary,
                          iconColor: themeData.dividerColor,
                          width: summaryCardWidth,
                        ),
                        SummaryCard(
                          title: lang.todaySales,
                          value: '+12%',
                          icon: Icons.ssid_chart_rounded,
                          backgroundColor: themeData.dividerColor,
                          textColor: themeData.colorScheme.onPrimary,
                          iconColor: themeData.dividerColor,
                          width: summaryCardWidth,
                        ),
                        SummaryCard(
                          title: lang.newUsers(2),
                          value: '44.5',
                          icon: Icons.group_add_rounded,
                          backgroundColor: themeData.dividerColor,
                          textColor: themeData.colorScheme.onPrimary,
                          iconColor: themeData.dividerColor,
                          width: summaryCardWidth,
                        ),
                        SummaryCard(
                          title: lang.pendingIssues(2),
                          value: '50',
                          icon: Icons.report_gmailerrorred_rounded,
                          backgroundColor: themeData.dividerColor,
                          textColor: themeData.textColor,
                          iconColor: themeData.dividerColor,
                          width: summaryCardWidth,
                        ),
                      ],
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: kDefaultPadding / 2, top: kDefaultPadding),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardHeader(
                          title: lang.recentOrders(2),
                          showDivider: false,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final double dataTableWidth =
                                  max(kScreenWidthMd, constraints.maxWidth);

                              return Scrollbar(
                                controller:
                                    _dataTableHorizontalScrollController,
                                thumbVisibility: true,
                                trackVisibility: true,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  controller:
                                      _dataTableHorizontalScrollController,
                                  child: SizedBox(
                                    width: dataTableWidth,
                                    child: Theme(
                                      data: themeData.copyWith(
                                          // cardTheme: appDataTableTheme.cardTheme,
                                          // dataTableTheme:
                                          //     appDataTableTheme.dataTableThemeData,
                                          ),
                                      child: DataTable(
                                        showCheckboxColumn: false,
                                        showBottomBorder: true,
                                        columns: const [
                                          DataColumn(label: Text('No.')),
                                          DataColumn(label: Text('Date')),
                                          DataColumn(label: Text('Item')),
                                          DataColumn(
                                            label: Text('Rating'),
                                          ),
                                          DataColumn(
                                            label: Text('qty'),
                                          ),
                                          DataColumn(
                                            label: Text('Price'),
                                          ),
                                        ],
                                        rows: List.generate(5, (index) {
                                          return DataRow.byIndex(
                                            index: index,
                                            cells: [
                                              DataCell(Text('#${index + 1}')),
                                              const DataCell(
                                                  Text('2022-06-30')),
                                              DataCell(
                                                  Text('Item ${index + 1}')),
                                              DataCell(Text(
                                                  '${Random().nextInt(50)}')),
                                              DataCell(Text(
                                                  '${Random().nextInt(100)}')),
                                              DataCell(Text(
                                                  '${Random().nextInt(10000)}')),
                                            ],
                                          );
                                        }),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChart() {
    return const LineChartCard();
  }

  Widget _builddashboardCard(
      int dashboardCardCount, Lang lang, ThemeData themeData) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: LayoutBuilder(
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
                icon: Assets.images.png.secured
                    .image(height: kDefaultPadding * 2.5),
                backgroundColor: AppColors.contactGradi,
                textColor: themeData.textColor,
                iconColor: Colors.transparent,
                width: summaryCardWidth,
                subtitle: '54.9 %',
              ),
              DashboardCard(
                title: lang.todaySales,
                value: '+12%',
                icon: Assets.images.png.layers
                    .image(height: kDefaultPadding * 2.5),
                backgroundColor: AppColors.navyblue,
                textColor: themeData.textColor,
                iconColor: Colors.transparent,
                width: summaryCardWidth,
                subtitle: '62.7 %',
              ),
              DashboardCard(
                title: lang.newUsers(2),
                value: '17.2 K',
                icon: Assets.images.png.greengift
                    .image(height: kDefaultPadding * 2.5),
                backgroundColor: AppColors.primaryGradiant,
                textColor: themeData.textColor,
                iconColor: Colors.transparent,
                width: summaryCardWidth,
                subtitle: '72.1 %',
              ),
              DashboardCard(
                title: lang.pendingIssues(2),
                value: '63.2 K',
                icon: Assets.images.png.dashboard
                    .image(height: kDefaultPadding * 2.5),
                backgroundColor: AppColors.redwhite,
                textColor: themeData.textColor,
                iconColor: Colors.transparent,
                width: summaryCardWidth,
                subtitle: '175.5 %',
              ),
            ],
          );
        },
      ),
    );
  }
}
