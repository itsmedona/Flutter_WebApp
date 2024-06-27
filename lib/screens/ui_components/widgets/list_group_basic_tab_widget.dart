import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/theme/app_theme.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class ListGroupBasicTabWidget extends StatefulWidget {
  const ListGroupBasicTabWidget(
      {super.key, required this.mediaQueryData, required this.themeData});
  final ThemeData themeData;
  final MediaQueryData mediaQueryData;

  @override
  State<ListGroupBasicTabWidget> createState() =>
      _ListGroupBasicTabWidgetState();
}

class _ListGroupBasicTabWidgetState extends State<ListGroupBasicTabWidget> {
  List<Map> listGroup = [
    {
      'title': 'Cras justo odio',
      'color': AppColors.buttonSuccessColor.withOpacity(0.3)
    },
    {
      'title': 'Dapibus ac facilisis in',
      'color': AppColors.buttonInfoColor.withOpacity(0.3)
    },
    {
      'title': 'Morbi leo risus',
      'color': AppColors.buttonWarningColor.withOpacity(0.3)
    },
    {
      'title': 'Porta ac consectetur ac',
      'color': AppColors.buttonFocusColor.withOpacity(0.3)
    },
    {
      'title': 'Vestibulum at eros',
      'color': AppColors.buttonAltColor.withOpacity(0.3)
    }
  ];
  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      child: Column(
        children: [
          Visibility(
            visible: widget.mediaQueryData.size.width >= kScreenWidthLg,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      buildSizedBoxH(kDefaultPadding + kTextPadding),
                      basicCard('LIST GROUP', true),
                      buildSizedBoxH(kDefaultPadding),
                      basicCard('LIST GROUP BADGES', true, true),
                      buildSizedBoxH(kDefaultPadding),
                      basicCard('LIST GROUP CUSTOM CONTENT', false, false, true)
                    ],
                  ),
                ),
                buildSizedboxW(kDefaultPadding),
                Flexible(
                  child: Column(
                    children: [
                      buildSizedBoxH(kDefaultPadding + kTextPadding),
                      basicCard('LIST GROUP BUTTONS'),
                      buildSizedBoxH(kDefaultPadding),
                      basicCard('LIST GROUP CONTEXTUAL CLASSES', true, false,
                          false, true),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: widget.mediaQueryData.size.width <= kScreenWidthLg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSizedBoxH(kDefaultPadding + kTextPadding),
                basicCard('LIST GROUP', true),
                buildSizedBoxH(kDefaultPadding),
                basicCard('LIST GROUP BADGES', true, true),
                buildSizedBoxH(kDefaultPadding),
                basicCard('LIST GROUP CUSTOM CONTENT', false, false, true),
                buildSizedBoxH(kDefaultPadding),
                basicCard('LIST GROUP BUTTONS'),
                buildSizedBoxH(kDefaultPadding),
                basicCard(
                    'LIST GROUP CONTEXTUAL CLASSES', true, false, false, true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget basicCard(String title,
      [bool isButton = false,
      bool isBages = false,
      bool isSubtitle = false,
      bool isColorfull = false]) {
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
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.dividerColor)),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: isBages ? 3 : listGroup.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size.fromWidth(
                                MediaQuery.of(context).size.width),
                            backgroundColor: isColorfull
                                ? listGroup[index]['color']
                                : isButton
                                    ? Colors.transparent
                                    : index == 0
                                        ? AppColors.primaryColor
                                        : Colors.transparent,
                            alignment: Alignment.centerLeft,
                            foregroundColor: !isButton
                                ? AppColors.blackColor
                                : AppColors.whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: isColorfull
                                  ? index == 0
                                      ? const BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0))
                                      : index == 4
                                          ? const BorderRadius.only(
                                              bottomRight: Radius.circular(8.0),
                                              bottomLeft: Radius.circular(8.0))
                                          : BorderRadius.zero
                                  : const BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(
                                          8.0)), // Set the border radius as desired
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: kDefaultPadding * 1.2,
                                horizontal: kDefaultPadding * 1.1),
                            shadowColor: Colors.transparent),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            isBages
                                ? Row(
                                    children: [
                                      Text(listGroup[index]['title'],
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: isButton
                                                  ? widget.themeData.textColor
                                                  : index == 0
                                                      ? widget
                                                          .themeData.textColor
                                                          .withOpacity(0.5)
                                                      : AppColors.blackColor)),
                                      buildSizedboxW(kTextPadding),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: kTextPadding * 2),
                                        decoration: BoxDecoration(
                                            color:
                                                AppColors.buttonSecondaryColor,
                                            borderRadius: BorderRadius.circular(
                                                kDefaultPadding)),
                                        child: const Text(
                                          '6',
                                          style: TextStyle(
                                              color: AppColors.blackColor,
                                              fontSize: kTextPadding * 3),
                                        ),
                                      ),
                                    ],
                                  )
                                : Text(
                                    listGroup[index]['title'],
                                    style: TextStyle(
                                        color: isButton
                                            ? widget.themeData.textColor
                                            : index == 0
                                                ? AppColors.whiteColor
                                                : widget.themeData.textColor),
                                  ),
                            isSubtitle
                                ? Text(
                                    'Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: isButton
                                            ? widget.themeData.textColor
                                            : index == 0
                                                ? AppColors.whiteColor
                                                : widget.themeData.textColor))
                                : const SizedBox.shrink(),
                          ],
                        ),
                        onPressed: () {},
                      ),
                      Visibility(
                          visible: index == listGroup.length - 1
                              ? false
                              : isBages
                                  ? index == listGroup.length - 3
                                      ? false
                                      : true
                                  : true,
                          child: const Divider(
                            height: 0,
                          ))
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
