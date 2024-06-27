import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/theme/app_theme.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';

class StandardButtonScreen extends StatefulWidget {
  const StandardButtonScreen({Key? key}) : super(key: key);

  @override
  State<StandardButtonScreen> createState() => _StandardButtonScreenState();
}

class _StandardButtonScreenState extends State<StandardButtonScreen> {
  List listProduct = [
    {
      'title': 'Primary',
      'color': AppColors.primaryColor,
    },
    {
      'title': 'Secondary',
      'color': AppColors.buttonSecondaryColor,
    },
    {
      'title': 'Success',
      'color': AppColors.buttonSuccessColor,
    },
    {
      'title': 'Info',
      'color': AppColors.buttonInfoColor,
    },
    {
      'title': 'Worning',
      'color': AppColors.buttonWarningColor,
    },
    {
      'title': 'Focus',
      'color': AppColors.buttonFocusColor,
    },
    {
      'title': 'Alt',
      'color': AppColors.buttonAltColor,
    },
  ];

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
            title: Lang.current.standardButton,
            subtitle: Lang.current.standardButtonSubtitle,
            icon: Assets.images.png.plane.image(
                height: kDefaultPadding * 2,
                fit: BoxFit.cover,
                color: AppColors.buttonWarningColor),
          ),
          buildSizedBoxH(kDefaultPadding),
          DefaultTabController(
            length: 1,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                SizedBox(
                  height: 55,
                  child: TabBar(
                    automaticIndicatorColorAdjustment: false,
                    dragStartBehavior: DragStartBehavior.down,
                    isScrollable: true,
                    tabs: [
                      Tab(
                          icon: Text(Lang.current.solid,
                              style: textTheme.bodyMedium)),
                    ],
                  ),
                ),
                const Divider(height: 0),
              ],
            ),
          ),
          buildSizedBoxH(kDefaultPadding + kTextPadding),
          Visibility(
            visible: mediaQueryData.size.width >= kScreenWidthLg,
            child: EntranceFader(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: simnpleBadge(themeData, 'SOLID', true)),
                      buildSizedboxW(kDefaultPadding),
                      Expanded(
                          child: simnpleBadge(
                              themeData, 'COLOR TRANSITION', false)),
                    ],
                  ),
                  buildSizedBoxH(kDefaultPadding),
                  Row(
                    children: [
                      Expanded(
                          child: simnpleBadge(themeData,
                              'COLOR TRANSITION NO BORDERS', false, true)),
                      buildSizedboxW(kDefaultPadding),
                      Expanded(
                          child: simnpleBadge(themeData, 'HOVER SHINE', true)),
                    ],
                  ),
                  buildSizedBoxH(kDefaultPadding),
                  Row(
                    children: [
                      Expanded(
                          child:
                              checkBoxButtons('CHECKBOX BUTTONS', themeData)),
                      buildSizedboxW(kDefaultPadding),
                      Expanded(
                          child: checkBoxButtons('RADIO BUTTONS', themeData)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: mediaQueryData.size.width <= kScreenWidthLg,
            child: EntranceFader(
              child: Column(
                children: [
                  simnpleBadge(themeData, 'SOLID', true),
                  buildSizedBoxH(kDefaultPadding),
                  simnpleBadge(themeData, 'COLOR TRANSITION', false),
                  buildSizedBoxH(kDefaultPadding),
                  simnpleBadge(
                      themeData, 'COLOR TRANSITION NO BORDERS', false, true),
                  buildSizedBoxH(kDefaultPadding),
                  simnpleBadge(themeData, 'HOVER SHINE', true),
                  buildSizedBoxH(kDefaultPadding),
                  checkBoxButtons('CHECKBOX BUTTONS', themeData),
                  buildSizedBoxH(kDefaultPadding),
                  checkBoxButtons('RADIO BUTTONS', themeData),
                ],
              ),
            ),
          ),
          buildSizedBoxH(kDefaultPadding),
        ],
      ),
    );
  }

  Widget simnpleBadge(ThemeData textTheme, String title, bool isSolid,
      [bool isNoBorder = false]) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: textTheme.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.blackColor.withOpacity(0.1), blurRadius: 6)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: textTheme.textColor),
          ),
          buildSizedBoxH(kDefaultPadding),
          gridviewServiceList(textTheme, isSolid, isNoBorder),
        ],
      ),
    );
  }

  Widget checkBoxButtons(String title, ThemeData themeData) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: themeData.textColor),
          ),
          buildSizedBoxH(kDefaultPadding),
          const Center(
              child: MultipleChoice(
                  textSize: 14, bgColor: AppColors.checkBoxButtonColor)),
          buildSizedBoxH(kDefaultPadding - kTextPadding),
          const Divider(),
          buildSizedBoxH(kDefaultPadding - kTextPadding),
          const Center(
              child: MultipleChoice(
                  textSize: 16, bgColor: AppColors.buttonWarningColor)),
          buildSizedBoxH(kDefaultPadding - kTextPadding),
          const Divider(),
          buildSizedBoxH(kDefaultPadding - kTextPadding),
          const Center(
              child: MultipleChoice(
                  textSize: 20, bgColor: AppColors.buttonAltColor)),
          buildSizedBoxH(kDefaultPadding - kTextPadding),
        ],
      ),
    );
  }

  Widget gridviewServiceList(ThemeData textTheme, bool isSolid,
      [bool isNoBorder = false]) {
    return Wrap(
      spacing: kDefaultPadding,
      runSpacing: kDefaultPadding,
      children: listProduct
          .map(
            (e) => ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: isSolid ? null : e['color'],
                  backgroundColor: isSolid ? e['color'] : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Set the border radius as desired
                    side: BorderSide(
                        color: !isNoBorder ? e['color'] : Colors.transparent,
                        width: 1.2), // Set the border color and width
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding * 1.1,
                      horizontal: kDefaultPadding - kTextPadding),
                  shadowColor: !isSolid ? Colors.transparent : null),
              child: Text(
                e['title'],
                style: TextStyle(
                    color: e['title'] == 'Secondary'
                        ? textTheme.textColor
                        : !isSolid
                            ? textTheme.textColor
                            : AppColors.whiteColor),
              ),
              onPressed: () {},
            ),
          )
          .toList(),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final double width;

  const SummaryCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 180.0,
      width: width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: themeData.cardColor,
        child: Stack(
          children: [
            Positioned(
              top: kDefaultPadding * 0.5,
              right: kDefaultPadding * 0.5,
              child: Icon(
                icon,
                size: 80.0,
                color: iconColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
                    child: Text(
                      value,
                      style: textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    title,
                    style: textTheme.labelLarge!.copyWith(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MultipleChoice extends StatefulWidget {
  const MultipleChoice(
      {super.key, required this.textSize, required this.bgColor});
  final double textSize;
  final Color bgColor;

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<Sizes> selection = <Sizes>{};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      emptySelectionAllowed: true,
      style: ButtonStyle(
          padding:
              MaterialStateProperty.all(const EdgeInsets.all(kDefaultPadding)),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(kTextPadding * 1.2)))),
          backgroundColor: MaterialStateProperty.all(widget.bgColor)),
      segments: <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(
            value: Sizes.one,
            label: Text(
              'One',
              style: TextStyle(
                  fontSize: widget.textSize, color: AppColors.whiteColor),
            )),
        ButtonSegment<Sizes>(
            value: Sizes.two,
            label: Text(
              'Two',
              style: TextStyle(
                  fontSize: widget.textSize, color: AppColors.whiteColor),
            )),
        ButtonSegment<Sizes>(
            value: Sizes.three,
            label: Text(
              'Three',
              style: TextStyle(
                  fontSize: widget.textSize, color: AppColors.whiteColor),
            )),
      ],
      selected: selection,
      onSelectionChanged: (Set<Sizes> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}

enum Sizes { one, two, three }
