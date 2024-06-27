import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartLinerBarChartsTabsWidget extends StatefulWidget {
  const ChartLinerBarChartsTabsWidget({Key? key, required this.mediaQueryData})
      : super(key: key);
  final MediaQueryData mediaQueryData;

  @override
  ChartLinerBarChartsTabsWidgetState createState() =>
      ChartLinerBarChartsTabsWidgetState();
}

class ChartLinerBarChartsTabsWidgetState
    extends State<ChartLinerBarChartsTabsWidget> {
  late List<_ChartData> chartdata;
  late TooltipBehavior _tooltip;
  late TooltipBehavior _tooltip2;
  final List<SalesData> data = [
    SalesData('Jan', 35),
    SalesData('Feb', 28),
    SalesData('Mar', 34),
    SalesData('Apr', 32),
    SalesData('May', 40)
  ];

  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];

  List<ChartStackedData>? chartData;

  TrackballBehavior? _trackballBehavior;

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
    _tooltip2 = TooltipBehavior(enable: true);
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    chartData = <ChartStackedData>[
      ChartStackedData(
          x: 'Food',
          y: 55,
          yValue: 40,
          secondSeriesYValue: 45,
          thirdSeriesYValue: 48),
      ChartStackedData(
          x: 'Transport',
          y: 33,
          yValue: 45,
          secondSeriesYValue: 54,
          thirdSeriesYValue: 28),
      ChartStackedData(
          x: 'Medical',
          y: 43,
          yValue: 23,
          secondSeriesYValue: 20,
          thirdSeriesYValue: 34),
      ChartStackedData(
          x: 'Clothes',
          y: 32,
          yValue: 54,
          secondSeriesYValue: 23,
          thirdSeriesYValue: 54),
      ChartStackedData(
          x: 'Books',
          y: 56,
          yValue: 18,
          secondSeriesYValue: 43,
          thirdSeriesYValue: 55),
      ChartStackedData(
          x: 'Others',
          y: 23,
          yValue: 54,
          secondSeriesYValue: 33,
          thirdSeriesYValue: 56),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return EntranceFader(
      child: Column(
        children: [
          Visibility(
            visible: widget.mediaQueryData.size.width > kScreenWidthMd,
            child: Column(
              children: [
                Row(children: [
                  Flexible(child: chartcard(themeData)),
                  buildSizedboxW(kDefaultPadding),
                  Flexible(
                    child: Container(
                      height: 330,
                      width: double.infinity,
                      padding: const EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                          color: themeData.cardColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.blackColor.withOpacity(0.1),
                                blurRadius: 6)
                          ]),
                      child: SfSparkLineChart.custom(
                          //Enable the trackball
                          trackball: const SparkChartTrackball(
                              activationMode: SparkChartActivationMode.tap),
                          //Enable marker
                          marker: const SparkChartMarker(
                              displayMode: SparkChartMarkerDisplayMode.all),
                          //Enable data label
                          labelDisplayMode: SparkChartLabelDisplayMode.all,
                          xValueMapper: (int index) => data[index].year,
                          yValueMapper: (int index) => data[index].sales,
                          dataCount: 5),
                    ),
                  )
                ]),
                buildSizedBoxH(kDefaultPadding),
                Row(
                  children: [
                    Flexible(child: chartToRun(themeData)),
                    buildSizedboxW(kDefaultPadding),
                    Flexible(child: chartThree(themeData)),
                  ],
                ),
                buildSizedBoxH(kDefaultPadding),
                Row(
                  children: [
                    Flexible(child: _buildStackedLineChart(themeData)),
                    buildSizedboxW(kDefaultPadding),
                    Flexible(child: _buildHilo(themeData)),
                  ],
                )
              ],
            ),
          ),
          Visibility(
            visible: widget.mediaQueryData.size.width <= kScreenWidthMd,
            child: Column(
              children: [
                chartcard(themeData),
                buildSizedBoxH(kDefaultPadding),
                Container(
                  height: 330,
                  width: double.infinity,
                  padding: const EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.blackColor.withOpacity(0.1),
                            blurRadius: 6)
                      ]),
                  child: SfSparkLineChart.custom(
                    //Enable the trackball
                    trackball: const SparkChartTrackball(
                        activationMode: SparkChartActivationMode.tap),
                    //Enable marker
                    marker: const SparkChartMarker(
                        displayMode: SparkChartMarkerDisplayMode.all),
                    //Enable data label
                    labelDisplayMode: SparkChartLabelDisplayMode.all,
                    xValueMapper: (int index) => data[index].year,
                    yValueMapper: (int index) => data[index].sales,
                    dataCount: 5,
                  ),
                ),
                buildSizedBoxH(kDefaultPadding),
                chartToRun(themeData),
                buildSizedBoxH(kDefaultPadding),
                chartThree(themeData),
                buildSizedBoxH(kDefaultPadding),
                _buildStackedLineChart(themeData),
                buildSizedBoxH(kDefaultPadding),
                _buildHilo(themeData)
              ],
            ),
          )
        ],
      ),
    );
  }

  ///Get the cartesian chart with hilo series
  Widget _buildHilo(ThemeData themeData) {
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
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        title: ChartTitle(text: 'AAPL - 2016'),
        primaryXAxis: DateTimeAxis(
            dateFormat: DateFormat.MMMd(),
            minimum: DateTime(2016),
            maximum: DateTime(2016, 07),
            intervalType: DateTimeIntervalType.months,
            majorGridLines: const MajorGridLines(width: 0)),
        primaryYAxis: NumericAxis(
            interval: 20,
            minimum: 140,
            maximum: 60,
            labelFormat: r'${value}',
            axisLine: const AxisLine(width: 0)),
        series: _getHiloSeries(),
        tooltipBehavior: _tooltip2,
      ),
    );
  }

  ///Get the cartesian hilo series
  List<HiloSeries<ChartSampleData, DateTime>> _getHiloSeries() {
    return <HiloSeries<ChartSampleData, DateTime>>[
      HiloSeries<ChartSampleData, DateTime>(
          dataSource: <ChartSampleData>[
            ChartSampleData(
                x: DateTime(2016, 01, 11),
                secondSeriesYValue: 98.97,
                high: 101.19,
                low: 95.36,
                thirdSeriesYValue: 97.13),
            ChartSampleData(
                x: DateTime(2016, 01, 18),
                secondSeriesYValue: 98.41,
                high: 101.46,
                low: 93.42,
                thirdSeriesYValue: 101.42),
            ChartSampleData(
                x: DateTime(2016, 01, 25),
                secondSeriesYValue: 101.52,
                high: 101.53,
                low: 92.39,
                thirdSeriesYValue: 97.34),
            ChartSampleData(
                x: DateTime(2016, 02),
                secondSeriesYValue: 96.47,
                high: 97.33,
                low: 93.69,
                thirdSeriesYValue: 94.02),
            ChartSampleData(
                x: DateTime(2016, 02, 08),
                secondSeriesYValue: 93.13,
                high: 96.35,
                low: 92.59,
                thirdSeriesYValue: 93.99),
            ChartSampleData(
                x: DateTime(2016, 02, 15),
                secondSeriesYValue: 95.02,
                high: 98.89,
                low: 94.61,
                thirdSeriesYValue: 96.04),
            ChartSampleData(
                x: DateTime(2016, 02, 22),
                secondSeriesYValue: 92.31,
                high: 94.0237,
                low: 94.0237,
                thirdSeriesYValue: 92.91),
            ChartSampleData(
                x: DateTime(2016, 02, 29),
                secondSeriesYValue: 96.86,
                high: 103.75,
                low: 96.65,
                thirdSeriesYValue: 103.01),
            ChartSampleData(
                x: DateTime(2016, 03, 07),
                secondSeriesYValue: 102.39,
                high: 102.83,
                low: 100.15,
                thirdSeriesYValue: 102.26),
            ChartSampleData(
                x: DateTime(2016, 03, 14),
                secondSeriesYValue: 101.91,
                high: 106.5,
                low: 101.78,
                thirdSeriesYValue: 105.92),
            ChartSampleData(
                x: DateTime(2016, 03, 21),
                secondSeriesYValue: 105.93,
                high: 107.65,
                low: 104.89,
                thirdSeriesYValue: 105.67),
            ChartSampleData(
                x: DateTime(2016, 03, 28),
                secondSeriesYValue: 106,
                high: 110.42,
                low: 104.88,
                thirdSeriesYValue: 109.99),
            ChartSampleData(
                x: DateTime(2016, 04, 04),
                secondSeriesYValue: 110.42,
                high: 112.19,
                low: 108.121,
                thirdSeriesYValue: 108.66),
            ChartSampleData(
                x: DateTime(2016, 04, 11),
                secondSeriesYValue: 108.97,
                high: 112.39,
                low: 108.66,
                thirdSeriesYValue: 109.85),
            ChartSampleData(
                x: DateTime(2016, 04, 18),
                secondSeriesYValue: 108.89,
                high: 108.95,
                low: 104.62,
                thirdSeriesYValue: 105.68),
            ChartSampleData(
                x: DateTime(2016, 04, 25),
                secondSeriesYValue: 105,
                high: 105.65,
                low: 92.51,
                thirdSeriesYValue: 93.74),
            ChartSampleData(
                x: DateTime(2016, 05, 02),
                secondSeriesYValue: 93.965,
                high: 95.9,
                low: 91.85,
                thirdSeriesYValue: 92.72),
            ChartSampleData(
                x: DateTime(2016, 05, 09),
                secondSeriesYValue: 93,
                high: 93.77,
                low: 89.47,
                thirdSeriesYValue: 90.52),
            ChartSampleData(
                x: DateTime(2016, 05, 16),
                secondSeriesYValue: 92.39,
                high: 95.43,
                low: 91.65,
                thirdSeriesYValue: 95.22),
            ChartSampleData(
                x: DateTime(2016, 05, 23),
                secondSeriesYValue: 95.87,
                high: 100.73,
                low: 95.67,
                thirdSeriesYValue: 100.35),
            ChartSampleData(
                x: DateTime(2016, 05, 30),
                secondSeriesYValue: 99.6,
                high: 100.4,
                low: 96.63,
                thirdSeriesYValue: 97.92),
            ChartSampleData(
                x: DateTime(2016, 06, 06),
                secondSeriesYValue: 97.99,
                high: 101.89,
                low: 101.89,
                thirdSeriesYValue: 98.83),
            ChartSampleData(
                x: DateTime(2016, 06, 13),
                secondSeriesYValue: 98.69,
                high: 99.12,
                low: 95.3,
                thirdSeriesYValue: 95.33),
            ChartSampleData(
                x: DateTime(2016, 06, 20),
                secondSeriesYValue: 96,
                high: 96.89,
                low: 92.65,
                thirdSeriesYValue: 93.4),
            ChartSampleData(
                x: DateTime(2016, 06, 27),
                secondSeriesYValue: 93,
                high: 96.465,
                low: 91.5,
                thirdSeriesYValue: 95.89),
          ],
          color: const Color.fromRGBO(192, 108, 132, 1),
          name: 'AAPL',
          showIndicationForSameValues: true,
          xValueMapper: (ChartSampleData sales, _) => sales.x,

          /// High and low value mapper used to render the hilo series.
          lowValueMapper: (ChartSampleData sales, _) => sales.low,
          highValueMapper: (ChartSampleData sales, _) => sales.high)
    ];
  }

  Widget _buildStackedLineChart(ThemeData themeData) {
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
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        title: ChartTitle(text: 'Monthly expense of a family'),
        // legend: Legend(isVisible: !isCardView),
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          labelRotation: -45,
        ),
        primaryYAxis: NumericAxis(
            maximum: 200,
            axisLine: const AxisLine(width: 0),
            labelFormat: r'${value}',
            majorTickLines: const MajorTickLines(size: 0)),
        series: _getStackedLineSeries(),
        trackballBehavior: _trackballBehavior,
      ),
    );
  }

  List<StackedLineSeries<ChartStackedData, String>> _getStackedLineSeries() {
    return <StackedLineSeries<ChartStackedData, String>>[
      StackedLineSeries<ChartStackedData, String>(
          dataSource: chartData!,
          xValueMapper: (ChartStackedData sales, _) => sales.x,
          yValueMapper: (ChartStackedData sales, _) => sales.y,
          name: 'Father',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLineSeries<ChartStackedData, String>(
          dataSource: chartData!,
          xValueMapper: (ChartStackedData sales, _) => sales.x,
          yValueMapper: (ChartStackedData sales, _) => sales.yValue,
          name: 'Mother',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLineSeries<ChartStackedData, String>(
          dataSource: chartData!,
          xValueMapper: (ChartStackedData sales, _) => sales.x,
          yValueMapper: (ChartStackedData sales, _) => sales.secondSeriesYValue,
          name: 'Son',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLineSeries<ChartStackedData, String>(
          dataSource: chartData!,
          xValueMapper: (ChartStackedData sales, _) => sales.x,
          yValueMapper: (ChartStackedData sales, _) => sales.thirdSeriesYValue,
          name: 'Daughter',
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }

  void legend(LegendTapArgs args) {
    if (kDebugMode) {
      print(args.pointIndex);
    }
  }

  Widget chartcard(ThemeData themeData) {
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
      child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          // Chart title
          title: ChartTitle(text: 'Half yearly sales analysis'),
          // Enable legend
          legend: const Legend(isVisible: true),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<SalesData, String>>[
            LineSeries<SalesData, String>(
                dataSource: data,
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales,
                name: 'Sales',
                // Enable data label
                dataLabelSettings: const DataLabelSettings(isVisible: true))
          ]),
    );
  }

  Widget chartThree(ThemeData themeData) {
    return Container(
      height: 470,
      width: double.infinity,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: themeData.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.blackColor.withOpacity(0.1), blurRadius: 6)
          ]),
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
                color: const Color.fromRGBO(8, 142, 255, 1).withOpacity(0.5)),
            LineSeries<_ChartData, String>(
                dataSource: chartdata,
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y1,
                name: 'Gold',
                color: AppColors.buttonInfoColor.withOpacity(0.6))
          ]),
    );
  }

  Widget chartToRun(ThemeData themeData) {
    LabelLayoutStrategy? xContainerLabelLayoutStrategy;
    ChartData chartData;
    ChartOptions chartOptions = const ChartOptions();
    xContainerLabelLayoutStrategy = DefaultIterativeLabelLayoutStrategy(
      options: chartOptions,
    );
    chartData = ChartData(dataRows: const [
      [10.0, 20.0, 5.0, 30.0, 5.0, 20.0],
      [30.0, 60.0, 16.0, 100.0, 12.0, 120.0],
      [25.0, 40.0, 20.0, 80.0, 12.0, 90.0],
      [12.0, 30.0, 18.0, 40.0, 10.0, 30.0],
    ], dataRowsColors: [
      AppColors.uiComponentsbuttonColor.withOpacity(0.5),
      AppColors.tabscreenbutton.withOpacity(0.6),
      AppColors.buttonWarningColor.withOpacity(0.5),
      AppColors.buttonAltColor.withOpacity(0.5),
    ], xUserLabels: const [
      'Wolf',
      'Deer',
      'Owl',
      'Mouse',
      'Hawk',
      'Vole'
    ], dataRowsLegends: const [
      'Spring',
      'Summer',
      'Fall',
      'Winter'
    ], chartOptions: chartOptions);
    // chartData.dataRowsDefaultColors(); // if not set, called in constructor
    var verticalBarChartContainer = VerticalBarChartTopContainer(
      chartData: chartData,
      xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
    );

    var verticalBarChart = VerticalBarChart(
      size: const Size.fromHeight(450),
      painter: VerticalBarChartPainter(
          verticalBarChartContainer: verticalBarChartContainer),
    );
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
        child: verticalBarChart);
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class _ChartData {
  _ChartData(this.x, this.y, this.y1);

  final String x;
  final double y;
  final double y1;
}

class ChartStackedData {
  ChartStackedData(
      {required this.x,
      required this.y,
      required this.yValue,
      required this.secondSeriesYValue,
      required this.thirdSeriesYValue});

  final String x;
  final double y;
  final double yValue;
  final double secondSeriesYValue;
  final double thirdSeriesYValue;
}

class ChartSampleData {
  ChartSampleData(
      {required this.x,
      required this.high,
      required this.low,
      required this.secondSeriesYValue,
      required this.thirdSeriesYValue});

  final DateTime x;
  final double high;
  final double low;
  final double secondSeriesYValue;
  final double thirdSeriesYValue;
}
