import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/theme/app_theme.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class TabCard extends StatefulWidget {
  final String title;
  final String value;
  final Widget icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final double width;
  final bool deletebutton;
  final bool tabbutton;
  final bool tab2header;
  final bool tab3header;
  final bool tab4header;
  final bool tab5header;
  final bool tab6header;
  final bool tab7header;

  const TabCard(
      {Key? key,
      required this.title,
      required this.value,
      required this.icon,
      required this.backgroundColor,
      required this.textColor,
      required this.iconColor,
      required this.width,
      required this.deletebutton,
      required this.tabbutton,
      required this.tab2header,
      required this.tab3header,
      required this.tab4header,
      required this.tab5header,
      required this.tab6header,
      required this.tab7header})
      : super(key: key);

  @override
  State<TabCard> createState() => _TabCardState();
}

class _TabCardState extends State<TabCard> {
  bool view1 = true;
  bool view2 = false;
  bool view3 = false;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final mediaQueryData = MediaQuery.of(context);

    return SizedBox(
      height: mediaQueryData.size.width <= kScreenWidthMd ? 250.0 : 200.0,
      width: widget.width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: themeData.cardColor,
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
                  child: mediaQueryData.size.width <= kScreenWidthMd
                      ? Column(
                          children: [
                            widget.tab4header
                                ? const SizedBox.shrink()
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      widget.icon,
                                      buildSizedboxW(kDefaultPadding / 2),
                                      Text(widget.value,
                                          style: TextStyle(
                                              fontSize:
                                                  mediaQueryData.size.width <=
                                                          kScreenWidthMd
                                                      ? 13
                                                      : 14,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                            buildSizedBoxH(kDefaultPadding),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                widget.tabbutton
                                    ? _buildheaderbutton2(themeData)
                                    : widget.tab2header
                                        ? _buildheaderbutton3()
                                        : widget.tab3header
                                            ? _buildheaderbutton4(themeData)
                                            : widget.tab4header
                                                ? _buildheaderbutton5()
                                                : widget.tab5header
                                                    ? _buildheaderbutton6()
                                                    : widget.tab6header
                                                        ? _buildheaderbutton7()
                                                        : widget.tab7header
                                                            ? _buildheaderbutton8()
                                                            : _buildheaderbutton()
                              ],
                            )
                          ],
                        )
                      : Row(
                          mainAxisAlignment: widget.tab4header
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.spaceBetween,
                          children: [
                            Visibility(
                              visible: widget.tab4header ? false : true,
                              child: Row(
                                children: [
                                  widget.icon,
                                  buildSizedboxW(kDefaultPadding / 2),
                                  Text(widget.value,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: mediaQueryData.size.width <=
                                                  kScreenWidthMd
                                              ? 13
                                              : 14,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                widget.tabbutton
                                    ? _buildheaderbutton2(themeData)
                                    : widget.tab2header
                                        ? _buildheaderbutton3()
                                        : widget.tab3header
                                            ? _buildheaderbutton4(themeData)
                                            : widget.tab4header
                                                ? _buildheaderbutton5()
                                                : widget.tab5header
                                                    ? _buildheaderbutton6()
                                                    : widget.tab6header
                                                        ? _buildheaderbutton7()
                                                        : widget.tab7header
                                                            ? _buildheaderbutton8()
                                                            : _buildheaderbutton()
                              ],
                            )
                          ],
                        )),
              widget.tab3header
                  ? buildSizedBoxH(kDefaultPadding)
                  : const Divider(color: AppColors.dividerColor),
              buildSizedBoxH(kDefaultPadding / 2),
              view1
                  ? const Text(
                      maxLines: 2,
                      "Like Aldus PageMaker including versions of Lorem. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'",
                    )
                  : view2
                      ? const Text(
                          maxLines: 2,
                          "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        )
                      : view3
                          ? const Text(
                              maxLines: 2,
                              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                            )
                          : const Text(''),
              buildSizedBoxH(kDefaultPadding / 2),
              const Divider(color: AppColors.dividerColor),
              buildSizedBoxH(kDefaultPadding / 2),
              _buildFooterbutton(widget.deletebutton)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabbar() {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Column(
        children: [
          TabBar(
            indicator: BoxDecoration(
                color: AppColors.tabbarlableColor,
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.zero,
            isScrollable: true,
            indicatorPadding: EdgeInsets.zero,
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            indicatorSize: TabBarIndicatorSize.tab,
            splashBorderRadius: BorderRadius.circular(40),
            // indicatorColor: AppColors.tabbarlableColor,
            // indicatorWeight: 3,
            labelColor: AppColors.whiteColor,
            dividerColor: AppColors.tabbarlableColor,
            unselectedLabelStyle: const TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            unselectedLabelColor: AppColors.blackColor,
            automaticIndicatorColorAdjustment: true,
            tabs: const [
              Tab(
                text: ("Tab 1"),
              ),
              Tab(
                text: ("Tab 2"),
              ),
              Tab(
                text: ("Tab 3"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterbutton(bool deletebutton) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return deletebutton
                    ? AppColors.tabscreenbitton2.withBlue(2)
                    : AppColors.tabscreenbutton.withBlue(2);
              }
              return deletebutton
                  ? AppColors.tabscreenbitton2
                  : AppColors.tabscreenbutton;
            }),
          ),
          child: deletebutton ? const Text('Delete') : const Text('Save'),
        ),
      ],
    );
  }

  Widget _buildheaderbutton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              view1 = true;
              view2 = false;
              view3 = false;
            });
          },
          style: widget.tabbutton
              ? _buildtab2buttonstyle()
              : _buildnormalbuttonstyle(),
          child: Text('Tab 1',
              style: TextStyle(
                  color: widget.tabbutton
                      ? AppColors.blackColor
                      : AppColors.whiteColor)),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              view1 = false;
              view2 = true;
              view3 = false;
            });
          },
          style: widget.tabbutton
              ? _buildtab2buttonstyle()
              : _buildnormalbuttonstyle2(),
          child: Text('Tab 2',
              style: TextStyle(
                  color: widget.tabbutton
                      ? AppColors.blackColor
                      : AppColors.whiteColor)),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              view1 = false;
              view2 = false;
              view3 = true;
            });
          },
          style: widget.tabbutton
              ? _buildtab2buttonstyle()
              : _buildnormalbuttonstyle3(),
          child: Text('Tab 3',
              style: TextStyle(
                  color: widget.tabbutton
                      ? AppColors.blackColor
                      : AppColors.whiteColor)),
        ),
      ],
    );
  }

  Widget _buildheaderbutton2(ThemeData themeData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              view1 = true;
              view2 = false;
              view3 = false;
            });
          },
          style: _buildtab2buttonstyle(),
          child: Text('Tab 1', style: TextStyle(color: themeData.textColor)),
        ),
        buildSizedboxW(kDefaultPadding / 2),
        ElevatedButton(
          onPressed: () {
            setState(() {
              view1 = false;
              view2 = true;
              view3 = false;
            });
          },
          style: _buildtab2buttonstyle(),
          child: Text('Tab 2', style: TextStyle(color: themeData.textColor)),
        ),
        buildSizedboxW(kDefaultPadding / 2),
        ElevatedButton(
          onPressed: () {
            setState(() {
              view1 = false;
              view2 = false;
              view3 = true;
            });
          },
          style: _buildtab2buttonstyle(),
          child: Text('Tab 3', style: TextStyle(color: themeData.textColor)),
        ),
      ],
    );
  }

  Widget _buildheaderbutton3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              view1 = true;
              view2 = false;
              view3 = false;
            });
          },
          style: _buildtabbuttonstyle2(),
          child: const Text('Tab 1',
              style: TextStyle(color: AppColors.whiteColor)),
        ),
        buildSizedboxW(kDefaultPadding / 2),
        ElevatedButton(
          onPressed: () {
            setState(() {
              view1 = false;
              view2 = true;
              view3 = false;
            });
          },
          style: _buildtabbuttonstyle2(),
          child: const Text('Tab 2',
              style: TextStyle(color: AppColors.whiteColor)),
        ),
        buildSizedboxW(kDefaultPadding / 2),
        ElevatedButton(
          onPressed: () {
            setState(() {
              view1 = false;
              view2 = false;
              view3 = true;
            });
          },
          style: _buildtabbuttonstyle2(),
          child: const Text('Tab 3',
              style: TextStyle(color: AppColors.whiteColor)),
        ),
      ],
    );
  }

  Widget _buildheaderbutton4(ThemeData themeData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  view1 = true;
                  view2 = false;
                  view3 = false;
                });
              },
              style: _buildtabbuttonstyle4(),
              child:
                  Text('Tab 1', style: TextStyle(color: themeData.textColor)),
            ),
            view1
                ? Container(
                    height: 2,
                    width: 50,
                    color: AppColors.blackColor,
                  )
                : const SizedBox.shrink()
          ],
        ),
        buildSizedboxW(kDefaultPadding / 2),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  view1 = false;
                  view2 = true;
                  view3 = false;
                });
              },
              style: _buildtabbuttonstyle4(),
              child:
                  Text('Tab 2', style: TextStyle(color: themeData.textColor)),
            ),
            view2
                ? Container(
                    height: 2,
                    width: 50,
                    color: AppColors.blackColor,
                  )
                : const SizedBox.shrink()
          ],
        ),
        buildSizedboxW(kDefaultPadding / 2),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  view1 = false;
                  view2 = false;
                  view3 = true;
                });
              },
              style: _buildtabbuttonstyle4(),
              child:
                  Text('Tab 3', style: TextStyle(color: themeData.textColor)),
            ),
            view3
                ? Container(
                    height: 2,
                    width: 50,
                    color: AppColors.blackColor,
                  )
                : const SizedBox.shrink()
          ],
        ),
      ],
    );
  }

  Widget _buildheaderbutton5() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  view1 = true;
                  view2 = false;
                  view3 = false;
                });
              },
              style: _buildtabbuttonstyle4(),
              child: const Text('Tab 1',
                  style: TextStyle(color: AppColors.blackColor)),
            ),
            view1
                ? Container(
                    height: 2,
                    width: 50,
                    color: AppColors.blackColor,
                  )
                : const SizedBox.shrink()
          ],
        ),
        buildSizedboxW(kDefaultPadding / 2),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  view1 = false;
                  view2 = true;
                  view3 = false;
                });
              },
              style: _buildtabbuttonstyle4(),
              child: const Text('Tab 2',
                  style: TextStyle(color: AppColors.blackColor)),
            ),
            view2
                ? Container(
                    height: 2,
                    width: 50,
                    color: AppColors.blackColor,
                  )
                : const SizedBox.shrink()
          ],
        ),
        buildSizedboxW(kDefaultPadding / 2),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  view1 = false;
                  view2 = false;
                  view3 = true;
                });
              },
              style: _buildtabbuttonstyle4(),
              child: const Text('Tab 3',
                  style: TextStyle(color: AppColors.blackColor)),
            ),
            view3
                ? Container(
                    height: 2,
                    width: 50,
                    color: AppColors.blackColor,
                  )
                : const SizedBox.shrink()
          ],
        ),
      ],
    );
  }

  Widget _buildheaderbutton6() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              view1 = true;
              view2 = false;
              view3 = false;
            });
          },
          style: _buildtabbuttonstyle5(),
          child: const Text('Tab 1',
              style: TextStyle(color: AppColors.whiteColor)),
        ),
        buildSizedboxW(kDefaultPadding / 2),
        ElevatedButton(
          onPressed: () {
            setState(() {
              view1 = false;
              view2 = true;
              view3 = false;
            });
          },
          style: _buildtabbuttonstyle5(),
          child: const Text('Tab 2',
              style: TextStyle(color: AppColors.whiteColor)),
        ),
        buildSizedboxW(kDefaultPadding / 2),
        ElevatedButton(
          onPressed: () {
            setState(() {
              view1 = false;
              view2 = false;
              view3 = true;
            });
          },
          style: _buildtabbuttonstyle5(),
          child: const Text('Tab 3',
              style: TextStyle(color: AppColors.whiteColor)),
        ),
      ],
    );
  }

  Widget _buildheaderbutton7() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              view1 = true;
              view2 = false;
              view3 = false;
            });
          },
          style: _buildtabbuttonstyle3(),
          child: Row(
            children: [
              const Icon(Icons.home_outlined, color: AppColors.whiteColor),
              buildSizedboxW(kTextPadding),
              const Text('Tab 1',
                  style: TextStyle(color: AppColors.whiteColor)),
            ],
          ),
        ),
        buildSizedboxW(kDefaultPadding / 2),
        ElevatedButton(
          onPressed: () {
            setState(() {
              view1 = false;
              view2 = true;
              view3 = false;
            });
          },
          style: _buildtabbuttonstyle3(),
          child: Row(
            children: [
              const Icon(Icons.account_circle, color: AppColors.whiteColor),
              buildSizedboxW(kTextPadding),
              const Text('Tab 2',
                  style: TextStyle(color: AppColors.whiteColor)),
            ],
          ),
        ),
        buildSizedboxW(kDefaultPadding / 2),
        ElevatedButton(
          onPressed: () {
            setState(() {
              view1 = false;
              view2 = false;
              view3 = true;
            });
          },
          style: _buildtabbuttonstyle3(),
          child: Row(
            children: [
              const Icon(Icons.settings, color: AppColors.whiteColor),
              buildSizedboxW(kTextPadding),
              const Text('Tab 3',
                  style: TextStyle(color: AppColors.whiteColor)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildheaderbutton8() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
            onTap: () {
              setState(() {
                view1 = true;
                view2 = false;
                view3 = false;
              });
            },
            child: const Icon(Icons.home_outlined)),
        buildSizedboxW(kDefaultPadding * 2),
        GestureDetector(
            onTap: () {
              setState(() {
                view1 = false;
                view2 = true;
                view3 = false;
              });
            },
            child: const Icon(
              Icons.account_circle,
            )),
        buildSizedboxW(kDefaultPadding * 2),
        GestureDetector(
            onTap: () {
              setState(() {
                view1 = false;
                view2 = false;
                view3 = true;
              });
            },
            child: const Icon(Icons.settings)),
      ],
    );
  }

  ButtonStyle _buildnormalbuttonstyle() {
    return ButtonStyle(
      elevation: MaterialStateProperty.all<double>(0.0),
      side: MaterialStateProperty.all<BorderSide>(
        BorderSide.none, // Remove left-side border for all button states
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(4),
              topLeft: Radius.circular(4),
              bottomRight: Radius.zero,
              topRight: Radius.zero),
        ),
      ),
      padding: MaterialStateProperty.all<EdgeInsets>(
        const EdgeInsets.all(0), // Adjust the padding values as needed
      ),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        return view1 ? AppColors.tabcolor : AppColors.buttonunselect;
      }),
    );
  }

  ButtonStyle _buildnormalbuttonstyle2() {
    return ButtonStyle(
      elevation: MaterialStateProperty.all<double>(0.0),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      padding: MaterialStateProperty.all<EdgeInsets>(
        const EdgeInsets.all(0),
      ),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        return view2 ? AppColors.tabcolor : AppColors.buttonunselect;
      }),
    );
  }

  ButtonStyle _buildnormalbuttonstyle3() {
    return ButtonStyle(
      elevation: MaterialStateProperty.all<double>(0.0),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(4),
              bottomRight: Radius.circular(4),
              bottomLeft: Radius.zero,
              topLeft: Radius.zero),
        ),
      ),
      padding: MaterialStateProperty.all<EdgeInsets>(
        const EdgeInsets.all(0), // Adjust the padding values as needed
      ),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        return view3 ? AppColors.tabcolor : AppColors.buttonunselect;
      }),
    );
  }

  ButtonStyle _buildtab2buttonstyle() {
    return ButtonStyle(
      elevation: const MaterialStatePropertyAll(0),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(4), // Set the border radius as desired
          side: const BorderSide(
              color: AppColors.outlinecolor,
              width: 1.2), // Set the border color and width
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        return Colors.transparent;
      }),
    );
  }

  ButtonStyle _buildtabbuttonstyle2() {
    return ElevatedButton.styleFrom(
      foregroundColor: AppColors.blackColor,
      onPrimary: AppColors.buttonAltColor,
      primary: AppColors.outlinecolor,
    );
  }
}

ButtonStyle _buildtabbuttonstyle5() {
  return ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(0), // Adjust the padding values as needed
    foregroundColor: AppColors.tabcolor,
    onPrimary: AppColors.tabcolor,
    primary: AppColors.buttonunselect,
  );
}

ButtonStyle _buildtabbuttonstyle4() {
  return ButtonStyle(
    elevation: const MaterialStatePropertyAll(0),
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      return Colors.transparent;
    }),
  );
}

ButtonStyle _buildtabbuttonstyle3() {
  return ElevatedButton.styleFrom(
    foregroundColor: AppColors.blackColor,
    onPrimary: AppColors.uiComponentsbuttonColor,
    primary: AppColors.uiComponentsbuttonColor,
  );
}
