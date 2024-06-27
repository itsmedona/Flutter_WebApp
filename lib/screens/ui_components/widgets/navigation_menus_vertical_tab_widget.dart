import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/theme/app_theme.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class NavigationMenusVerticalTabWidget extends StatefulWidget {
  const NavigationMenusVerticalTabWidget(
      {super.key, required this.mediaQueryData, required this.themeData});
  final ThemeData themeData;
  final MediaQueryData mediaQueryData;

  @override
  State<NavigationMenusVerticalTabWidget> createState() =>
      _NavigationMenusVerticalTabWidgetState();
}

class _NavigationMenusVerticalTabWidgetState
    extends State<NavigationMenusVerticalTabWidget> {
  var popupMenuItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      child: Column(
        children: [
          buildSizedBoxH(kDefaultPadding + kTextPadding),
          basicCard('VERTICAL MENU'),
          buildSizedBoxH(kDefaultPadding),
          seperatorHeadersCard('SEPARATORS & HEADERS'),
        ],
      ),
    );
  }

  Widget basicCard(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: widget.themeData.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.blackColor.withOpacity(0.1), blurRadius: 6)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          buildSizedBoxH(kDefaultPadding - kTextPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    verticalMenuList('Link', '', Colors.transparent),
                    buildSizedBoxH(kTextPadding * 2.5),
                    verticalMenuList(
                        'Link', 'NEW', AppColors.buttonSuccessColor),
                    buildSizedBoxH(kTextPadding * 2.5),
                    verticalMenuList(
                        'Another Link', '512', AppColors.buttonWarningColor),
                    buildSizedBoxH(kTextPadding * 2.5),
                    verticalMenuList('Disabled Link', '', Colors.transparent),
                  ],
                ),
              ),
              buildSizedboxW(widget.mediaQueryData.size.width <= kScreenWidthSm
                  ? 0
                  : kDefaultPadding * 2),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    _buildPopupMenuItem('InBox', '86',
                        AppColors.buttonSecondaryColor, Icons.inbox),
                    buildSizedBoxH(kTextPadding * 2.5),
                    _buildPopupMenuItem(
                        'Book', '5', AppColors.buttondangerColor, Icons.book),
                    buildSizedBoxH(kTextPadding * 2.5),
                    _buildPopupMenuItem('Picture', '', Colors.transparent,
                        Icons.picture_in_picture),
                    buildSizedBoxH(kTextPadding * 2.5),
                    _buildPopupMenuItem('File Disabled', '', Colors.transparent,
                        Icons.file_open),
                  ],
                ),
              )
            ],
          ),
          buildSizedBoxH(kTextPadding * 2),
          const Divider(),
          buildSizedBoxH(kTextPadding * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dropDownButtons('DropDown Basic', true, false),
              buildSizedboxW(kTextPadding * 2),
              dropDownButtons('DropDown Icon', false, false),
            ],
          )
        ],
      ),
    );
  }

  Widget seperatorHeadersCard(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: widget.themeData.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.blackColor.withOpacity(0.1), blurRadius: 6)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          buildSizedBoxH(kDefaultPadding - kTextPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalMenuList('Activity', '', Colors.transparent),
                    buildSizedBoxH(kTextPadding * 2.5),
                    verticalMenuList('Chat', '8', AppColors.buttonInfoColor),
                    buildSizedBoxH(kTextPadding * 2.5),
                    verticalMenuList(
                        'Recover password', '', Colors.transparent),
                    buildSizedBoxH(kTextPadding * 2.5),
                    verticalMenuList('My Account', '', Colors.transparent),
                    buildSizedBoxH(kTextPadding * 2.5),
                    verticalMenuList(
                        'Settings', 'New', AppColors.buttonSuccessColor),
                    buildSizedBoxH(kTextPadding * 2.5),
                    verticalMenuList(
                        'messages', '512', AppColors.buttonWarningColor),
                    buildSizedBoxH(kTextPadding * 2.5),
                    verticalMenuList('Logs', '', Colors.transparent),
                    buildSizedBoxH(kTextPadding * 2),
                    const Divider(),
                    buildSizedBoxH(kTextPadding * 2),
                    button('Cancel', AppColors.buttondangerColor)
                  ],
                ),
              ),
              buildSizedboxW(widget.mediaQueryData.size.width <= kScreenWidthSm
                  ? 0
                  : kDefaultPadding * 2),
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPopupMenuItem('Activity', '', Colors.transparent),
                    buildSizedBoxH(kTextPadding * 2.5),
                    _buildPopupMenuItem(
                        'chat', '8', AppColors.buttonInfoColor, Icons.chat),
                    buildSizedBoxH(kTextPadding * 2.5),
                    _buildPopupMenuItem('Recover password', '',
                        Colors.transparent, Icons.password_rounded),
                    buildSizedBoxH(kTextPadding * 2.5),
                    _buildPopupMenuItem('My Account', '', Colors.transparent),
                    buildSizedBoxH(kTextPadding * 2.5),
                    _buildPopupMenuItem('Settings', 'New',
                        AppColors.buttonSuccessColor, Icons.settings),
                    buildSizedBoxH(kTextPadding * 2.5),
                    _buildPopupMenuItem('messages', '512',
                        AppColors.buttonWarningColor, Icons.message),
                    buildSizedBoxH(kTextPadding * 2.5),
                    _buildPopupMenuItem('Logs', '', Colors.transparent,
                        Icons.file_open_rounded),
                    buildSizedBoxH(kTextPadding * 2),
                    const Divider(),
                    buildSizedBoxH(kTextPadding * 2),
                    button('Save', AppColors.buttonSuccessColor)
                  ],
                ),
              )
            ],
          ),
          buildSizedBoxH(kTextPadding * 2),
          const Divider(),
          buildSizedBoxH(kTextPadding * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dropDownButtons('DropDown Basic', true, true),
              buildSizedboxW(kTextPadding * 2),
              dropDownButtons('DropDown Icon', false, true),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPopupMenuItem(String title, String buttonText, Color bgColor,
      [IconData? iconData]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              children: [
                Visibility(
                  visible: iconData != null,
                  child: Icon(iconData,
                      color: AppColors.textgreyColor, size: kDefaultPadding),
                ),
                buildSizedboxW(iconData != null ? kTextPadding * 2 : 0),
                Flexible(
                  child: Text(title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: title == 'File Disabled' ||
                                  title == 'Activity' ||
                                  title == 'My Account'
                              ? AppColors.textgreyColor
                              : widget.themeData.textColor)),
                ),
              ],
            ),
          ),
          Visibility(
            visible: buttonText.isEmpty ? false : true,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: kTextPadding * 2, vertical: kTextPadding - 2),
              decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(kTextPadding)),
              child: Text(
                buttonText,
                style: TextStyle(
                    color: buttonText == '86'
                        ? AppColors.blackColor
                        : AppColors.whiteColor,
                    fontSize: kTextPadding * 3),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget verticalMenuList(String title, String buttonText, Color bgColor,
      [Color textColor = AppColors.whiteColor]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: title == 'Disabled Link' ||
                            title == 'Activity' ||
                            title == 'My Account'
                        ? AppColors.textgreyColor
                        : widget.themeData.textColor)),
          ),
          buildSizedboxW(kTextPadding),
          Visibility(
            visible: buttonText.isEmpty ? false : true,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: kTextPadding * 2, vertical: kTextPadding - 2),
              decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(kTextPadding)),
              child: Text(
                buttonText,
                style: TextStyle(color: textColor, fontSize: kTextPadding * 3),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dropDownButtons(String title, bool isBasic, bool isSeprates) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.blackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                kTextPadding + 2), // Set the border radius as desired
          ),
          backgroundColor: AppColors.primaryColor,
          fixedSize: const Size.fromHeight(40),
          padding: const EdgeInsets.all(0),
          shadowColor: Colors.transparent),
      child: PopupMenuButton(
        tooltip: '',
        onSelected: (value) {
          _onMenuItemSelected(value as int);
        },
        offset: Offset(0.0, isSeprates ? -402 : 40),
        itemBuilder: (ctx) => isSeprates
            ? isBasic
                ? [
                    popupMenuItem('Activity', Options.action.index, '',
                        Colors.transparent),
                    popupMenuItem('Chat', Options.action.index, '8',
                        AppColors.buttonInfoColor),
                    popupMenuItem('Recover password', Options.action.index, '',
                        Colors.transparent),
                    popupMenuItem('My Account', Options.action.index, '',
                        Colors.transparent),
                    popupMenuItem('Settings', Options.action.index, 'New',
                        AppColors.buttonSuccessColor),
                    popupMenuItem('messages', Options.action.index, '512',
                        AppColors.buttonWarningColor),
                    popupMenuItem(
                        'Logs', Options.action.index, '', Colors.transparent),
                  ]
                : [
                    popupMenuItem('Activity', Options.action.index, '',
                        Colors.transparent),
                    popupMenuItem('Chat', Options.action.index, '8',
                        AppColors.buttonInfoColor, Icons.chat),
                    popupMenuItem('Recover password', Options.action.index, '',
                        Colors.transparent, Icons.password_rounded),
                    popupMenuItem('My Account', Options.action.index, '',
                        Colors.transparent),
                    popupMenuItem('Settings', Options.action.index, 'New',
                        AppColors.buttonSuccessColor, Icons.settings),
                    popupMenuItem('messages', Options.action.index, '512',
                        AppColors.buttonWarningColor, Icons.message),
                    popupMenuItem('Logs', Options.action.index, '',
                        Colors.transparent, Icons.file_open_rounded),
                  ]
            : isBasic
                ? [
                    popupMenuItem(
                        'Link', Options.action.index, '', Colors.transparent),
                    popupMenuItem('Link', Options.action.index, 'New',
                        AppColors.buttonSuccessColor),
                    popupMenuItem('Another Link', Options.action.index, '512',
                        AppColors.buttonWarningColor),
                    popupMenuItem('Disabled Link', Options.action.index, '',
                        Colors.transparent),
                  ]
                : [
                    popupMenuItem(
                        'InBox',
                        Options.action.index,
                        '86',
                        AppColors.buttonSecondaryColor,
                        Icons.inbox,
                        AppColors.blackColor),
                    popupMenuItem('Book', Options.action.index, '5',
                        AppColors.buttondangerColor, Icons.book),
                    popupMenuItem('Picture', Options.action.index, '',
                        Colors.transparent, Icons.picture_in_picture),
                    popupMenuItem('File Disabled', Options.action.index, '',
                        Colors.transparent, Icons.file_open),
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
                title,
                style:
                    const TextStyle(fontSize: 12, color: AppColors.whiteColor),
              ),
              buildSizedboxW(kTextPadding - 2),
              const Icon(Icons.arrow_drop_down,
                  color: AppColors.whiteColor, size: kDefaultPadding)
            ],
          ),
        ),
      ),
      onPressed: () {},
    );
  }

  PopupMenuItem popupMenuItem(
      String title, int position, String buttontext, Color bgColor,
      [IconData? iconData, Color textColor = AppColors.whiteColor]) {
    return PopupMenuItem(
      value: position,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: kDefaultPadding, right: kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Visibility(
                        visible: iconData != null,
                        child: Icon(iconData,
                            color: Colors.black, size: kDefaultPadding)),
                    buildSizedboxW(iconData == null ? 0 : kTextPadding * 2),
                    Text(title,
                        style: TextStyle(
                            color: title == 'File Disabled' ||
                                    title == 'Disabled Link' ||
                                    title == 'Activity' ||
                                    title == 'My Account'
                                ? AppColors.textgreyColor
                                : widget.themeData.textColor)),
                  ],
                ),
                buildSizedboxW(kDefaultPadding),
                Visibility(
                  visible: buttontext.isEmpty ? false : true,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kTextPadding * 2,
                        vertical: kTextPadding - 2),
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(kTextPadding)),
                    child: Text(
                      buttontext,
                      style: TextStyle(
                          color: textColor, fontSize: kTextPadding * 3),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
              visible: title == 'Logs' ? true : false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSizedBoxH(kTextPadding * 2),
                  const Divider(),
                  buildSizedBoxH(kTextPadding * 2),
                  iconData == null
                      ? button('Cancel', AppColors.buttondangerColor)
                      : button('Save', AppColors.buttonSuccessColor)
                ],
              ))
        ],
      ),
    );
  }

  Widget button(String title, Color bgColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: AppColors.blackColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  kTextPadding + 2), // Set the border radius as desired
            ),
            backgroundColor: bgColor,
            padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding * 1.1,
                horizontal: kDefaultPadding - kTextPadding),
            shadowColor: Colors.transparent),
        child: Text(
          title,
          style: const TextStyle(fontSize: 12, color: AppColors.whiteColor),
        ),
        onPressed: () {},
      ),
    );
  }

  _onMenuItemSelected(int value) {
    setState(() {
      popupMenuItemIndex = value;
    });
  }
}

enum Options { header, menus, settings, action }
