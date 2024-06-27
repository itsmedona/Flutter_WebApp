import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/widgets/custom_card.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DemographicsPage extends StatelessWidget {
  const DemographicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomCard(
      child: Padding(
        padding: EdgeInsets.only(top: 31, bottom: 40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _CircleChart(femalePercent: 43.9, malePercent: 56.1),
            VerticalDivider(color: Colors.grey),
            _BarChart(),
          ],
        ),
      ),
    );
  }
}

class _CircleChart extends StatelessWidget {
  const _CircleChart({
    required this.malePercent,
    required this.femalePercent,
    Key? key,
  }) : super(key: key);

  final double malePercent;
  final double femalePercent;

  List<PieChartSectionData> generateSections(
    double malePercent,
    double femalePercent,
  ) {
    return [
      PieChartSectionData(
        color: AppColors.primaryColor,
        value: malePercent,
        radius: 20,
        title: '',
      ),
      PieChartSectionData(
        color: AppColors.buttonWarningColor,
        value: femalePercent,
        radius: 20,
        title: '',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 31, right: 47),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 160,
            height: 160,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                PieChart(
                  PieChartData(
                    startDegreeOffset: 270,
                    sectionsSpace: 0,
                    centerSpaceRadius: 60,
                    sections: generateSections(
                      malePercent,
                      femalePercent,
                    ),
                  ),
                ),
                const Text(
                  'Gender',
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _CircleChartBottomInfo(
                text: 'Male',
                color: AppColors.uiComponentsbuttonColor,
                totalPercent: malePercent,
                growthPercent: 3.9,
              ),
              const SizedBox(width: 50),
              _CircleChartBottomInfo(
                text: 'Female',
                color: AppColors.buttonWarningColor,
                totalPercent: femalePercent,
                growthPercent: 38.9,
                haveIncreased: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CircleChartBottomInfo extends StatelessWidget {
  const _CircleChartBottomInfo({
    required this.text,
    required this.color,
    required this.growthPercent,
    required this.totalPercent,
    this.haveIncreased = true,
    Key? key,
  }) : super(key: key);

  final String text;

  final Color color;

  final double totalPercent;
  final double growthPercent;

  final bool haveIncreased;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(backgroundColor: color, radius: 5),
            const SizedBox(width: 8),
            Text(
              text,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            const SizedBox(width: 20),
            Text(
              '$totalPercent%',
            ),
            Icon(
              haveIncreased ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              size: 20,
              color: haveIncreased
                  ? AppColors.tabscreenbutton
                  : AppColors.errorcolor,
            ),
            Text(
              '$growthPercent%',
            ),
          ],
        ),
      ],
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart({Key? key}) : super(key: key);

  BarSeries<UsersAgeData, String> _createBarSeries(
    List<UsersAgeData> dataSource,
  ) {
    return BarSeries<UsersAgeData, String>(
      spacing: 0.25,
      width: 0.9,
      trackBorderWidth: 0,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(4),
        bottomRight: Radius.circular(4),
      ),
      enableTooltip: false,
      dataSource: dataSource,
      xValueMapper: (UsersAgeData data, _) => data.age,
      yValueMapper: (UsersAgeData data, _) => data.percent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 63),
      child: SfCartesianChart(
        margin: EdgeInsets.zero,
        plotAreaBorderWidth: 0,
        title: ChartTitle(
          text: 'Age',
          alignment: ChartAlignment.near,
        ),
        primaryXAxis: CategoryAxis(
          axisLabelFormatter: (AxisLabelRenderDetails details) {
            return ChartAxisLabel(
                details.text, const TextStyle(color: AppColors.buttonunselect)
                // TextStyles.myriadProRegular13DarkBlue.copyWith(
                //   color: Palette.darkBlue.withOpacity(0.6),
                //   fontSize: 12.8,
                // ),
                );
          },
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0),
          majorGridLines: const MajorGridLines(width: 0),
          isVisible: true,
        ),
        primaryYAxis: NumericAxis(
          axisLabelFormatter: (AxisLabelRenderDetails details) {
            return ChartAxisLabel('${details.text}%',
                const TextStyle(color: AppColors.blackColor));
          },
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0, width: 0),
          majorGridLines: const MajorGridLines(
            width: 0.5,
            color: AppColors.buttontextColor,
          ),
          minorTickLines: const MinorTickLines(size: 0, width: 0),
          minorGridLines: const MinorGridLines(width: 0),
          maximum: 15,
        ),
        palette: const <Color>[
          AppColors.buttonWarningColor,
          AppColors.uiComponentsbuttonColor
        ],
        series: <ChartSeries>[
          _createBarSeries(femaleData),
          _createBarSeries(maleData),
        ],
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }
}

class UsersAgeData {
  const UsersAgeData(this.age, this.percent);

  final String age;
  final double percent;
}

const List<UsersAgeData> femaleData = <UsersAgeData>[
  UsersAgeData('65+', 5.5),
  UsersAgeData('45 - 56', 5.5),
  UsersAgeData('35 - 44', 7.5),
  UsersAgeData('25 - 34', 9),
  UsersAgeData('18 - 24', 9),
];

const List<UsersAgeData> maleData = <UsersAgeData>[
  UsersAgeData('65+', 4.5),
  UsersAgeData('45 - 56', 4.9),
  UsersAgeData('35 - 44', 9),
  UsersAgeData('25 - 34', 14),
  UsersAgeData('18 - 24', 8),
];

const Map<int, List<double>> activeUsersData = <int, List<double>>{
  1: [200, 310],
  2: [305, 450],
  3: [270, 390],
  4: [210, 310],
  5: [100, 160],
  6: [300, 450],
  7: [210, 310],
  8: [150, 210],
  9: [210, 310],
  10: [210, 308],
};
