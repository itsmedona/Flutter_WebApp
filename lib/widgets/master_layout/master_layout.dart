import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/config/app.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/route/app_route.dart';
import 'package:flutter_web_dashboard/theme/app_sidebar_theme.dart';
import 'package:flutter_web_dashboard/theme/cubit/theme_cubit.dart';
import 'package:flutter_web_dashboard/widgets/animated_searchfield.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout_config.dart';
import 'package:flutter_web_dashboard/widgets/side_bar/side_bar.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LocaleMenuConfig {
  final String languageCode;
  final String? scriptCode;
  final String name;

  const LocaleMenuConfig({
    required this.languageCode,
    this.scriptCode,
    required this.name,
  });
}

class PortalMasterLayout extends StatefulWidget {
  final Widget body;
  final bool autoSelectMenu;
  final String? selectedMenuUri;
  final void Function(bool isOpened)? onDrawerChanged;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final Widget? bottomNavigationBar;
  final List<Widget>? persistentFooterButtons;

  const PortalMasterLayout({
    Key? key,
    required this.body,
    this.autoSelectMenu = true,
    this.selectedMenuUri,
    this.onDrawerChanged,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  State<PortalMasterLayout> createState() => _PortalMasterLayoutState();
}

class _PortalMasterLayoutState extends State<PortalMasterLayout> {
  @override
  Widget build(BuildContext context) {
    bool isStart = true;
    App.init(context);
    dynamic profile;
    final mediaQueryData = MediaQuery.of(context);
    final drawer = (mediaQueryData.size.width <= kScreenWidthLg
        ? _sidebar(context)
        : null);

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        if (isStart) {
          userprofile.shuffle();
          profile = userprofile[0];
          isStart == false;
        }
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(64),
            child: AppBar(
              elevation: 4,
              titleSpacing: mediaQueryData.size.width >= kScreenWidthLg
                  ? kDefaultPadding * kDefaultPadding / 3
                  : 0,
              flexibleSpace: Container(
                decoration:
                    const BoxDecoration(color: AppColors.drbackgroundColor),
              ),
              automaticallyImplyLeading: (drawer != null),
              centerTitle:
                  mediaQueryData.size.width < kScreenWidthLg ? true : false,
              title: mediaQueryData.size.width < kScreenWidthLg
                  ? Text('Dashify',
                      style: GoogleFonts.pacifico(
                          fontSize: kDefaultPadding * 2 - kTextPadding,
                          color: AppColors.whiteColor))
                  : ResponsiveAppBarTitle(
                      onAppBarTitlePressed: () =>
                          GoRouter.of(context).go(RouteUri.home),
                    ),
              actions: [
                popupmenu(profile, context),
                buildSizedboxW(kDefaultPadding),
                Visibility(
                  visible: mediaQueryData.size.width >= kScreenWidthLg,
                  child: Row(
                    children: [
                      buildSizedboxW(kDefaultPadding),
                      _username('Alina Mclourd', 'VP People Manager'),
                      buildSizedboxW(kDefaultPadding),
                      const Padding(
                        padding: EdgeInsets.only(top: kTextPadding * 2),
                        child: SearchbarAnimation(),
                      ),
                      buildSizedboxW(kDefaultPadding),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      context
                          .read<ThemeCubit>()
                          .updateTheme(!state.isDarkThemeOn);
                      setState(() {});
                    },
                    icon: Image.asset(
                      'assets/images/png/${state.isDarkThemeOn ? 'night-mode' : 'brightness'}.png',
                      color: AppColors.whiteColor,
                      // color: state.isDarkThemeOn ? AppColors.whiteColor : null,
                    )),
                buildSizedboxW(kDefaultPadding),
              ],
            ),
          ),
          drawer: drawer,
          drawerEnableOpenDragGesture: false,
          onDrawerChanged: widget.onDrawerChanged,
          body: _layoutbody(context, state),
          bottomNavigationBar: fotter(context),
          floatingActionButton: widget.floatingActionButton,
          floatingActionButtonLocation: widget.floatingActionButtonLocation,
          persistentFooterButtons: widget.persistentFooterButtons,
        );
      },
    );
  }

  _layoutbody(BuildContext context, ThemeState state) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
          top: height * 0.2,
          left: -88,
          child: Container(
            height: height / 3,
            width: 166,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondaryColor,
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
              child: Container(
                height: 166,
                width: 166,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: -100,
          child: Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor.withOpacity(0.5),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 500,
                sigmaY: 500,
              ),
              child: Container(
                height: 200,
                width: 200,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        if (!state.isDarkThemeOn)
          Align(
              alignment: Alignment.center,
              child: Assets.images.jpg.darkbackground.image(
                opacity: const AlwaysStoppedAnimation<double>(0.2),
                width: width,
                height: height,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              )),
        _responsiveBody(context)
      ],
    );
  }

  Widget _responsiveBody(BuildContext context) {
    if (MediaQuery.of(context).size.width <= kScreenWidthLg) {
      return widget.body;
    } else {
      return Row(
        children: [
          SizedBox(
            width: Theme.of(context).extension<AppSidebarTheme>()?.sidebarWidth,
            child: _sidebar(context),
          ),
          Expanded(child: widget.body),
        ],
      );
    }
  }

  Widget fotter(context) {
    return Container(
      height: 40,
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      decoration: const BoxDecoration(color: AppColors.drbackgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '© 2023 made by Dashify Team for a better web.',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.whiteColor,
                fontSize: MediaQuery.of(context).size.width < kScreenWidthSm
                    ? kDefaultPadding / 1.35
                    : kDefaultPadding),
          ),
          // Visibility(
          //   visible: MediaQuery.of(context).size.width > kScreenWidthMd,
          //   child: Row(
          //     children: [
          //       const Text(
          //         'Footer Link 1',
          //         style: TextStyle(
          //             fontWeight: FontWeight.w500,
          //             color: AppColors.blackColor,
          //             fontSize: kDefaultPadding / 1.2),
          //       ),
          //       buildSizedboxW(kDefaultPadding * 2),
          //       const Text(
          //         'Footer Link 2',
          //         style: TextStyle(
          //             fontWeight: FontWeight.w500,
          //             color: AppColors.blackColor,
          //             fontSize: kDefaultPadding / 1.2),
          //       ),
          //       buildSizedboxW(kDefaultPadding * 2),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _sidebar(BuildContext context) {
    return Sidebar(
      autoSelectMenu: widget.autoSelectMenu,
      selectedMenuUri: widget.selectedMenuUri,
      sidebarConfigs: sidebarMenuConfigs,
    );
  }

  Widget _username(String userName, String userType) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Text(userName,
              style: GoogleFonts.inter(
                  color: AppColors.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          buildSizedBoxH(kTextPadding / 3),
          Text(userType,
              style:
                  GoogleFonts.inter(color: AppColors.whiteColor, fontSize: 12)),
        ],
      ),
    );
  }
}

class ResponsiveAppBarTitle extends StatelessWidget {
  final void Function() onAppBarTitlePressed;

  const ResponsiveAppBarTitle({
    Key? key,
    required this.onAppBarTitlePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onAppBarTitlePressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
                visible: (mediaQueryData.size.width > kScreenWidthLg),
                child: Text('Dashify',
                    style: GoogleFonts.pacifico(
                        fontSize: kDefaultPadding * 2 - kTextPadding,
                        color: AppColors.whiteColor))),
          ],
        ),
      ),
    );
  }
}
