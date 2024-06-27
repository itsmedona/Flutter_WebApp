import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

class ChartCircularChartsTabsWidget extends StatefulWidget {
  const ChartCircularChartsTabsWidget({Key? key, required this.mediaQueryData})
      : super(key: key);
  final MediaQueryData mediaQueryData;

  @override
  ChartCircularChartsTabsWidgetState createState() =>
      ChartCircularChartsTabsWidgetState();
}

class ChartCircularChartsTabsWidgetState
    extends State<ChartCircularChartsTabsWidget> {
  final List<ChartData> chartData = [
    ChartData('Jan', 35),
    ChartData('Feb', 28),
    ChartData('Mar', 34),
    ChartData('Apr', 32),
    ChartData('May', 40)
  ];
  double numberOfFeatures = 3;
  bool useSides = false;
  final dataMap = <String, double>{
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };
  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];
  late int startAngle;
  late int endAngle;
  // late TooltipBehavior _tooltip;

  @override
  void initState() {
    startAngle = 270;
    endAngle = 90;
    // _tooltip = TooltipBehavior(enable: true, format: 'point.x : point.y%');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return EntranceFader(
      child: Column(children: [
        Visibility(
          visible: widget.mediaQueryData.size.width > kScreenWidthMd,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: chartcard(themeData)),
                  buildSizedboxW(kDefaultPadding),
                  Flexible(child: chartcard(themeData, true, true)),
                ],
              ),
              buildSizedBoxH(kDefaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: chartcard(themeData, true)),
                  buildSizedboxW(kDefaultPadding),
                  Flexible(child: chartcard(themeData, false, false, true)),
                ],
              ),
            ],
          ),
        ),
        Visibility(
          visible: widget.mediaQueryData.size.width <= kScreenWidthMd,
          child: Column(
            children: [
              chartcard(themeData),
              buildSizedBoxH(kDefaultPadding),
              chartcard(themeData, true, true),
              buildSizedBoxH(kDefaultPadding),
              chartcard(themeData, true),
              buildSizedBoxH(kDefaultPadding),
              chartcard(themeData, false, false, true),
            ],
          ),
        )
      ]),
    );
  }

  void legend(LegendTapArgs args) {
    print(args.pointIndex);
  }

  Widget chartcard(ThemeData themeData,
      [bool isRender = false, isRingChart = false, bool isHalfChart = false]) {
    const ticks = [7, 14, 21, 28, 35];
    var features = ["AA", "BB", "CC", "DD", "EE", "FF", "GG", "HH"];
    var data = [
      [10.0, 20, 28, 5, 16, 15, 17, 6],
      [14.5, 1, 4, 14, 23, 10, 6, 19]
    ];

    features = features.sublist(0, numberOfFeatures.floor());
    data = data
        .map((graph) => graph.sublist(0, numberOfFeatures.floor()))
        .toList();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: themeData.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.blackColor.withOpacity(0.1), blurRadius: 6)
          ]),
      child: isRender
          ? Padding(
              padding: EdgeInsets.only(
                  left: isRingChart ? 0 : kDefaultPadding / 1.4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSizedBoxH(isRingChart ? 0 : kDefaultPadding),
                  Visibility(
                    visible: isRingChart ? false : true,
                    child: const Text(
                      'RANDER CHART',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                  buildSizedBoxH(isRingChart ? 0 : kDefaultPadding),
                  !isRingChart
                      ? SizedBox(
                          height: 245,
                          child: RadarChart.light(
                              ticks: ticks,
                              features: features,
                              data: data,
                              useSides: useSides),
                        )
                      : _buildRoundedDoughnutChart()
                ],
              ),
            )
          : isHalfChart
              ? _buildSemiDoughnutChart()
              : SfCircularChart(
                  onLegendTapped: (LegendTapArgs args) => legend(args),
                  legend: const Legend(
                      isVisible: true, alignment: ChartAlignment.center),
                  title: ChartTitle(
                      text: 'PIE CHART',
                      alignment: ChartAlignment.near,
                      textStyle: const TextStyle(fontWeight: FontWeight.w600)),
                  series: <CircularSeries>[
                    PieSeries<Data, String>(
                      dataSource: <Data>[
                        Data('Cat. A', 30),
                        Data('Cat. B', 20),
                        Data('Cat. C', 50),
                      ],
                      xValueMapper: (Data data, _) => data.category,
                      yValueMapper: (Data data, _) => data.value,
                      // enablePointAnimation: true,
                      // Duration of the animation in milliseconds
                      animationDuration: 1000,
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true, // Show data labels
                      ),
                      // Additional customization options can be added here
                    ),
                  ],
                ),
    );
  }

  /// Returns the circular charts with rounded corner doughnut series.
  SfCircularChart _buildRoundedDoughnutChart() {
    return SfCircularChart(
      legend: const Legend(
          isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      title: ChartTitle(
          text: 'DOUGHNUT ROUNDED CORNER',
          alignment: ChartAlignment.near,
          textStyle: const TextStyle(fontWeight: FontWeight.w600)),
      series: _getRoundedDoughnutSeries(),
    );
  }

  /// Returns rounded corner doughunut series.
  List<DoughnutSeries<DoughnutchartData, String>> _getRoundedDoughnutSeries() {
    return <DoughnutSeries<DoughnutchartData, String>>[
      DoughnutSeries<DoughnutchartData, String>(
        dataSource: <DoughnutchartData>[
          DoughnutchartData(x: 'Planning', y: 10),
          DoughnutchartData(x: 'Analysis', y: 10),
          DoughnutchartData(x: 'Design', y: 10),
          DoughnutchartData(x: 'Development', y: 10),
          DoughnutchartData(x: 'Testing & Int.', y: 10),
          DoughnutchartData(x: 'Maintainance', y: 10)
        ],
        animationDuration: 0,
        cornerStyle: CornerStyle.bothCurve,
        radius: '80%',
        innerRadius: '60%',
        xValueMapper: (DoughnutchartData data, _) => data.x,
        yValueMapper: (DoughnutchartData data, _) => data.y,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true, // Show data labels
        ),
      ),
    ];
  }

  /// Returns the circular series with semi doughunut series.
  SfCircularChart _buildSemiDoughnutChart() {
    return SfCircularChart(
      title: ChartTitle(
          text: 'Sales by sales person',
          alignment: ChartAlignment.near,
          textStyle: const TextStyle(fontWeight: FontWeight.w600)),
      legend: const Legend(isVisible: true),
      centerY: '60%',
      series: _getSemiDoughnutSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// Returns  semi doughnut series.
  List<DoughnutSeries<DoughnutchartHalfData, String>> _getSemiDoughnutSeries() {
    return <DoughnutSeries<DoughnutchartHalfData, String>>[
      DoughnutSeries<DoughnutchartHalfData, String>(
          dataSource: <DoughnutchartHalfData>[
            DoughnutchartHalfData(x: 'David', y: 45, text: 'David 45%'),
            DoughnutchartHalfData(x: 'Steve', y: 15, text: 'Steve 15%'),
            DoughnutchartHalfData(x: 'Jack', y: 21, text: 'Jack 21%'),
            DoughnutchartHalfData(x: 'Others', y: 19, text: 'Others 19%')
          ],
          innerRadius: '70%',
          radius: '59%',
          startAngle: startAngle,
          endAngle: endAngle,
          xValueMapper: (DoughnutchartHalfData data, _) => data.x,
          yValueMapper: (DoughnutchartHalfData data, _) => data.y,
          dataLabelMapper: (DoughnutchartHalfData data, _) => data.text,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, labelPosition: ChartDataLabelPosition.outside))
    ];
  }
}

class Data {
  Data(this.category, this.value);

  final String category;
  final double value;
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

class DoughnutchartData {
  DoughnutchartData({required this.x, required this.y});

  final String x;
  final double y;
}

class DoughnutchartHalfData {
  DoughnutchartHalfData({required this.x, required this.y, required this.text});

  final String x;
  final String text;
  final double y;
}
