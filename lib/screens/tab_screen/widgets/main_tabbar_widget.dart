import 'package:flutter/material.dart';

class MainTabBar extends StatelessWidget {
  const MainTabBar(
      {super.key,
      required this.onClose,
      required this.initialindex,
      required this.tablength,
      this.tab1name,
      this.tab2name});
  final void Function(int) onClose;
  final int initialindex;
  final int tablength;
  final String? tab1name;
  final String? tab2name;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DefaultTabController(
      initialIndex: initialindex,
      length: tablength,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TabBar(
                onTap: (value) {
                  onClose((value));
                },
                padding: EdgeInsets.zero,
                isScrollable: true,
                indicatorPadding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.label,
                splashBorderRadius: BorderRadius.circular(40),
                tabs: [
                  Tab(
                    icon: Text(tab1name!, style: textTheme.bodyMedium),
                  ),
                  Tab(
                    icon: Text(tab2name!, style: textTheme.bodyMedium),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
