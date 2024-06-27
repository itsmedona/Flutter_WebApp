import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';

class RegularTablesScreen extends StatefulWidget {
  const RegularTablesScreen({Key? key}) : super(key: key);

  @override
  State<RegularTablesScreen> createState() => _RegularTablesScreenState();
}

class _RegularTablesScreenState extends State<RegularTablesScreen> {
  final _dataTableHorizontalScrollController = ScrollController();
  final _dataTableHorizontalScrollController1 = ScrollController();
  final _dataTableHorizontalScrollController2 = ScrollController();
  final _dataTableHorizontalScrollController3 = ScrollController();
  @override
  void dispose() {
    _dataTableHorizontalScrollController.dispose();
    _dataTableHorizontalScrollController1.dispose();
    _dataTableHorizontalScrollController2.dispose();
    _dataTableHorizontalScrollController3.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final mediaQueryData = MediaQuery.of(context);
    return PortalMasterLayout(
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          UIComponenetsAppBar(
              title: Lang.current.regularTables,
              subtitle: Lang.current.regularTableSubtitle,
              icon: Assets.images.png.tablet
                  .image(height: kDefaultPadding * 2, fit: BoxFit.cover)),
          buildSizedBoxH(kDefaultPadding + kTextPadding),
          EntranceFader(
            child: Column(
              children: [
                Visibility(
                  visible: mediaQueryData.size.width >= kScreenWidthLg,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                              child: tablecard(themeData, 'SIMPLE TABLE',
                                  _dataTableHorizontalScrollController)),
                          buildSizedboxW(kDefaultPadding),
                          Flexible(
                              child: tablecard(themeData, 'TABLE BORDERED',
                                  _dataTableHorizontalScrollController1, true)),
                        ],
                      ),
                      buildSizedBoxH(kDefaultPadding),
                      Row(
                        children: [
                          Flexible(
                              child: tablecard(
                                  themeData,
                                  'TABLE ROW COLOR EVEN-NUMBER',
                                  _dataTableHorizontalScrollController2,
                                  true,
                                  false,
                                  true)),
                          buildSizedboxW(kDefaultPadding),
                          Flexible(
                              child: tablecard(
                                  themeData,
                                  'SIMPLE HEADER TABLE COLOR',
                                  _dataTableHorizontalScrollController3,
                                  false,
                                  true)),
                        ],
                      ),
                      // SizedBox(height: 500, child: MyHomePage())
                    ],
                  ),
                ),
                Visibility(
                  visible: mediaQueryData.size.width <= kScreenWidthLg,
                  child: Column(
                    children: [
                      tablecard(themeData, 'SIMPLE TABLE',
                          _dataTableHorizontalScrollController),
                      buildSizedBoxH(kDefaultPadding),
                      tablecard(themeData, 'TABLE BORDERED',
                          _dataTableHorizontalScrollController1, true),
                      buildSizedBoxH(kDefaultPadding),
                      tablecard(
                          themeData,
                          'TABLE ROW COLOR EVEN-NUMBER',
                          _dataTableHorizontalScrollController2,
                          true,
                          false,
                          true),
                      buildSizedBoxH(kDefaultPadding),
                      tablecard(themeData, 'SIMPLE HEADER TABLE COLOR',
                          _dataTableHorizontalScrollController3, false, true)
                    ],
                  ),
                ),
                buildSizedBoxH(kDefaultPadding),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tablecard(
      ThemeData themeData, String title, horizontalScrollController,
      [bool isBorder = false,
      bool isHederColor = false,
      bool isEvenNumber = false]) {
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
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          buildSizedBoxH(kDefaultPadding),
          LayoutBuilder(builder: (context, constraints) {
            final double dataTableWidth =
                max(kScreenWidthMd, constraints.maxWidth);

            return Scrollbar(
              controller: horizontalScrollController,
              thumbVisibility: true,
              trackVisibility: true,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: horizontalScrollController,
                child: SizedBox(
                  width: dataTableWidth - 20,
                  child: DataTable(
                    showBottomBorder: isHederColor ? true : false,
                    dividerThickness: 0,
                    headingRowColor: isHederColor
                        ? MaterialStateColor.resolveWith(
                            (states) => themeData.canvasColor)
                        : null,
                    border: isBorder
                        ? TableBorder.all(color: AppColors.textgreyColor)
                        : null,
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            '#',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'First Name',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Last Name',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Username',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                    rows: <DataRow>[
                      DataRow(
                        color: isEvenNumber
                            ? MaterialStateColor.resolveWith(
                                (states) => getRowColor(0, themeData)!)
                            : null,
                        cells: const <DataCell>[
                          DataCell(Text('1')),
                          DataCell(Text('Sarah')),
                          DataCell(Text('Shah')),
                          DataCell(Text('@Student')),
                        ],
                      ),
                      DataRow(
                        color: isEvenNumber
                            ? MaterialStateColor.resolveWith(
                                (states) => getRowColor(1, themeData)!)
                            : null,
                        cells: const <DataCell>[
                          DataCell(Text('2')),
                          DataCell(Text('Janine')),
                          DataCell(Text('goti')),
                          DataCell(Text('@Professor')),
                        ],
                      ),
                      DataRow(
                        color: isEvenNumber
                            ? MaterialStateColor.resolveWith(
                                (states) => getRowColor(2, themeData)!)
                            : null,
                        cells: const <DataCell>[
                          DataCell(Text('3')),
                          DataCell(Text('William')),
                          DataCell(Text('faranc')),
                          DataCell(Text('@principal')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }

  Color? getRowColor(int rowIndex, ThemeData themeData) {
    // Your custom condition to determine the color
    return rowIndex % 2 == 0 ? themeData.canvasColor : Colors.transparent;
  }
}
