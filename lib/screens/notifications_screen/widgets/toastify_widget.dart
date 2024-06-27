import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/screens/notifications_screen/widgets/toast_widget.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:toastification/toastification.dart';

class ToastifyCard extends StatefulWidget {
  final String title;

  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final double width;

  const ToastifyCard({
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
    required this.width,
  }) : super(key: key);

  @override
  State<ToastifyCard> createState() => _ToastifyCardState();
}

class _ToastifyCardState extends State<ToastifyCard> {
  BestTutorSite site = BestTutorSite.info;
  final ValueNotifier<ToastificationAnimationBuilder?> animationBuilder =
      ValueNotifier(null);
  dynamic buildAnimation;

  final messageController = TextEditingController();
  final titleController = TextEditingController();
  final delayController = TextEditingController();
  List<String> selectedOptions = [
    'option 1',
    'option 2',
    'option3',
    'option 4',
    'option 5'
  ];
  bool showpogressbar = true;
  bool showclosebutton = true;
  // List<String> newSelectedOptions = ['true', 'true'];

  void handleCheckboxGroupChange(List<String> newSelectedOptions) {
    setState(() {
      selectedOptions = newSelectedOptions;
      showpogressbar = selectedOptions.isEmpty;
      showclosebutton = selectedOptions.isEmpty;
      // Additional logic or actions based on the checkbox group's state can be performed here
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final mediaQueryData = MediaQuery.of(context);
    final textTheme = Theme.of(context).textTheme;

    return StatefulBuilder(
      builder: (context, setState) => SizedBox(
        width: widget.width,
        child: Card(
          clipBehavior: Clip.antiAlias,
          color: themeData.cardColor,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: textTheme.labelLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const Divider(),
                    buildSizedBoxH(kDefaultPadding),
                    _buildRowcontent(textTheme, setState, mediaQueryData),
                    ValueListenableBuilder<ToastificationAnimationBuilder?>(
                      valueListenable: animationBuilder,
                      builder: (context, value, _) {
                        buildAnimation = value;
                        return AnimationButtons(
                          onChange: (selectedValue) {
                            animationBuilder.value = selectedValue;
                          },
                          callback: () {
                            setState(() {});
                          },
                        );
                      },
                    ),
                    const Divider(),
                    buildSizedBoxH(kDefaultPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              if (site == BestTutorSite.info) {
                                toastification.showInfo(
                                  animationBuilder: buildAnimation,
                                  showProgressBar: showpogressbar,
                                  showCloseButton: showclosebutton,
                                  context: context,
                                  title: titleController.text.isEmpty
                                      ? 'Info'
                                      : titleController.text,
                                  autoCloseDuration: const Duration(seconds: 5),
                                  animationDuration: Duration(
                                      milliseconds: int.parse(
                                          delayController.text.isEmpty
                                              ? '300'
                                              : delayController.text)),
                                  description: messageController.text.isEmpty
                                      ? 'Add Your Message Here'
                                      : messageController.text,
                                );
                              } else if (site == BestTutorSite.success) {
                                toastification.showSuccess(
                                  showProgressBar: showpogressbar,
                                  showCloseButton: showclosebutton,
                                  context: context,
                                  autoCloseDuration: const Duration(seconds: 5),
                                  animationBuilder: buildAnimation,
                                  title: titleController.text.isEmpty
                                      ? 'Success'
                                      : titleController.text,
                                  animationDuration: Duration(
                                      milliseconds: int.parse(
                                          delayController.text.isEmpty
                                              ? '300'
                                              : delayController.text)),
                                  description: messageController.text.isEmpty
                                      ? 'Add Your Message Here'
                                      : messageController.text,
                                );
                              } else if (site == BestTutorSite.warning) {
                                toastification.showWarning(
                                  showProgressBar: showpogressbar,
                                  showCloseButton: showclosebutton,
                                  context: context,
                                  autoCloseDuration: const Duration(seconds: 5),
                                  animationBuilder: buildAnimation,
                                  animationDuration: Duration(
                                      milliseconds: int.parse(
                                          delayController.text.isEmpty
                                              ? '300'
                                              : delayController.text)),
                                  title: titleController.text.isEmpty
                                      ? 'Warning'
                                      : titleController.text,
                                  description: messageController.text.isEmpty
                                      ? 'Add Your Message Here'
                                      : messageController.text,
                                );
                              } else if (site == BestTutorSite.error) {
                                toastification.showError(
                                  showProgressBar: showpogressbar,
                                  showCloseButton: showclosebutton,
                                  context: context,
                                  autoCloseDuration: const Duration(seconds: 5),
                                  animationBuilder: buildAnimation,
                                  animationDuration: Duration(
                                      milliseconds: int.parse(
                                          delayController.text.isEmpty
                                              ? '300'
                                              : delayController.text)),
                                  title: titleController.text.isEmpty
                                      ? 'Error'
                                      : titleController.text,
                                  description: messageController.text.isEmpty
                                      ? 'Add Your Message Here'
                                      : messageController.text,
                                );
                              } else if (site == BestTutorSite.defaultt) {
                                toastification.show(
                                  showProgressBar: showpogressbar,
                                  showCloseButton: showclosebutton,
                                  context: context,
                                  autoCloseDuration: const Duration(seconds: 5),
                                  animationBuilder: buildAnimation,
                                  animationDuration: Duration(
                                      milliseconds: int.parse(
                                          delayController.text.isEmpty
                                              ? '300'
                                              : delayController.text)),
                                  title: titleController.text.isEmpty
                                      ? 'Default'
                                      : titleController.text,
                                  description: messageController.text.isEmpty
                                      ? 'Add Your Message Here'
                                      : messageController.text,
                                );
                              }
                            },
                            child: const Text('Show Toast'))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRowcontent(
    TextTheme textTheme,
    StateSetter setState,
    MediaQueryData mediaQueryData,
  ) {
    return Wrap(
      children: [
        SizedBox(
          width: mediaQueryData.size.width >= kScreenWidthLg
              ? MediaQuery.of(context).size.width / 4
              : MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitle('Toast Type', textTheme),
              _buildradiobutton('info', BestTutorSite.info, setState),
              _buildradiobutton('success', BestTutorSite.success, setState),
              _buildradiobutton('warning', BestTutorSite.warning, setState),
              _buildradiobutton('error', BestTutorSite.error, setState),
              _buildradiobutton('default', BestTutorSite.defaultt, setState),
            ],
          ),
        ),
        SizedBox(
          width: mediaQueryData.size.width >= kScreenWidthLg
              ? MediaQuery.of(context).size.width / 4
              : MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitle('Options', textTheme),
              FormBuilderCheckboxGroup(
                name: 'checkbox_group_vertical',
                activeColor: AppColors.primaryColor,
                orientation: OptionsOrientation.vertical,
                onChanged: (value) {
                  handleCheckboxGroupChange(value!);
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                options: const [
                  FormBuilderFieldOption(
                      value: 'option 1', child: Text('Hide close button')),
                  FormBuilderFieldOption(
                      value: 'option 2',
                      child: Text('Hide progress bar(less fanciness!)')),
                  FormBuilderFieldOption(
                      value: 'option 3', child: Text('Close on click')),
                  FormBuilderFieldOption(
                      value: 'option 4', child: Text('Pause delay on hover')),
                  FormBuilderFieldOption(
                      value: 'option 5',
                      child: Text('Allow to drag and close the toast')),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: mediaQueryData.size.width >= kScreenWidthLg
              ? MediaQuery.of(context).size.width / 4
              : MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTitle('Text Message', textTheme),
                  buildSizedBoxH(kDefaultPadding),
                  FormBuilderTextField(
                    maxLength: 100,
                    name: 'Title',
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      hintText: 'Add Your Title Here',
                      border: OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    validator: FormBuilderValidators.required(),
                  ),
                  FormBuilderTextField(
                    maxLines: 2,
                    maxLength: 100,
                    name: 'Message',
                    controller: messageController,
                    decoration: const InputDecoration(
                      labelText: 'Message',
                      hintText: 'Add Your Message Here',
                      border: OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    validator: FormBuilderValidators.required(),
                  ),
                  FormBuilderTextField(
                    name: 'Delay',
                    controller: delayController,
                    maxLength: 4,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Delay',
                      hintText: 'Add Your Delay Time Here in Miliseconds',
                      border: OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    validator: FormBuilderValidators.required(),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTitle(String title, TextTheme textTheme) {
    return Text(
      title,
      style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
    );
  }

  Widget _buildradiobutton(
    String title,
    dynamic value,
    StateSetter setState,
  ) {
    return ListTile(
      title: Text(title),
      leading: Radio(
        activeColor: AppColors.primaryColor,
        value: value,
        groupValue: site,
        onChanged: (value) {
          setState(() {
            site = value;
            log(site.toString());
          });
        },
      ),
    );
  }
}

enum BestTutorSite { info, success, warning, error, defaultt }
