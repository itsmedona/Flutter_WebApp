import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class FormValidationFeedbackTabWidget extends StatefulWidget {
  const FormValidationFeedbackTabWidget(
      {super.key, required this.mediaQueryData});
  final MediaQueryData mediaQueryData;

  @override
  State<FormValidationFeedbackTabWidget> createState() =>
      _FormValidationFeedbackTabWidgetState();
}

class _FormValidationFeedbackTabWidgetState
    extends State<FormValidationFeedbackTabWidget> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return EntranceFader(
      child: Column(
        children: [
          buildSizedBoxH(kDefaultPadding + kTextPadding),
          Visibility(
            visible: widget.mediaQueryData.size.width >= kScreenWidthLg,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: feedBackList(Lang.current.basic, false, themeData)),
                buildSizedboxW(kDefaultPadding),
                Flexible(
                    child: feedBackList('ALTERNATE STYLE', true, themeData)),
              ],
            ),
          ),
          Visibility(
            visible: widget.mediaQueryData.size.width <= kScreenWidthLg,
            child: Column(
              children: [
                feedBackList(Lang.current.basic, false, themeData),
                buildSizedBoxH(kDefaultPadding),
                feedBackList('ALTERNATE STYLE', true, themeData),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget feedBackList(String title, bool isBox, ThemeData themeData) {
    return Container(
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
          const Text(
            'Input without validation',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          buildSizedBoxH(kTextPadding),
          FormBuilderTextField(
            name: 'Title',
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          buildSizedBoxH(kTextPadding),
          const Text(
            'Example help text that remains unchanged.',
            style: TextStyle(fontSize: 12),
          ),
          buildSizedBoxH(kDefaultPadding),
          const Text(
            'Valid input',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          buildSizedBoxH(kTextPadding),
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormBuilderTextField(
                    name: 'Title',
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.check),
                        suffixIconColor: AppColors.buttonSuccessColor,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: AppColors.buttonSuccessColor,
                                width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: AppColors.buttonSuccessColor,
                                width: 1))),
                  ),
                  buildSizedBoxH(kTextPadding),
                  Visibility(
                    visible: isBox ? false : true,
                    child: const Text(
                      'Sweet! that name is available',
                      style: TextStyle(
                          fontSize: 12, color: AppColors.buttonSuccessColor),
                    ),
                  ),
                  buildSizedBoxH(kTextPadding),
                  const Text(
                    'Example help text that remains unchanged.',
                    style: TextStyle(fontSize: 12),
                  ),
                  buildSizedBoxH(kDefaultPadding),
                  const Text(
                    'Invalid input',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  buildSizedBoxH(kTextPadding),
                ],
              ),
              Visibility(
                visible: isBox,
                child: Align(
                  heightFactor: 4.1,
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 2,
                        vertical: kTextPadding),
                    decoration: BoxDecoration(
                        color: AppColors.buttonSuccessColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(kTextPadding)),
                    child: const Text(
                      'Sweet! that name is available',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whiteColor),
                    ),
                  ),
                ),
              )
            ],
          ),
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormBuilderTextField(
                    name: 'Title',
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.close_rounded),
                        suffixIconColor: AppColors.buttondangerColor,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: AppColors.buttondangerColor,
                                width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: AppColors.buttondangerColor,
                                width: 1))),
                  ),
                  buildSizedBoxH(kTextPadding),
                  Visibility(
                    visible: isBox ? false : true,
                    child: const Text(
                      'Oh noes! that name is already taken',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.buttondangerColor),
                    ),
                  ),
                  buildSizedBoxH(kTextPadding),
                  const Text(
                    'Example help text that remains unchanged.',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              Visibility(
                visible: isBox,
                child: Align(
                  heightFactor: 4.1,
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 2,
                        vertical: kTextPadding),
                    decoration: BoxDecoration(
                        color: AppColors.buttondangerColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(kTextPadding)),
                    child: const Text(
                      'Oh noes! that name is already taken',
                      style:
                          TextStyle(fontSize: 12, color: AppColors.whiteColor),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
