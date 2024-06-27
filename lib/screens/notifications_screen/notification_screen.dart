import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/screens/notifications_screen/widgets/notification_card.dart';
import 'package:flutter_web_dashboard/screens/notifications_screen/widgets/toastify_widget.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);

    final themeData = Theme.of(context);
    final mediaQueryData = MediaQuery.of(context);
    var summaryCardCrossAxisCount =
        mediaQueryData.size.width <= kScreenWidthXxl ? 1 : 2;

    return PortalMasterLayout(
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          UIComponenetsAppBar(
            title: Lang.current.notifications,
            subtitle: Lang.current.notificationsTitle,
            icon: Assets.images.icons.glasses.svg(
                height: kDefaultPadding * 2,
                fit: BoxFit.cover,
                color: AppColors.buttonWarningColor),
          ),
          // buildSizedBoxH(kDefaultPadding),
          // Toastifywidget(),

          EntranceFader(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding + kTextPadding),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final summaryCardWidth = ((constraints.maxWidth -
                          (kDefaultPadding * (summaryCardCrossAxisCount - 1))) /
                      summaryCardCrossAxisCount);
                  return Column(
                    children: [
                      _buildToastifyCards(lang, themeData),
                      buildSizedBoxH(kDefaultPadding),
                      _buildbasicTabCards(lang, themeData, summaryCardWidth),
                      buildSizedBoxH(kDefaultPadding),
                      _buildalertcontentCards(lang, themeData, summaryCardWidth)
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildbasicTabCards(
      Lang lang, ThemeData themeData, double summaryCardWidth) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: kDefaultPadding,
      runSpacing: kDefaultPadding,
      children: [
        AlertCard(
          title: lang.newOrders(2),
          value: 'ALERTS',
          backgroundColor: themeData.dividerColor,
          textColor: themeData.colorScheme.onPrimary,
          body: _buildalertdailogbody(),
          width: summaryCardWidth,
        ),
        AlertCard(
          title: lang.newOrders(2),
          value: 'ALERTS LINK COLOR',
          backgroundColor: themeData.dividerColor,
          textColor: themeData.colorScheme.onPrimary,
          body: _buildalertlinkdailogbody(),
          width: summaryCardWidth,
        )
      ],
    );
  }

  Widget _buildalertcontentCards(
      Lang lang, ThemeData themeData, double summaryCardWidth) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: kDefaultPadding,
      runSpacing: kDefaultPadding,
      children: [
        BuildAlertCard(
          title: lang.newOrders(2),
          value: 'ALERTS CONTENT',
          backgroundColor: themeData.dividerColor,
          textColor: themeData.colorScheme.onPrimary,
          body: _buildAlertContent(),
          width: summaryCardWidth,
        ),
        BuildAlertCard(
          title: lang.newOrders(2),
          value: 'DISMISSABLE ALERTS',
          backgroundColor: themeData.dividerColor,
          textColor: themeData.colorScheme.onPrimary,
          body: _buildalertclosebody(),
          width: summaryCardWidth,
        )
      ],
    );
  }

  Widget _buildToastifyCards(Lang lang, ThemeData themeData) {
    return ToastifyCard(
      iconColor: Colors.black,
      title: 'TOASTIFY CONFIGURATOR',
      backgroundColor: themeData.dividerColor,
      textColor: themeData.colorScheme.onPrimary,
      width: double.infinity,
    );
  }

  Widget _buildalertdailogbody() {
    return Column(
      children: [
        _alertnotification(Colors.red.shade100, Colors.red),
        _alertnotification(Colors.blue.shade100, Colors.blue),
        _alertnotification(Colors.green.shade100, Colors.green),
        _alertnotification(Colors.yellow.shade100, Colors.yellow),
        _alertnotification(Colors.indigo.shade100, Colors.indigo),
        _alertnotification(Colors.teal.shade100, Colors.teal),
        _alertnotification(Colors.grey.shade100, Colors.grey),
        _alertnotification(Colors.grey, Colors.black)
      ],
    );
  }

  Widget _buildalertlinkdailogbody() {
    return Column(
      children: [
        _alertlinknotification(Colors.red.shade100, Colors.red),
        _alertlinknotification(Colors.blue.shade100, Colors.blue),
        _alertlinknotification(Colors.green.shade100, Colors.green),
        _alertlinknotification(Colors.yellow.shade100, Colors.yellow),
        _alertlinknotification(Colors.indigo.shade100, Colors.indigo),
        _alertlinknotification(Colors.teal.shade100, Colors.teal),
        _alertlinknotification(Colors.grey.shade100, Colors.grey),
        _alertlinknotification(Colors.grey, Colors.black)
      ],
    );
  }

  Widget _buildalertclosebody() {
    return Column(
      children: [
        _alertWithclose(Colors.blue.shade100, Colors.blue),
        _alertWithclose(Colors.red.shade100, Colors.red),
      ],
    );
  }

  Widget _buildAlertContent() {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(kDefaultPadding / 2)),
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding / 2),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text('Well done!',
                style: textTheme.titleLarge!.copyWith(
                    color: Colors.green.shade900, fontWeight: FontWeight.w500)),
            buildSizedBoxH(kDefaultPadding),
            Text(
                maxLines: 2,
                'Aww yeah, you successfully read this important alert message. This example text is going to run a bit longer so that you can see how spacing within an alert works with this kind of content.',
                style: textTheme.labelMedium!.copyWith(
                    color: Colors.green.shade900, fontWeight: FontWeight.w600)),
            Divider(color: Colors.green.shade900),
            Text(
                maxLines: 1,
                'Whenever you need to, be sure to use margin utilities to keep things nice and tidy.',
                style: textTheme.labelMedium!.copyWith(
                    color: Colors.green.shade900, fontWeight: FontWeight.w500)),
          ]),
        ),
      ),
    );
  }

  Widget _alertnotification(Color backgroundcolor, Color textcolor) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: backgroundcolor,
            borderRadius: BorderRadius.circular(kDefaultPadding / 2)),
        child: Center(
            child: Text('This is a primary alert — check it out!',
                style: textTheme.labelLarge!
                    .copyWith(color: textcolor, fontWeight: FontWeight.w500))),
      ),
    );
  }

  Widget _alertWithclose(Color backgroundcolor, Color textcolor) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: backgroundcolor,
            borderRadius: BorderRadius.circular(kDefaultPadding / 2)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('I am an alert and I can be dismissed!',
                  style: textTheme.labelLarge!.copyWith(
                      color: textcolor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12)),
              const Icon(
                Icons.close,
                color: Colors.grey,
                size: kDefaultPadding + kTextPadding,
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget _alertlinknotification(Color backgroundcolor, Color textcolor) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: backgroundcolor,
            borderRadius: BorderRadius.circular(kDefaultPadding / 2)),
        child: Center(
          child: Text.rich(
            TextSpan(
              text: 'This is a primary alert with  ',
              style: textTheme.labelLarge!.copyWith(
                color: textcolor,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    text: 'an example link ',
                    style: textTheme.labelLarge!.copyWith(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w600,
                        decorationThickness: 2,
                        decoration: TextDecoration.underline)),
                TextSpan(
                    text: 'Give it a click if you like.',
                    style: textTheme.labelLarge!.copyWith(
                      color: textcolor,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
