import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/widgets/custom_card.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

int selectedIndex = 0;

class LineChartCard extends StatefulWidget {
  const LineChartCard({super.key});

  @override
  State<LineChartCard> createState() => _LineChartCardState();
}

class _LineChartCardState extends State<LineChartCard> {
  late TooltipBehavior _tooltip;
  late List<_ChartData> chartdata;
  final List<FlSpot> spots = const [
    FlSpot(1.68, 21.04),
    FlSpot(2.84, 26.23),
    FlSpot(5.19, 19.82),
    FlSpot(6.01, 24.49),
    FlSpot(7.81, 19.82),
    FlSpot(9.49, 23.50),
    FlSpot(12.26, 19.57),
    FlSpot(15.63, 20.90),
    FlSpot(20.39, 39.20),
    FlSpot(23.69, 75.62),
    FlSpot(26.21, 46.58),
    FlSpot(29.87, 42.97),
    FlSpot(32.49, 46.54),
    FlSpot(35.09, 40.72),
    FlSpot(38.74, 43.18),
    FlSpot(41.47, 59.91),
    FlSpot(43.12, 53.18),
    FlSpot(46.30, 90.10),
    FlSpot(47.88, 81.59),
    FlSpot(51.71, 75.53),
    FlSpot(54.21, 78.95),
    FlSpot(55.23, 86.94),
    FlSpot(57.40, 78.98),
    FlSpot(60.49, 74.38),
    FlSpot(64.30, 48.34),
    FlSpot(67.17, 70.74),
    FlSpot(70.35, 75.43),
    FlSpot(73.39, 69.88),
    FlSpot(75.87, 80.04),
    FlSpot(77.32, 74.38),
    FlSpot(81.43, 68.43),
    FlSpot(86.12, 69.45),
    FlSpot(90.06, 78.60),
    FlSpot(94.68, 46.05),
    FlSpot(98.35, 42.80),
    FlSpot(101.25, 53.05),
    FlSpot(103.07, 46.06),
    FlSpot(106.65, 42.31),
    FlSpot(108.20, 32.64),
    FlSpot(110.40, 45.14),
    FlSpot(114.24, 53.27),
    FlSpot(116.60, 42.13),
    FlSpot(118.52, 57.60),
  ];

  final leftTitle = {
    0: '0',
    20: '2K',
    40: '4K',
    60: '6K',
    80: '8K',
    100: '10K'
  };

  final bottomTitle = {
    0: 'Jan',
    10: 'Feb',
    20: 'Mar',
    30: 'Apr',
    40: 'May',
    50: 'Jun',
    60: 'Jul',
    70: 'Aug',
    80: 'Sep',
    90: 'Oct',
    100: 'Nov',
    110: 'Dec',
  };
  bool isbutton1 = false;
  bool isbutton2 = false;
  @override
  void initState() {
    chartdata = [
      _ChartData('CHN', 12, 15),
      _ChartData('GER', 15, 10),
      _ChartData('RUS', 30, 24),
      _ChartData('BRZ', 6.4, 11),
      _ChartData('IND', 14, 9)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    final mediaQueryData = MediaQuery.of(context);

    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            child: mediaQueryData.size.width >= kScreenWidthSm
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Assets.images.png.clipboard.image(
                              height: kDefaultPadding * 2,
                              color: AppColors.dashifycolor.withOpacity(0.4)),
                          buildSizedboxW(kDefaultPadding),
                          Text(
                            Lang.current.brandwidthreport,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    AppColors.tabcolor),
                                backgroundColor: selectedIndex == 0
                                    ? MaterialStateProperty.all<Color>(
                                        AppColors.tabcolor)
                                    : MaterialStateProperty.all<Color>(
                                        Colors.transparent),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(isbutton1
                                        ? AppColors.whiteColor
                                        : selectedIndex == 0
                                            ? AppColors.whiteColor
                                            : AppColors.blackColor),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(kTextPadding),
                                  ),
                                ),
                                elevation: selectedIndex == 0
                                    ? MaterialStateProperty.all<double>(4.0)
                                    : MaterialStateProperty.all<double>(0.0),
                              ),
                              onPressed: () {
                                selectedIndex = 0;
                                setState(() {});
                              },
                              onHover: (value) {
                                isbutton1 = value;
                                setState(() {});
                              },
                              child: Text(Lang.current.tabone)),
                          buildSizedboxW(kDefaultPadding / 2),
                          ElevatedButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    AppColors.tabcolor),
                                backgroundColor: selectedIndex == 1
                                    ? MaterialStateProperty.all<Color>(
                                        AppColors.tabcolor)
                                    : MaterialStateProperty.all<Color>(
                                        Colors.transparent),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(isbutton2
                                        ? AppColors.whiteColor
                                        : selectedIndex == 1
                                            ? AppColors.whiteColor
                                            : AppColors.blackColor),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(kTextPadding),
                                  ),
                                ),
                                elevation: selectedIndex == 1
                                    ? MaterialStateProperty.all<double>(4.0)
                                    : MaterialStateProperty.all<double>(0.0),
                              ),
                              onHover: (value) {
                                isbutton2 = value;
                                setState(() {});
                              },
                              onPressed: () {
                                selectedIndex = 1;
                                setState(() {});
                              },
                              child: Text(Lang.current.tabtwo))
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.images.png.clipboard.image(
                              height: kDefaultPadding * 2,
                              color: AppColors.dashifycolor.withOpacity(0.4)),
                          buildSizedboxW(kDefaultPadding),
                          Text(
                            Lang.current.brandwidthreport,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      buildSizedBoxH(kDefaultPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    AppColors.tabcolor),
                                backgroundColor: selectedIndex == 0
                                    ? MaterialStateProperty.all<Color>(
                                        AppColors.tabcolor)
                                    : MaterialStateProperty.all<Color>(
                                        Colors.transparent),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(isbutton2
                                        ? AppColors.whiteColor
                                        : selectedIndex == 0
                                            ? AppColors.whiteColor
                                            : AppColors.blackColor),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(kTextPadding),
                                  ),
                                ),
                                elevation: selectedIndex == 0
                                    ? MaterialStateProperty.all<double>(4.0)
                                    : MaterialStateProperty.all<double>(0.0),
                              ),
                              onHover: (value) {
                                isbutton1 = value;
                                setState(() {});
                              },
                              onPressed: () {
                                selectedIndex = 0;
                                setState(() {});
                              },
                              child: Text(Lang.current.tabone)),
                          buildSizedboxW(kDefaultPadding / 2),
                          ElevatedButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    AppColors.tabcolor),
                                backgroundColor: selectedIndex == 1
                                    ? MaterialStateProperty.all<Color>(
                                        AppColors.tabcolor)
                                    : MaterialStateProperty.all<Color>(
                                        Colors.transparent),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(isbutton2
                                        ? AppColors.whiteColor
                                        : selectedIndex == 1
                                            ? AppColors.whiteColor
                                            : AppColors.blackColor),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(kTextPadding),
                                  ),
                                ),
                                elevation: selectedIndex == 1
                                    ? MaterialStateProperty.all<double>(4.0)
                                    : MaterialStateProperty.all<double>(0.0),
                              ),
                              onHover: (value) {
                                isbutton2 = value;
                                setState(() {});
                              },
                              onPressed: () {
                                selectedIndex = 1;
                                setState(() {});
                              },
                              child: Text(Lang.current.tabtwo))
                        ],
                      ),
                    ],
                  ),
          ),
          buildSizedBoxH(kDefaultPadding / 2),
          const Divider(),
          buildSizedBoxH(kDefaultPadding),
          selectedIndex == 0
              ? SizedBox(
                  height: 315,
                  child: TweenAnimationBuilder(
                    tween: LineChartDataTween(
                      begin: avgChart(),
                      end: mainChart(themedata),
                    ),
                    duration: const Duration(
                        milliseconds: 300), // Animation duration in seconds
                    builder: (context, LineChartData chartData, _) {
                      // The builder function where the animation happens
                      return LineChart(chartData);
                    },
                  ),
                )
              : chartThree()
        ],
      ),
    );
  }

  Widget chartThree() {
    return SizedBox(
      height: 315,
      width: double.infinity,
      child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
          tooltipBehavior: _tooltip,
          series: <ChartSeries<_ChartData, String>>[
            ColumnSeries<_ChartData, String>(
                dataSource: chartdata,
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y,
                name: 'Gold',
                color: AppColors.drbackgroundColor.withOpacity(0.5)),
            LineSeries<_ChartData, String>(
                dataSource: chartdata,
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y1,
                name: 'Gold',
                color: AppColors.dashifycolor.withOpacity(0.4))
          ]),
    );
  }

  LineChartData mainChart(ThemeData themedata) {
    return LineChartData(
      lineTouchData: LineTouchData(
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            interval: 1,
            getTitlesWidget: (double value, TitleMeta meta) {
              return bottomTitle[value.toInt()] != null
                  ? SideTitleWidget(
                      axisSide: meta.axisSide,
                      space: 10,
                      child: Text(
                        bottomTitle[value.toInt()].toString(),
                        // style: TextStyle(
                        //     fontSize: Responsive.isMobile(context)
                        //         ? 9
                        //         : 12,
                        //     color: Colors.grey[400])
                      ),
                    )
                  : const SizedBox();
            },
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            getTitlesWidget: (double value, TitleMeta meta) {
              return leftTitle[value.toInt()] != null
                  ? Text(
                      leftTitle[value.toInt()].toString(),
                      // style: TextStyle(
                      //     fontSize:
                      //         Responsive.isMobile(context) ? 9 : 12,
                      //     color: Colors.grey[400])
                    )
                  : const SizedBox();
            },
            showTitles: true,
            interval: 1,
            reservedSize: 40,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
            isCurved: true,
            curveSmoothness: 0,
            color: AppColors.dashifycolor.withOpacity(0.4),
            barWidth: 2.5,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.dashifycolor.withOpacity(0.4),
                  Colors.transparent
                ],
              ),
              show: true,
              color: Theme.of(context).primaryColor.withOpacity(0.4),
            ),
            dotData: FlDotData(show: false),
            spots: spots)
      ],
      minX: 0,
      maxX: 120,
      maxY: 105,
      minY: -5,
    );
  }

  LineChartData avgChart() {
    return LineChartData(
        lineTouchData: LineTouchData(
          handleBuiltInTouches: true,
        ),
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 32,
              interval: 1,
              getTitlesWidget: (double value, TitleMeta meta) {
                return bottomTitle[value.toInt()] != null
                    ? SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 10,
                        child: Text(bottomTitle[value.toInt()].toString()),
                      )
                    : const SizedBox();
              },
            ),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
                getTitlesWidget: (double value, TitleMeta meta) {
                  return leftTitle[value.toInt()] != null
                      ? Text(leftTitle[value.toInt()].toString())
                      : const SizedBox();
                },
                showTitles: true,
                interval: 1,
                reservedSize: 40),
          ),
        ),
        borderData: FlBorderData(show: false),
        backgroundColor: Colors.transparent,
        minX: 0,
        maxX: 120,
        minY: 0,
        maxY: 70);
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.y1);

  final String x;
  final double y;
  final double y1;
}
