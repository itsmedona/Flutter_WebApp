import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/screens/tooltip_screen/widgets/color_tooltip_widget.dart';
import 'package:flutter_web_dashboard/screens/tooltip_screen/widgets/tool_tip_widget.dart';
import 'package:flutter_web_dashboard/widgets/card_header.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';
import 'package:popover/popover.dart';

class ToolTipScreen extends StatefulWidget {
  const ToolTipScreen({Key? key}) : super(key: key);

  @override
  State<ToolTipScreen> createState() => _ToolTipScreenState();
}

class _ToolTipScreenState extends State<ToolTipScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return PortalMasterLayout(
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          UIComponenetsAppBar(
            title: Lang.current.tooltip,
            subtitle: Lang.current.tooltipSubtitle,
            icon: Assets.images.png.code
                .image(height: kDefaultPadding * 2, fit: BoxFit.cover),
          ),
          EntranceFader(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: kDefaultPadding + kTextPadding),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardBody(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTitle('DARK TOOLTIPS', textTheme),
                              buildSizedBoxH(kDefaultPadding),
                              Wrap(
                                direction: Axis.horizontal,
                                spacing: kDefaultPadding * 2.0,
                                runSpacing: kDefaultPadding * 2.0,
                                children: [
                                  Tooltip(
                                    verticalOffset: -13,
                                    margin: const EdgeInsets.only(left: 200),
                                    textStyle: textTheme.labelMedium!.copyWith(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w600),
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    message: 'ToolTip Content !',
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('auto'),
                                    ),
                                  ),
                                  Tooltip(
                                    textStyle: textTheme.labelMedium!.copyWith(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w600),
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    message: 'ToolTip Content !',
                                    child: ElevatedButton(
                                      onPressed: () => {},
                                      child: const Text('auto-start'),
                                    ),
                                  ),
                                  Tooltip(
                                    verticalOffset: -13,
                                    margin: const EdgeInsets.only(left: 200),
                                    textStyle: textTheme.labelMedium!.copyWith(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w600),
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    message: 'ToolTip Content !',
                                    child: ElevatedButton(
                                      onPressed: () => {},
                                      child: const Text('auto-end'),
                                    ),
                                  ),
                                  Tooltip(
                                    preferBelow: false,
                                    textStyle: textTheme.labelMedium!.copyWith(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w600),
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    message: 'ToolTip Content !',
                                    child: ElevatedButton(
                                      onPressed: () => {},
                                      child: const Text('Top'),
                                    ),
                                  ),
                                  Tooltip(
                                    preferBelow: false,
                                    textStyle: textTheme.labelMedium!.copyWith(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w600),
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    message: 'ToolTip Content !',
                                    child: ElevatedButton(
                                      onPressed: () => {},
                                      child: const Text('Top-start'),
                                    ),
                                  ),
                                  Tooltip(
                                    preferBelow: false,
                                    textStyle: textTheme.labelMedium!.copyWith(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w600),
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    message: 'ToolTip Content !',
                                    child: ElevatedButton(
                                      onPressed: () => {},
                                      child: const Text('Top-end'),
                                    ),
                                  ),
                                  Tooltip(
                                    verticalOffset: -13,
                                    margin: const EdgeInsets.only(left: 200),
                                    textStyle: textTheme.labelMedium!.copyWith(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w600),
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    message: 'ToolTip Content !',
                                    child: ElevatedButton(
                                      onPressed: () => {},
                                      child: const Text('right'),
                                    ),
                                  ),
                                  Tooltip(
                                    verticalOffset: -13,
                                    margin: const EdgeInsets.only(left: 200),
                                    textStyle: textTheme.labelMedium!.copyWith(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w600),
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    message: 'ToolTip Content !',
                                    child: ElevatedButton(
                                      onPressed: () => {},
                                      child: const Text('right-start'),
                                    ),
                                  ),
                                  Tooltip(
                                    verticalOffset: -13,
                                    margin: const EdgeInsets.only(left: 200),
                                    textStyle: textTheme.labelMedium!.copyWith(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w600),
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    message: 'ToolTip Content !',
                                    child: ElevatedButton(
                                      onPressed: () => {},
                                      child: const Text('right-end'),
                                    ),
                                  ),
                                  Tooltip(
                                    textStyle: textTheme.labelMedium!.copyWith(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w600),
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    message: 'ToolTip Content !',
                                    child: ElevatedButton(
                                      onPressed: () => {},
                                      child: const Text('bottom'),
                                    ),
                                  ),
                                  Tooltip(
                                    textStyle: textTheme.labelMedium!.copyWith(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w600),
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    message: 'ToolTip Content !',
                                    child: ElevatedButton(
                                      onPressed: () => {},
                                      child: const Text('bottom-end'),
                                    ),
                                  ),
                                  Tooltip(
                                    textStyle: textTheme.labelMedium!.copyWith(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w600),
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    message: 'ToolTip Content !',
                                    child: ElevatedButton(
                                      onPressed: () => {},
                                      child: const Text('bottom-start'),
                                    ),
                                  ),
                                  Tooltip(
                                    verticalOffset: -13,
                                    margin: const EdgeInsets.only(right: 200),
                                    textStyle: textTheme.labelMedium!.copyWith(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w600),
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    message: 'ToolTip Content !',
                                    child: ElevatedButton(
                                      onPressed: () => {},
                                      child: const Text('left'),
                                    ),
                                  ),
                                  Tooltip(
                                    verticalOffset: -13,
                                    margin: const EdgeInsets.only(right: 200),
                                    textStyle: textTheme.labelMedium!.copyWith(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w600),
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    message: 'ToolTip Content !',
                                    child: ElevatedButton(
                                      onPressed: () => {},
                                      child: const Text('left-start'),
                                    ),
                                  ),
                                  Tooltip(
                                    verticalOffset: -13,
                                    margin: const EdgeInsets.only(right: 200),
                                    textStyle: textTheme.labelMedium!.copyWith(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w600),
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    message: 'ToolTip Content !',
                                    child: ElevatedButton(
                                      onPressed: () => {},
                                      child: const Text('left-end'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardBody(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTitle('LIGHT TOOLTIPS', textTheme),
                              buildSizedBoxH(kDefaultPadding),
                              Wrap(
                                  direction: Axis.horizontal,
                                  spacing: kDefaultPadding * 2.0,
                                  runSpacing: kDefaultPadding * 2.0,
                                  children: [
                                    Tooltip(
                                      verticalOffset: -13,
                                      margin: const EdgeInsets.only(right: 200),
                                      preferBelow: false,
                                      textStyle: textTheme.labelMedium!
                                          .copyWith(
                                              color: AppColors.blackColor,
                                              fontWeight: FontWeight.w600),
                                      decoration: const BoxDecoration(
                                        color: AppColors.whiteColor,
                                      ),
                                      message: 'ToolTip Content !',
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text('auto'),
                                      ),
                                    ),
                                    Tooltip(
                                      preferBelow: false,
                                      textStyle: textTheme.labelMedium!
                                          .copyWith(
                                              color: AppColors.blackColor,
                                              fontWeight: FontWeight.w600),
                                      decoration: const BoxDecoration(
                                        color: AppColors.whiteColor,
                                      ),
                                      message: 'ToolTip Content !',
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text('Top'),
                                      ),
                                    ),
                                    Tooltip(
                                      verticalOffset: -13,
                                      margin: const EdgeInsets.only(right: 200),
                                      preferBelow: false,
                                      textStyle: textTheme.labelMedium!
                                          .copyWith(
                                              color: AppColors.blackColor,
                                              fontWeight: FontWeight.w600),
                                      decoration: const BoxDecoration(
                                        color: AppColors.whiteColor,
                                      ),
                                      message: 'ToolTip Content !',
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text('Left'),
                                      ),
                                    ),
                                    Tooltip(
                                      textStyle: textTheme.labelMedium!
                                          .copyWith(
                                              color: AppColors.blackColor,
                                              fontWeight: FontWeight.w600),
                                      decoration: const BoxDecoration(
                                        color: AppColors.whiteColor,
                                      ),
                                      message: 'ToolTip Content !',
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text('bottom'),
                                      ),
                                    ),
                                    Tooltip(
                                      verticalOffset: -13,
                                      margin: const EdgeInsets.only(left: 200),
                                      preferBelow: false,
                                      textStyle: textTheme.labelMedium!
                                          .copyWith(
                                              color: AppColors.blackColor,
                                              fontWeight: FontWeight.w600),
                                      decoration: const BoxDecoration(
                                        color: AppColors.whiteColor,
                                      ),
                                      message: 'ToolTip Content !',
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text('Right'),
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardBody(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTitle('POPOVERS ALIGNMENTS', textTheme),
                              buildSizedBoxH(kDefaultPadding),
                              const Wrap(
                                direction: Axis.horizontal,
                                spacing: kDefaultPadding * 2.0,
                                runSpacing: kDefaultPadding * 2.0,
                                children: [
                                  Button(
                                      buttonname: 'auto',
                                      direction: PopoverDirection.right),
                                  Button(
                                      buttonname: 'auto-start',
                                      direction: PopoverDirection.right),
                                  Button(
                                      buttonname: 'auto-end',
                                      direction: PopoverDirection.right),
                                  Button(
                                      buttonname: 'Top',
                                      direction: PopoverDirection.top),
                                  Button(
                                      buttonname: 'Top-start',
                                      direction: PopoverDirection.top),
                                  Button(
                                      buttonname: 'Top-end',
                                      direction: PopoverDirection.top),
                                  Button(
                                      buttonname: 'Right',
                                      direction: PopoverDirection.right),
                                  Button(
                                      buttonname: 'Right-start',
                                      direction: PopoverDirection.right),
                                  Button(
                                      buttonname: 'Right-end',
                                      direction: PopoverDirection.right),
                                  Button(
                                      buttonname: 'Bottom',
                                      direction: PopoverDirection.bottom),
                                  Button(
                                      buttonname: 'Bottom-start',
                                      direction: PopoverDirection.bottom),
                                  Button(
                                      buttonname: 'Bottom-end',
                                      direction: PopoverDirection.bottom),
                                  Button(
                                      buttonname: 'Left',
                                      direction: PopoverDirection.left),
                                  Button(
                                      buttonname: 'Left-strat',
                                      direction: PopoverDirection.left),
                                  Button(
                                      buttonname: 'Left-end',
                                      direction: PopoverDirection.left),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardBody(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTitle('SOLID COLORS', textTheme),
                              buildSizedBoxH(kDefaultPadding),
                              const Wrap(
                                direction: Axis.horizontal,
                                spacing: kDefaultPadding * 2.0,
                                runSpacing: kDefaultPadding * 2.0,
                                children: [
                                  ColorToolTipButton(
                                      color: AppColors.primaryColor,
                                      buttonname: 'Primary',
                                      direction: PopoverDirection.bottom),
                                  ColorToolTipButton(
                                      color: AppColors.textgreyColor,
                                      buttonname: 'Secondary',
                                      direction: PopoverDirection.bottom),
                                  ColorToolTipButton(
                                      color: AppColors.buttonSuccessColor,
                                      buttonname: 'Success',
                                      direction: PopoverDirection.bottom),
                                  ColorToolTipButton(
                                      color: AppColors.buttonInfoColor,
                                      buttonname: 'info',
                                      direction: PopoverDirection.bottom),
                                  ColorToolTipButton(
                                      color: AppColors.buttonWarningColor,
                                      buttonname: 'Warning',
                                      direction: PopoverDirection.bottom),
                                  ColorToolTipButton(
                                      color: AppColors.errorcolor,
                                      buttonname: 'Danger',
                                      direction: PopoverDirection.bottom),
                                  ColorToolTipButton(
                                      color: AppColors.buttonFocusColor,
                                      buttonname: 'Focus',
                                      direction: PopoverDirection.bottom),
                                  ColorToolTipButton(
                                      color: AppColors.buttonAltColor,
                                      buttonname: 'Alternate',
                                      direction: PopoverDirection.bottom),
                                  ColorToolTipButton(
                                      color: AppColors.buttontextColor,
                                      buttonname: 'Light',
                                      direction: PopoverDirection.bottom),
                                  ColorToolTipButton(
                                      color: AppColors.textgreyColor,
                                      buttonname: 'Dark',
                                      direction: PopoverDirection.bottom),
                                ],
                              ),
                            ],
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

  Widget _buildTitle(String title, TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
