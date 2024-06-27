import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/screens/ui_components/standard_button_screen.dart';
import 'package:flutter_web_dashboard/screens/ui_components/widgets/font_awesome_widget.dart';
import 'package:flutter_web_dashboard/screens/ui_components/widgets/linear_icons_widget.dart';
import 'package:flutter_web_dashboard/screens/ui_components/widgets/pe_icons_widget.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';

class IconsScreen extends StatefulWidget {
  const IconsScreen({Key? key}) : super(key: key);

  @override
  State<IconsScreen> createState() => _IconsScreenState();
}

class _IconsScreenState extends State<IconsScreen> {
  var popupMenuItemIndex = 0;
  int selectedIndex = 0;
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
    {'title': 'Large', 'isicon': false, 'size': 18},
    {'title': 'Normal', 'isicon': false, 'size': 16},
    {'title': 'Small', 'isicon': false, 'size': 14},
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
              title: Lang.current.icons,
              subtitle: Lang.current.iconsSubtitle,
              icon: Assets.images.icons.graph3.svg(
                  height: kDefaultPadding * 2,
                  fit: BoxFit.cover,
                  color: AppColors.buttonAltColor)),
          buildSizedBoxH(kDefaultPadding),
          tabBarIcons(textTheme, mediaQueryData, themeData),
          buildSizedBoxH(kDefaultPadding),
        ],
      ),
    );
  }

  Widget tabBarIcons(
      TextTheme textTheme, MediaQueryData mediaQueryData, ThemeData themeData) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              SizedBox(
                height: 55,
                child: TabBar(
                  onTap: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                  automaticIndicatorColorAdjustment: false,
                  dragStartBehavior: DragStartBehavior.down,
                  isScrollable: true,
                  tabs: [
                    Tab(
                        icon: Text(Lang.current.pe7Icons,
                            style: textTheme.bodyMedium)),
                    Tab(
                        icon: Text(Lang.current.fontAwesome,
                            style: textTheme.bodyMedium)),
                    Tab(
                        icon: Text(Lang.current.linearIcons,
                            style: textTheme.bodyMedium)),
                  ],
                ),
              ),
              const Divider(height: 0),
            ],
          ),
          selectedIndex == 0
              ? Pe7IconsWidget(
                  mediaQueryData: mediaQueryData, themeData: themeData)
              : selectedIndex == 1
                  ? FontAwesomeWidget(
                      mediaQueryData: mediaQueryData, themeData: themeData)
                  : LinearIconsWidget(
                      mediaQueryData: mediaQueryData, themeData: themeData),
        ],
      ),
    );
  }

  Widget simnpleList(String title, bool isSolid, [bool isNoBorder = false]) {
    return Container(
      width: double.infinity,
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
          gridviewServiceList(isSolid, isNoBorder),
        ],
      ),
    );
  }

  Widget splitDropDownList(String title, bool isSolid,
      [bool isNoBorder = false]) {
    return Container(
      width: double.infinity,
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
          gridviewSplitDropDownList(isSolid, isNoBorder),
        ],
      ),
    );
  }

  Widget sizingDropDownList(String title, [bool isNoBorder = false]) {
    return Container(
      width: double.infinity,
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
            (e) => PopupMenuButton(
              tooltip: '',
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              onSelected: (value) {
                _onMenuItemSelected(value as int);
              },
              offset: const Offset(0.0, 43),
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
                width: 115,
                height: kDefaultPadding * 2.5,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(kTextPadding * 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
              child: PopupMenuButton(
                tooltip: '',
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                onSelected: (value) {
                  _onMenuItemSelected(value as int);
                },
                offset: const Offset(0.0, 35),
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
                child: SizedBox(
                  width: 97,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
              child: SizedBox(
                width: 128,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: kDefaultPadding - kTextPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                child: SizedBox(
                  width: isNormal ? 128 : 103,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: kDefaultPadding - kTextPadding),
                    child: Row(
                      mainAxisAlignment: isNormal
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding * 0.7),
                          child: Text(
                            e['title'],
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: e['size']),
                          ),
                        ),
                        Row(
                          children: [
                            Visibility(
                              visible: isNormal,
                              child: SizedBox(
                                  height: 40,
                                  width: 2,
                                  child: VerticalDivider(
                                      color: AppColors.whiteColor
                                          .withOpacity(0.2))),
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
                                _buildPopupMenuItem('Header',
                                    Options.header.index, e['isicon']),
                                _buildPopupMenuItem(
                                    'Menus',
                                    Options.menus.index,
                                    e['isicon'],
                                    Icons.menu),
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
