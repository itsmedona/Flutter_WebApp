import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/screens/ui_components/widgets/list_group_basic_tab_widget.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';

class ListGroupsScreen extends StatefulWidget {
  const ListGroupsScreen({Key? key}) : super(key: key);

  @override
  State<ListGroupsScreen> createState() => _ListGroupsScreenState();
}

class _ListGroupsScreenState extends State<ListGroupsScreen> {
  int selectedIndex = 0;
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
              title: Lang.current.listGroup,
              subtitle: Lang.current.listGroupSubtitle,
              icon: Assets.images.png.tab
                  .image(height: kDefaultPadding * 2, fit: BoxFit.cover)),
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
      length: 1,
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
                        icon: Text(Lang.current.basic,
                            style: textTheme.bodyMedium)),
                  ],
                ),
              ),
              const Divider(height: 0),
            ],
          ),
          ListGroupBasicTabWidget(
              mediaQueryData: mediaQueryData, themeData: themeData)
        ],
      ),
    );
  }
}
