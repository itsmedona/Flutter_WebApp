import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/route/app_route.dart';
import 'package:flutter_web_dashboard/widgets/side_bar/side_bar.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:go_router/go_router.dart';

final sidebarMenuConfigs = [
  SidebarMenuConfig(
      uri: RouteUri.dashboard,
      icon: Icons.dashboard_rounded,
      title: (context) => Lang.of(context).dashboard),
  SidebarMenuConfig(
    uri: '',
    icon: Icons.interests_rounded,
    title: (context) => Lang.of(context).uiElements(2),
    children: [
      SidebarChildMenuConfig(
        uri: RouteUri.standardButtonlUi,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).standardButton,
      ),
      SidebarChildMenuConfig(
        uri: RouteUri.dropdowns,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).dropdowns,
      ),
      SidebarChildMenuConfig(
        uri: RouteUri.icons,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).icons,
      ),
      SidebarChildMenuConfig(
        uri: RouteUri.badgesAndLabels,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).badges,
      ),
      SidebarChildMenuConfig(
        uri: RouteUri.cards,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).cards,
      ),
      SidebarChildMenuConfig(
        uri: RouteUri.listGroups,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).listGroup,
      ),
      SidebarChildMenuConfig(
        uri: RouteUri.navigationMenus,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).navigationMenus,
      ),
      SidebarChildMenuConfig(
        uri: RouteUri.utilities,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).utilities,
      ),
    ],
  ),
  SidebarMenuConfig(
    uri: '',
    icon: CupertinoIcons.bolt_fill,
    title: (context) => Lang.of(context).components(2),
    children: [
      SidebarChildMenuConfig(
        uri: RouteUri.tabs,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).tabs,
      ),
      SidebarChildMenuConfig(
        uri: RouteUri.productcard,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).productcard,
      ),
      SidebarChildMenuConfig(
        uri: RouteUri.form,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).form,
      ),
      SidebarChildMenuConfig(
        uri: RouteUri.dailog,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).dailogs,
      ),
      SidebarChildMenuConfig(
        uri: RouteUri.pogressbar,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).pogressbar,
      ),
      SidebarChildMenuConfig(
        uri: RouteUri.notifications,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).notifications,
      ),
      SidebarChildMenuConfig(
        uri: RouteUri.tooltip,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).tooltip,
      ),
      SidebarChildMenuConfig(
        uri: RouteUri.carousels,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).carousels,
      ),
    ],
  ),
  SidebarMenuConfig(
    uri: '',
    icon: Icons.account_circle_rounded,
    title: (context) => Lang.of(context).authentication(2),
    children: [
      SidebarChildMenuConfig(
        uri: RouteUri.login,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).login,
      ),
      SidebarChildMenuConfig(
        uri: RouteUri.register,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).register,
      ),
      SidebarChildMenuConfig(
        uri: RouteUri.reset,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).resetpassword,
      ),
    ],
  ),
  SidebarMenuConfig(
    uri: '',
    icon: Icons.pages_outlined,
    title: (context) => Lang.of(context).pages(2),
    children: [
      SidebarChildMenuConfig(
        uri: RouteUri.error404,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).error404,
      ),
      SidebarChildMenuConfig(
        uri: RouteUri.error500,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).error500title,
      ),
      SidebarChildMenuConfig(
        uri: RouteUri.maintanence,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).maintanence,
      ),
      SidebarChildMenuConfig(
        uri: RouteUri.commingsoon,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).commingsoon,
      ),
      SidebarChildMenuConfig(
        uri: RouteUri.faqs,
        icon: Icons.circle_outlined,
        title: (context) => Lang.of(context).faq,
      ),
    ],
  ),
  SidebarMenuConfig(
    uri: RouteUri.profile,
    icon: Icons.person_2,
    title: (context) => Lang.of(context).profile,
  ),
  SidebarMenuConfig(
    uri: RouteUri.validation,
    icon: Icons.laptop_windows_rounded,
    title: (context) => Lang.of(context).validation,
  ),
  SidebarMenuConfig(
    uri: RouteUri.map,
    icon: Icons.location_on_outlined,
    title: (context) => Lang.of(context).map,
  ),
  SidebarMenuConfig(
    uri: RouteUri.regularTables,
    icon: Icons.table_chart,
    title: (context) => Lang.of(context).regularTables,
  ),
  SidebarMenuConfig(
    uri: RouteUri.dashboxes,
    icon: Icons.dataset_rounded,
    title: (context) => Lang.of(context).DashboardBox,
  ),
  SidebarMenuConfig(
    uri: RouteUri.chart,
    icon: Icons.bar_chart,
    title: (context) => Lang.of(context).chartJS,
  ),
];

var popupMenuItemIndex = 0;
Widget popupmenu(profile, context) {
  return PopupMenuButton(
    tooltip: '',
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
    onSelected: (value) {
      // popupMenuItemIndex = value;
    },
    offset: const Offset(0.0, 55),
    itemBuilder: (ctx) => [
      _buildPopupMenuItemTitle('Activity'),
      _buildPopupMenuItem('chat', Options.search.index, context),
      _buildPopupMenuItem('Recover password', Options.upload.index, context),
      _buildPopupMenuItemTitle('My Account'),
      _buildPopupMenuItem('Setting', Options.copy.index, context),
      _buildPopupMenuItem('Messages', Options.exit.index, context),
      _buildPopupMenuItem('Logs', Options.exit.index, context),
    ],
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: profile,
        ),
        const Icon(
          Icons.arrow_drop_down,
          color: AppColors.whiteColor,
        ),
      ],
    ),
  );
}

PopupMenuItem _buildPopupMenuItem(String title, int position, context) {
  return PopupMenuItem(
    value: position,
    onTap: () {
      if (title == 'Setting') {
        GoRouter.of(context).go(RouteUri.profile);
      } else if (title == 'chat') {
        GoRouter.of(context).go(RouteUri.chatscreen);
      }
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              buildSizedboxW(kTextPadding * 2),
              Text(title),
            ],
          ),
          Visibility(
            visible:
                title == 'chat' || title == 'Messages' || title == 'Setting',
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: title == 'chat'
                    ? AppColors.buttonInfoColor
                    : title == 'Setting'
                        ? AppColors.tabscreenbutton
                        : AppColors.errorcolor,
              ),
              child: Text(
                title == 'chat'
                    ? '8'
                    : title == 'Setting'
                        ? 'New'
                        : '512',
                style:
                    const TextStyle(fontSize: 11, color: AppColors.whiteColor),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

PopupMenuItem _buildPopupMenuItemTitle(String title) {
  return PopupMenuItem(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColors.darkTextColor),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 11,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

enum Options { activity, search, upload, copy, exit }

final userprofile = [
  Assets.images.avtars.avtars1.provider(),
  Assets.images.avtars.avtars2.provider(),
  Assets.images.avtars.avtars3.provider(),
  Assets.images.avtars.avtars4.provider(),
  Assets.images.avtars.avtars5.provider(),
  Assets.images.avtars.avtars6.provider(),
  Assets.images.avtars.avtars7.provider(),
  Assets.images.avtars.avtars8.provider(),
  Assets.images.avtars.avtars9.provider(),
  Assets.images.avtars.avtars10.provider(),
  Assets.images.avtars.avtars11.provider(),
  Assets.images.avtars.avtars12.provider(),
  Assets.images.avtars.avtars13.provider(),
  Assets.images.avtars.avtars14.provider(),
];
