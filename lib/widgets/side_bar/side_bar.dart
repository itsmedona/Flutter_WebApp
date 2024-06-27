import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/theme/app_sidebar_theme.dart';
import 'package:flutter_web_dashboard/theme/cubit/theme_cubit.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout_config.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SidebarMenuConfig {
  final String uri;
  final IconData icon;
  final String Function(BuildContext context) title;
  final List<SidebarChildMenuConfig> children;

  const SidebarMenuConfig({
    required this.uri,
    required this.icon,
    required this.title,
    List<SidebarChildMenuConfig>? children,
  }) : children = children ?? const [];
}

class SidebarChildMenuConfig {
  final String uri;
  final IconData icon;
  final String Function(BuildContext context) title;

  const SidebarChildMenuConfig(
      {required this.uri, required this.icon, required this.title});
}

class Sidebar extends StatefulWidget {
  final bool autoSelectMenu;
  final String? selectedMenuUri;

  final List<SidebarMenuConfig> sidebarConfigs;

  const Sidebar(
      {Key? key,
      this.autoSelectMenu = true,
      this.selectedMenuUri,
      required this.sidebarConfigs})
      : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  final _scrollController = ScrollController();
  bool isExpeded = true;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);
    final mediaQueryData = MediaQuery.of(context);
    final themeData = Theme.of(context);
    final sidebarTheme = themeData.extension<AppSidebarTheme>()!;

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Drawer(
          elevation: 4,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: [
              Visibility(
                visible: (mediaQueryData.size.width <= kScreenWidthLg),
                child: Container(
                  decoration:
                      const BoxDecoration(color: AppColors.drbackgroundColor),
                  alignment: Alignment.centerRight,
                  height: kToolbarHeight + kDefaultPadding - 1,
                  padding: const EdgeInsets.only(left: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Dashify',
                          style: GoogleFonts.pacifico(
                              fontSize: kDefaultPadding * 2 - kTextPadding,
                              color: AppColors.whiteColor)),
                      IconButton(
                        onPressed: () {
                          if (Scaffold.of(context).isDrawerOpen) {
                            Scaffold.of(context).closeDrawer();
                          }
                        },
                        icon: const Icon(CupertinoIcons.clear_thick),
                        color: AppColors.whiteColor,
                        tooltip: lang.closeNavigationMenu,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Theme(
                  data: themeData.copyWith(
                    scrollbarTheme: themeData.scrollbarTheme.copyWith(
                      thumbColor: MaterialStateProperty.all(
                          sidebarTheme.foregroundColor.withOpacity(0.2)),
                    ),
                  ),
                  child: Scrollbar(
                    controller: _scrollController,
                    child: ListView(
                      controller: _scrollController,
                      padding: EdgeInsets.fromLTRB(
                        sidebarTheme.sidebarLeftPadding,
                        sidebarTheme.sidebarTopPadding,
                        sidebarTheme.sidebarRightPadding,
                        sidebarTheme.sidebarBottomPadding,
                      ),
                      children: [
                        _sidebarMenuList(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _sidebarMenuList(BuildContext context) {
    final sidebarTheme = Theme.of(context).extension<AppSidebarTheme>()!;

    var currentLocation = widget.selectedMenuUri ?? '';

    if (currentLocation.isEmpty && widget.autoSelectMenu) {
      currentLocation = GoRouter.of(context).location;
    }

    return Column(
      children: sidebarMenuConfigs.map<Widget>((menu) {
        if (menu.children.isEmpty) {
          return _sidebarMenu(
            context,
            EdgeInsets.fromLTRB(
              sidebarTheme.menuLeftPadding,
              sidebarTheme.menuTopPadding,
              sidebarTheme.menuRightPadding,
              sidebarTheme.menuBottomPadding,
            ),
            menu.uri,
            menu.icon,
            menu.title(context),
            (currentLocation.startsWith(menu.uri)),
          );
        } else {
          return _expandableSidebarMenu(
            context,
            EdgeInsets.fromLTRB(
              sidebarTheme.menuLeftPadding,
              sidebarTheme.menuTopPadding,
              sidebarTheme.menuRightPadding,
              sidebarTheme.menuBottomPadding,
            ),
            menu.uri,
            menu.icon,
            menu.title(context),
            menu.children,
            currentLocation,
          );
        }
      }).toList(growable: false),
    );
  }

  Widget _sidebarMenu(
    BuildContext context,
    EdgeInsets padding,
    String uri,
    IconData icon,
    String title,
    bool isSelected,
  ) {
    final sidebarTheme = Theme.of(context).extension<AppSidebarTheme>()!;

    return Padding(
      padding: padding,
      child: ListTile(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isSelected
                ? Icon(
                    icon == Icons.dashboard_rounded ||
                            icon == Icons.bar_chart ||
                            icon == Icons.dataset_rounded ||
                            icon == Icons.table_chart ||
                            icon == Icons.location_on_outlined ||
                            icon == Icons.laptop_windows_rounded ||
                            icon == Icons.person_2
                        ? icon
                        : Icons.stop_circle_outlined,
                    size: (sidebarTheme.menuFontSize + 4.0),
                    color: AppColors.dashifycolor)
                : Icon(
                    icon,
                    size: (sidebarTheme.menuFontSize + 4.0),
                    color: AppColors.whiteColor,
                  ),
            const SizedBox(width: kDefaultPadding * 0.5),
            Text(
              title,
              style: TextStyle(
                fontSize: sidebarTheme.menuFontSize,
                color:
                    isSelected ? AppColors.dashifycolor : AppColors.whiteColor,
              ),
            ),
          ],
        ),
        onTap: () {
          GoRouter.of(context).go(uri);
        },
        selected: isSelected,
        // selectedTileColor:
        //     isExpeded ? AppColors.dashifycolor : Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(sidebarTheme.menuBorderRadius)),
        textColor: isSelected ? AppColors.dashifycolor : AppColors.whiteColor,
        hoverColor: !isSelected ? AppColors.dashifycolor : Colors.transparent,
      ),
    );
  }

  Widget _expandableSidebarMenu(
      BuildContext context,
      EdgeInsets padding,
      String uri,
      IconData icon,
      String title,
      List<SidebarChildMenuConfig> children,
      String currentLocation) {
    final themeData = Theme.of(context);
    final sidebarTheme = Theme.of(context).extension<AppSidebarTheme>()!;
    final hasSelectedChild =
        children.any((e) => currentLocation.startsWith(e.uri));
    final parentTextColor =
        (hasSelectedChild ? AppColors.whiteColor : AppColors.whiteColor);

    return Padding(
      padding: padding,
      child: Theme(
        data: themeData.copyWith(hoverColor: AppColors.dashifycolor),
        child: ExpansionTile(
          key: UniqueKey(),

          textColor: parentTextColor,
          collapsedTextColor: parentTextColor,
          iconColor: parentTextColor,
          collapsedIconColor: parentTextColor,
          // backgroundColor:
          //     sidebarTheme.menuExpandedBackgroundColor.withOpacity(0),
          // collapsedBackgroundColor: (hasSelectedChild
          //     ? sidebarTheme.menuExpandedBackgroundColor
          //     : Colors.white.withOpacity(0.0)),
          initiallyExpanded: hasSelectedChild,
          childrenPadding: EdgeInsets.only(
            top: sidebarTheme.menuExpandedChildTopPadding,
            bottom: sidebarTheme.menuExpandedChildBottomPadding,
          ),

          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: (sidebarTheme.menuFontSize + 4.0),
              ),
              const SizedBox(width: kDefaultPadding * 0.5),
              Text(
                title,
                style: TextStyle(
                  fontSize: sidebarTheme.menuFontSize,
                ),
              ),
            ],
          ),
          children: children.map<Widget>((childMenu) {
            return _sidebarMenu(
                context,
                EdgeInsets.fromLTRB(
                  sidebarTheme.menuExpandedChildLeftPadding,
                  sidebarTheme.menuExpandedChildTopPadding,
                  sidebarTheme.menuExpandedChildRightPadding,
                  sidebarTheme.menuExpandedChildBottomPadding,
                ),
                childMenu.uri,
                childMenu.icon,
                childMenu.title(context),
                (currentLocation.startsWith(childMenu.uri)));
          }).toList(growable: false),
        ),
      ),
    );
  }
}
