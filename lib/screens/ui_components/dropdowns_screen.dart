import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/screens/ui_components/standard_button_screen.dart';
import 'package:flutter_web_dashboard/theme/app_theme.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';

class DropdownsScreen extends StatefulWidget {
  const DropdownsScreen({Key? key}) : super(key: key);

  @override
  State<DropdownsScreen> createState() => _DropdownsScreenState();
}

class _DropdownsScreenState extends State<DropdownsScreen> {
  var popupMenuItemIndex = 0;
  List listProduct = [
    {'title': 'Primary', 'color': AppColors.primaryColor, 'isicon': false},
    {
      'title': 'Secondary',
      'color': AppColors.buttonSecondaryColor,
      'isicon': false
    },
    {
      'title': 'Success',
      'color': AppColors.buttonSuccessColor,
      'isicon': false
    },
    {'title': 'Info', 'color': AppColors.buttonInfoColor, 'isicon': false},
    {
      'title': 'Worning',
      'color': AppColors.buttonWarningColor,
      'isicon': false
    },
    {'title': 'Focus', 'color': AppColors.buttonFocusColor, 'isicon': false},
    {'title': 'Alt', 'color': AppColors.buttonAltColor, 'isicon': false},
  ];

  List dropDownMenuList = [
    {'title': 'Basic', 'isicon': false},
    {'title': 'Hover open', 'isicon': false},
    {'title': 'Rounded', 'isicon': false},
    {'title': 'Shadow', 'isicon': false},
    {'title': 'icons', 'isicon': true},
    {'title': 'Right aligned', 'isicon': false},
  ];
  List sizingDropDownMenuList = [
    {'title': 'Large', 'isicon': false, 'size': 18.0},
    {'title': 'Normal', 'isicon': false, 'size': 16.0},
    {'title': 'Small', 'isicon': false, 'size': 14.0},
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
            title: Lang.current.dropdowns,
            subtitle: Lang.current.dropdownSubtitle,
            icon: Assets.images.png.umbrella
                .image(height: kDefaultPadding * 2, fit: BoxFit.cover),
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
                          icon: Text(Lang.current.regularDropdowns,
                              style: textTheme.bodyMedium)),
                    ],
                  ),
                ),
                const Divider(height: 0),
              ],
            ),
          ),
          buildSizedBoxH(kDefaultPadding + kTextPadding),
          EntranceFader(
            child: Column(
              children: [
                dropDownMenStyle('DROPDOWN MENU STYLES', themeData),
                buildSizedBoxH(kDefaultPadding),
                Visibility(
                  visible: mediaQueryData.size.width >= kScreenWidthLg,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: simnpleList(themeData, 'BASIC', true)),
                          buildSizedboxW(kDefaultPadding),
                          Expanded(
                              child: simnpleList(themeData, 'OUTLINE', false)),
                        ],
                      ),
                      buildSizedBoxH(kDefaultPadding),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                splitDropDownList(
                                    themeData, 'SPLIT DROPDOWNS', true),
                                buildSizedBoxH(kDefaultPadding),
                                splitDropDownList(themeData,
                                    'SPLIT OUTLINE DROPDOWNS', false),
                              ],
                            ),
                          ),
                          buildSizedboxW(kDefaultPadding),
                          Expanded(
                            child: Column(
                              children: [
                                sizingDropDownList(themeData, 'SIZING'),
                                buildSizedBoxH(kDefaultPadding),
                                sizingDropDownList(themeData, 'WIDER'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: mediaQueryData.size.width <= kScreenWidthLg,
                  child: Column(
                    children: [
                      simnpleList(themeData, 'BASIC', true),
                      buildSizedBoxH(kDefaultPadding),
                      simnpleList(themeData, 'OUTLINE', false),
                      buildSizedBoxH(kDefaultPadding),
                      splitDropDownList(themeData, 'SPLIT DROPDOWNS', true),
                      buildSizedBoxH(kDefaultPadding),
                      splitDropDownList(
                          themeData, 'SPLIT OUTLINE DROPDOWNS', false),
                      buildSizedBoxH(kDefaultPadding),
                      sizingDropDownList(themeData, 'SIZING'),
                      buildSizedBoxH(kDefaultPadding),
                      sizingDropDownList(themeData, 'WIDER'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          buildSizedBoxH(kDefaultPadding),
        ],
      ),
    );
  }

  Widget dropDownMenStyle(String title, ThemeData themeData) {
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
          gridviewDropdownList(),
        ],
      ),
    );
  }

  Widget simnpleList(ThemeData themeData, String title, bool isSolid,
      [bool isNoBorder = false]) {
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
          gridviewServiceList(isSolid, isNoBorder),
        ],
      ),
    );
  }

  Widget splitDropDownList(ThemeData themeData, String title, bool isSolid,
      [bool isNoBorder = false]) {
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
          gridviewSplitDropDownList(isSolid, isNoBorder),
        ],
      ),
    );
  }

  Widget sizingDropDownList(ThemeData themeData, String title,
      [bool isNoBorder = false]) {
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
          gridviewSizingDropDownList(true),
          buildSizedBoxH(kDefaultPadding),
          const Divider(
              indent: kDefaultPadding - kTextPadding,
              endIndent: kDefaultPadding - kTextPadding),
          buildSizedBoxH(kDefaultPadding),
          gridviewSizingDropDownList(false),
        ],
      ),
    );
  }

  Widget checkBoxButtons(String title) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
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
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor),
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

  Widget gridviewDropdownList() {
    return Wrap(
      spacing: kDefaultPadding,
      runSpacing: kDefaultPadding,
      children: dropDownMenuList
          .map(
            (e) => ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromHeight(40),
                  foregroundColor: AppColors.blackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Set the border radius as desired
                  ),
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.all(0)),
              child: PopupMenuButton(
                tooltip: '',
                clipBehavior: Clip.none,
                onSelected: (value) {
                  _onMenuItemSelected(value as int);
                },
                offset: const Offset(0.0, 40),
                itemBuilder: (ctx) => [
                  _buildPopupMenuItem(
                      'Header', Options.header.index, e['isicon']),
                  _buildPopupMenuItem(
                      'Menus', Options.menus.index, e['isicon'], Icons.menu),
                  _buildPopupMenuItem('Settings', Options.settings.index,
                      e['isicon'], Icons.settings),
                  _buildPopupMenuItem('Actions', Options.action.index,
                      e['isicon'], Icons.call_to_action),
                  _buildPopupMenuItem('Dividers', Options.dividers.index,
                      e['isicon'], Icons.image_aspect_ratio),
                ],
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding - kTextPadding,
                      vertical: kDefaultPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        e['title'],
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.whiteColor),
                      ),
                      buildSizedboxW(kTextPadding),
                      const Icon(Icons.arrow_drop_down,
                          color: AppColors.whiteColor, size: kDefaultPadding)
                    ],
                  ),
                ),
              ),
              onPressed: () {},
            ),
          )
          .toList(),
    );
  }

  Widget gridviewServiceList(bool isSolid, [bool isNoBorder = false]) {
    return Wrap(
      spacing: kDefaultPadding,
      runSpacing: kDefaultPadding,
      children: listProduct
          .map(
            (e) => ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: isSolid ? null : e['color'],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Set the border radius as desired
                    side: BorderSide(
                        color: !isNoBorder ? e['color'] : Colors.transparent,
                        width: 1.2), // Set the border color and width
                  ),
                  backgroundColor: isSolid ? e['color'] : Colors.transparent,
                  fixedSize: const Size.fromHeight(40),
                  padding: const EdgeInsets.all(0),
                  shadowColor: !isSolid ? Colors.transparent : null),
              child: PopupMenuButton(
                tooltip: '',
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                onSelected: (value) {
                  _onMenuItemSelected(value as int);
                },
                offset: const Offset(0.0, 40),
                itemBuilder: (ctx) => [
                  _buildPopupMenuItem(
                      'Header', Options.header.index, e['isicon']),
                  _buildPopupMenuItem(
                      'Menus', Options.menus.index, e['isicon'], Icons.menu),
                  _buildPopupMenuItem('Settings', Options.settings.index,
                      e['isicon'], Icons.settings),
                  _buildPopupMenuItem('Actions', Options.action.index,
                      e['isicon'], Icons.call_to_action),
                  _buildPopupMenuItem('Dividers', Options.dividers.index,
                      e['isicon'], Icons.image_aspect_ratio),
                ],
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding - kTextPadding,
                      vertical: kDefaultPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        e['title'],
                        style: TextStyle(
                            color: !isSolid
                                ? e['color']
                                : e['title'] == 'Secondary'
                                    ? AppColors.blackColor
                                    : AppColors.whiteColor),
                      ),
                      buildSizedboxW(kTextPadding),
                      Icon(Icons.arrow_drop_down,
                          color: !isSolid
                              ? e['color']
                              : e['title'] == 'Secondary'
                                  ? AppColors.blackColor
                                  : AppColors.whiteColor,
                          size: kDefaultPadding)
                    ],
                  ),
                ),
              ),
              onPressed: () {},
            ),
          )
          .toList(),
    );
  }

  Widget gridviewSplitDropDownList(bool isSolid, [bool isNoBorder = false]) {
    return Wrap(
      spacing: kDefaultPadding,
      runSpacing: kDefaultPadding,
      children: listProduct
          .map(
            (e) => ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromHeight(40),
                  foregroundColor: isSolid ? null : e['color'],
                  backgroundColor: isSolid ? e['color'] : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Set the border radius as desired
                    side: BorderSide(
                        color: !isNoBorder ? e['color'] : Colors.transparent,
                        width: 1.2), // Set the border color and width
                  ),
                  padding: const EdgeInsets.all(0),
                  shadowColor: !isSolid ? Colors.transparent : null),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: kDefaultPadding - kTextPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPadding * 0.7,
                      ),
                      child: Text(
                        e['title'],
                        style: TextStyle(
                            color: !isSolid
                                ? e['color']
                                : e['title'] == 'Secondary'
                                    ? AppColors.blackColor
                                    : AppColors.whiteColor),
                      ),
                    ),
                    buildSizedboxW(kTextPadding * 2),
                    Row(
                      children: [
                        SizedBox(
                            height: 40,
                            width: 2,
                            child: VerticalDivider(
                                color: !isSolid
                                    ? e['color']
                                    : AppColors.whiteColor.withOpacity(0.2))),
                        PopupMenuButton(
                          tooltip: '',
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
                          onSelected: (value) {
                            _onMenuItemSelected(value as int);
                          },
                          offset: const Offset(0.0, 40),
                          itemBuilder: (ctx) => [
                            _buildPopupMenuItem(
                                'Header', Options.header.index, e['isicon']),
                            _buildPopupMenuItem('Menus', Options.menus.index,
                                e['isicon'], Icons.menu),
                            _buildPopupMenuItem(
                                'Settings',
                                Options.settings.index,
                                e['isicon'],
                                Icons.settings),
                            _buildPopupMenuItem('Actions', Options.action.index,
                                e['isicon'], Icons.call_to_action),
                            _buildPopupMenuItem(
                                'Dividers',
                                Options.dividers.index,
                                e['isicon'],
                                Icons.image_aspect_ratio),
                          ],
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: kTextPadding * 2,
                                left: kTextPadding * 1.7,
                                right: kTextPadding * 2,
                                bottom: kTextPadding * 2),
                            child: Icon(Icons.arrow_drop_down,
                                color: !isSolid
                                    ? e['color']
                                    : e['title'] == 'Secondary'
                                        ? AppColors.blackColor
                                        : AppColors.whiteColor,
                                size: kDefaultPadding),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              onPressed: () {},
            ),
          )
          .toList(),
    );
  }

  Widget gridviewSizingDropDownList(bool isNormal) {
    return Center(
      child: Wrap(
        spacing: kDefaultPadding,
        runSpacing: kDefaultPadding,
        children: sizingDropDownMenuList
            .map(
              (e) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Set the border radius as desired
                    ),
                    padding: const EdgeInsets.all(0)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: kDefaultPadding - kTextPadding),
                  child: Row(
                    mainAxisAlignment: isNormal
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding * 0.7),
                        child: Text(
                          e['title'],
                          style: TextStyle(
                              color: AppColors.whiteColor, fontSize: e['size']),
                        ),
                      ),
                      buildSizedboxW(kTextPadding * 2),
                      Row(
                        children: [
                          Visibility(
                            visible: isNormal,
                            child: SizedBox(
                                height: 40,
                                width: 2,
                                child: VerticalDivider(
                                    color:
                                        AppColors.whiteColor.withOpacity(0.2))),
                          ),
                          PopupMenuButton(
                            tooltip: '',
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            onSelected: (value) {
                              _onMenuItemSelected(value as int);
                            },
                            offset: const Offset(0.0, 40),
                            itemBuilder: (ctx) => [
                              _buildPopupMenuItem(
                                  'Header', Options.header.index, e['isicon']),
                              _buildPopupMenuItem('Menus', Options.menus.index,
                                  e['isicon'], Icons.menu),
                              _buildPopupMenuItem(
                                  'Settings',
                                  Options.settings.index,
                                  e['isicon'],
                                  Icons.settings),
                              _buildPopupMenuItem(
                                  'Actions',
                                  Options.action.index,
                                  e['isicon'],
                                  Icons.call_to_action),
                              _buildPopupMenuItem(
                                  'Dividers',
                                  Options.dividers.index,
                                  e['isicon'],
                                  Icons.image_aspect_ratio),
                            ],
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: kTextPadding * 2,
                                  left: kTextPadding * 1.7,
                                  right: kTextPadding * 2,
                                  bottom: kTextPadding * 2),
                              child: const Icon(Icons.arrow_drop_down,
                                  color: AppColors.whiteColor,
                                  size: kDefaultPadding),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                onPressed: () {},
              ),
            )
            .toList(),
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(String title, int position, bool isIcon,
      [IconData? iconData]) {
    return PopupMenuItem(
      value: position,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: kDefaultPadding, right: kDefaultPadding * 5),
            child: Row(
              children: [
                Visibility(
                  visible: iconData != null && isIcon,
                  child: Icon(iconData,
                      color: Colors.black, size: kDefaultPadding),
                ),
                buildSizedboxW(kTextPadding * 2),
                Text(title,
                    style: TextStyle(
                        color:
                            title == 'Header' ? AppColors.dividerColor : null))
              ],
            ),
          ),
          Visibility(visible: title == 'Actions', child: const Divider())
        ],
      ),
    );
  }

  _onMenuItemSelected(int value) {
    setState(() {
      popupMenuItemIndex = value;
    });
  }
}

enum Options { header, menus, settings, action, dividers }
