import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/screens/ui_components/widgets/form_validation_feedback_tab_widget.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';

class FormValidationScreen extends StatefulWidget {
  const FormValidationScreen({Key? key}) : super(key: key);

  @override
  State<FormValidationScreen> createState() => _FormValidationScreenState();
}

class _FormValidationScreenState extends State<FormValidationScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final mediaQueryData = MediaQuery.of(context);
    return PortalMasterLayout(
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          UIComponenetsAppBar(
              title: Lang.current.formValidation,
              subtitle: Lang.current.formValidationSubtitle,
              icon: Assets.images.png.foamHand
                  .image(height: kDefaultPadding * 2, fit: BoxFit.cover)),
          buildSizedBoxH(kDefaultPadding),
          tabBarIcons(textTheme, mediaQueryData),
          buildSizedBoxH(kDefaultPadding),
        ],
      ),
    );
  }

  Widget tabBarIcons(TextTheme textTheme, MediaQueryData mediaQueryData) {
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
                        icon: Text(Lang.current.feedback,
                            style: textTheme.bodyMedium)),
                  ],
                ),
              ),
              const Divider(height: 0),
            ],
          ),
          FormValidationFeedbackTabWidget(mediaQueryData: mediaQueryData)
        ],
      ),
    );
  }
}
