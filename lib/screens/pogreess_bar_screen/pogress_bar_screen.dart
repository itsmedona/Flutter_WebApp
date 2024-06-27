import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/screens/pogreess_bar_screen/widgets/linar_pogress_bar.dart';
import 'package:flutter_web_dashboard/screens/pogreess_bar_screen/widgets/pogress_bar_animated.dart';
import 'package:flutter_web_dashboard/screens/pogreess_bar_screen/widgets/pogress_bar_card_screen.dart';
import 'package:flutter_web_dashboard/screens/pogreess_bar_screen/widgets/pogress_bar_with_tooltip.dart';
import 'package:flutter_web_dashboard/screens/pogreess_bar_screen/widgets/pogressbar_with_lable.dart';
import 'package:flutter_web_dashboard/screens/pogreess_bar_screen/widgets/striped_pogress_bar.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PogressbarScreen extends StatefulWidget {
  const PogressbarScreen({Key? key}) : super(key: key);

  @override
  State<PogressbarScreen> createState() => _PogressbarScreenState();
}

class _PogressbarScreenState extends State<PogressbarScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);
    final textTheme = Theme.of(context).textTheme;
    final themeData = Theme.of(context);
    final mediaQueryData = MediaQuery.of(context);

    var summaryCardCrossAxisCount =
        mediaQueryData.size.width <= kScreenWidthXxl ? 1 : 2;

    return PortalMasterLayout(
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          UIComponenetsAppBar(
            title: Lang.current.pogressbar,
            subtitle: Lang.current.pogressbarTitle,
            icon: Assets.images.png.layers
                .image(height: kDefaultPadding * 2, fit: BoxFit.cover),
          ),
          // buildSizedBoxH(kDefaultPadding),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final summaryCardWidth = ((constraints.maxWidth -
                        (kDefaultPadding * (summaryCardCrossAxisCount - 1))) /
                    summaryCardCrossAxisCount);
                return Column(
                  children: [
                    DefaultTabController(
                      length: 2,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          SizedBox(
                            height: 55,
                            child: TabBar(
                              onTap: (value) {
                                selectedIndex = value;
                                setState(() {});
                              },
                              automaticIndicatorColorAdjustment: false,
                              dragStartBehavior: DragStartBehavior.down,
                              isScrollable: true,
                              tabs: [
                                Tab(
                                    icon: Text(
                                  'Basic',
                                  style: textTheme.bodyMedium,
                                )),
                                Tab(
                                    icon: Text(
                                  'Advanced',
                                  style: textTheme.bodyMedium,
                                )),
                              ],
                            ),
                          ),
                          const Divider(height: 0),
                        ],
                      ),
                    ),
                    buildSizedBoxH(kDefaultPadding + kTextPadding),
                    selectedIndex == 0
                        ? _buildbasicTabCards(lang, themeData, summaryCardWidth)
                        : _buildadvancTabCards(
                            lang, themeData, summaryCardWidth),
                  ],
                );
              },
            ),
          ),
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
          PogressBarCard(
            title: 'BASIC POGRESS BAR',
            width: summaryCardWidth,
            body: _buildbody(),
          ),
          PogressBarCard(
            title: '% POGRESS BAR',
            width: summaryCardWidth,
            body: _buildAnimatedbody(),
          ),
          PogressBarCard(
            title: 'POGRESS BAR WITH DATA',
            width: summaryCardWidth,
            body: _buildsquarepogress(),
          ),
          PogressBarCard(
            title: 'TOOLTIP WITH POGRESS BAR',
            width: summaryCardWidth,
            body: _buildLinarbody(),
          ),
          PogressBarCard(
            title: 'ANIMATED POGRESS BAR',
            width: summaryCardWidth,
            body: _buildstripedbody(),
          ),
          PogressBarCard(
            title: 'LINER POGRESS BAR',
            width: summaryCardWidth,
            body: _buildlinerpogressbar(),
          ),
        ],
      ),
    );
  }

  Widget _buildadvancTabCards(
      Lang lang, ThemeData themeData, double summaryCardWidth) {
    return EntranceFader(
      child: Wrap(
        direction: Axis.horizontal,
        spacing: kDefaultPadding,
        runSpacing: kDefaultPadding,
        children: [
          PogressBarCard(
            title: 'LINER GAUGE',
            width: summaryCardWidth,
            body: _getLinearGauge(),
          ),
          PogressBarCard(
            title: 'CIRCULAR POGRESS BAR',
            width: summaryCardWidth,
            body: _buildcircular(),
          ),
          PogressBarCard(
            title: 'PERCENTAGE POGRESS BAR',
            width: summaryCardWidth,
            body: _buildPogressBar(),
          ),
          PogressBarCard(
            title: 'STEP POGRESS BAR',
            width: summaryCardWidth,
            body: _buildpogressesBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildbody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _linearProgressIndicator(context, 0.4, AppColors.primaryColor, true),
        _linearProgressIndicator(context, 0.5, AppColors.errorcolor, true),
        _linearProgressIndicator(context, 0.8, AppColors.starcolor, true),
        _linearProgressIndicator(context, 0.6, AppColors.tabscreenbutton, true),
        _linearProgressIndicator(context, 0.4, AppColors.buttonunselect, true),
        _linearProgressIndicator(
            context, 0.7, AppColors.tabbarlableColor, false),
      ],
    );
  }

  Widget _buildLinarbody() {
    return const Column(
      children: [
        PogressbarWithToolTip(backgroundColor: AppColors.primaryColor),
        PogressbarWithToolTip(backgroundColor: AppColors.errorcolor),
        PogressbarWithToolTip(backgroundColor: AppColors.starcolor),
        PogressbarWithToolTip(backgroundColor: AppColors.tabscreenbutton),
        PogressbarWithToolTip(backgroundColor: AppColors.buttonunselect),
        PogressbarWithToolTip(backgroundColor: AppColors.secondaryColor),
      ],
    );
  }

  Widget _buildAnimatedbody() {
    return const Column(
      children: [AnimatedAppBar()],
    );
  }

  Widget _buildstripedbody() {
    return Column(
      children: [
        const AnimatedStripeProgressBar(
          value: 0.2,
          backgroundColor: AppColors.whiteColor,
          progressColor: AppColors.primaryColor,
          stripesCount: 16,
          stripesWidth: kDefaultPadding - 4,
        ),
        buildSizedBoxH(kDefaultPadding),
        const AnimatedStripeProgressBar(
          value: 0.5,
          backgroundColor: AppColors.whiteColor,
          progressColor: AppColors.errorcolor,
          stripesCount: 16,
          stripesWidth: kDefaultPadding - 4,
        ),
        buildSizedBoxH(kDefaultPadding),
        const AnimatedStripeProgressBar(
          value: 0.6,
          backgroundColor: AppColors.whiteColor,
          progressColor: AppColors.starcolor,
          stripesCount: 16,
          stripesWidth: kDefaultPadding - 4,
        ),
        buildSizedBoxH(kDefaultPadding),
        const AnimatedStripeProgressBar(
          value: 0.7,
          backgroundColor: AppColors.whiteColor,
          progressColor: AppColors.tabscreenbutton,
          stripesCount: 16,
          stripesWidth: kDefaultPadding - 4,
        ),
        buildSizedBoxH(kDefaultPadding),
        const AnimatedStripeProgressBar(
          value: 0.8,
          backgroundColor: AppColors.whiteColor,
          progressColor: AppColors.buttonInfoColor,
          stripesCount: 16,
          stripesWidth: kDefaultPadding - 4,
        ),
        buildSizedBoxH(kDefaultPadding),
        const AnimatedStripeProgressBar(
          value: 0.6,
          backgroundColor: AppColors.whiteColor,
          progressColor: AppColors.tabcolor,
          stripesCount: 16,
          stripesWidth: kDefaultPadding - 4,
        ),
      ],
    );
  }

  Widget _buildlinerpogressbar() {
    return Column(
      children: [
        const LinearProgressIndicatorClass(
            backgroundcolor: AppColors.primaryColor),
        buildSizedBoxH(kDefaultPadding),
        const LinearProgressIndicatorClass(
            backgroundcolor: AppColors.errorcolor),
        buildSizedBoxH(kDefaultPadding),
        const LinearProgressIndicatorClass(
            backgroundcolor: AppColors.starcolor),
        buildSizedBoxH(kDefaultPadding),
        const LinearProgressIndicatorClass(
            backgroundcolor: AppColors.tabscreenbutton),
        buildSizedBoxH(kDefaultPadding),
        const LinearProgressIndicatorClass(
            backgroundcolor: AppColors.buttonInfoColor),
        buildSizedBoxH(kDefaultPadding),
        const LinearProgressIndicatorClass(
            backgroundcolor: AppColors.secondaryColor),
        buildSizedBoxH(kDefaultPadding),
      ],
    );
  }

  late int displaySegmentCount = segments.length ~/ 2;
  late double sliderValue = segments.length / 2;
  bool alwaysFillBar = false;
  bool limitLegendLines = false;
  late final maxTotalValue = segments.fold(0, (acc, seg) => acc + seg.value);

  Widget _buildsquarepogress() {
    return const Column(
      children: [
        pogressbarWithType(segmentList: segments),
        pogressbarWithType(segmentList: segment2)
      ],
    );
  }

  Widget _linearProgressIndicator(BuildContext context, double? value,
      Color color, bool withBottomPadding) {
    final themeData = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
          bottom: (withBottomPadding ? kDefaultPadding * 1.5 : 0.0)),
      child: Theme(
        data: themeData.copyWith(
          colorScheme: themeData.colorScheme.copyWith(primary: color),
        ),
        child: LinearProgressIndicator(
          value: value,
          backgroundColor: themeData.scaffoldBackgroundColor,
        ),
      ),
    );
  }

  Widget _getLinearGauge() {
    return Column(
      children: [
        SfLinearGauge(
            minimum: 0.0,
            maximum: 100.0,
            orientation: LinearGaugeOrientation.horizontal,
            majorTickStyle: const LinearTickStyle(length: 20),
            axisLabelStyle:
                const TextStyle(fontSize: 12.0, color: Colors.black),
            axisTrackStyle: const LinearAxisTrackStyle(
                color: Colors.cyan,
                edgeStyle: LinearEdgeStyle.bothFlat,
                thickness: 15.0,
                borderColor: Colors.grey)),
        buildSizedBoxH(kDefaultPadding),
        SfLinearGauge(
            minimum: 0.0,
            maximum: 50.0,
            orientation: LinearGaugeOrientation.horizontal,
            majorTickStyle: const LinearTickStyle(length: 20),
            axisLabelStyle:
                const TextStyle(fontSize: 12.0, color: Colors.black),
            axisTrackStyle: const LinearAxisTrackStyle(
                color: Colors.indigoAccent,
                edgeStyle: LinearEdgeStyle.bothFlat,
                thickness: 15.0,
                borderColor: Colors.grey)),
      ],
    );
  }

  Widget _buildcircular() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircularPercentIndicator(
          radius: 50.0,
          lineWidth: 10.0,
          percent: 0.8,
          header: const Text("Icon header"),
          center: const Icon(
            Icons.person_pin,
            size: 50.0,
            color: Colors.blue,
          ),
          backgroundColor: Colors.grey,
          progressColor: Colors.blue,
        ),
        buildSizedboxW(kDefaultPadding * 2),
        CircularPercentIndicator(
          radius: 50.0,
          animation: true,
          animationDuration: 1200,
          header: const Text("Animation header"),
          lineWidth: 10.0,
          percent: 0.4,
          center: const Text(
            "40 hours",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
          ),
          circularStrokeCap: CircularStrokeCap.butt,
          backgroundColor: AppColors.buttonInfoColor,
          progressColor: AppColors.buttonSuccessColor,
        ),
      ],
    );
  }

  _buildPogressBar() {
    return Column(
      children: [
        _buildAnimatedpogressbar(AppColors.buttonAltColor, 0.9, '90%'),
        _buildAnimatedpogressbar(AppColors.buttonInfoColor, 0.5, '50%'),
        _buildAnimatedpogressbar(AppColors.starcolor, 0.2, '20%'),
      ],
    );
  }

  _buildpogressesBar() {
    return Column(
      children: [
        const StepProgressIndicator(
          totalSteps: 10,
        ),
        buildSizedBoxH(kDefaultPadding),
        const StepProgressIndicator(
          totalSteps: 10,
          currentStep: 6,
          selectedColor: Colors.red,
          unselectedColor: Colors.yellow,
        ),
        buildSizedBoxH(kDefaultPadding),
        const StepProgressIndicator(
          totalSteps: 20,
          currentStep: 6,
          size: 10,
          selectedColor: Colors.purple,
          unselectedColor: Colors.grey,
        ),
        buildSizedBoxH(kDefaultPadding),
        const StepProgressIndicator(
          totalSteps: 15,
          currentStep: 12,
          size: 20,
          selectedColor: Colors.amber,
          unselectedColor: Colors.black,
          roundedEdges: Radius.circular(10),
          gradientColor: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.orange, Colors.white],
          ),
        ),
        buildSizedBoxH(kDefaultPadding),
        StepProgressIndicator(
          totalSteps: 6,
          currentStep: 4,
          size: 36,
          selectedColor: Colors.black,
          unselectedColor: Colors.grey,
          customStep: (index, color, _) => color == Colors.black
              ? Container(
                  color: color,
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                )
              : Container(
                  color: color,
                  child: const Icon(
                    Icons.remove,
                  ),
                ),
        )
      ],
    );
  }

  _buildAnimatedpogressbar(Color bgColors, double value, String percentage) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: LinearPercentIndicator(
        animation: true,
        lineHeight: 20.0,
        animationDuration: 2000,
        percent: value,
        center: Text(
          percentage,
          style: const TextStyle(color: AppColors.whiteColor),
        ),
        linearStrokeCap: LinearStrokeCap.roundAll,
        progressColor: bgColors,
      ),
    );
  }
}
