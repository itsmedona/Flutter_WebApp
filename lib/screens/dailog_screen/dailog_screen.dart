import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/widgets/card_header.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/ui_components_widget.dart/ui_components_appbar.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class DialogsScreen extends StatefulWidget {
  const DialogsScreen({Key? key}) : super(key: key);

  @override
  State<DialogsScreen> createState() => _DialogsScreenState();
}

class _DialogsScreenState extends State<DialogsScreen> {
  void _showDialog(BuildContext context, DialogType dialogType) {
    final dialog = AwesomeDialog(
      context: context,
      transitionAnimationDuration: const Duration(microseconds: 300),
      dialogType: dialogType,
      title: 'Dialog Title',
      desc: 'Dialog body...',
      width: kDialogWidth,
      btnOkOnPress: () {},
      btnCancelOnPress: () {},
    );

    dialog.show();
  }

  SimpleFontelicoProgressDialog? _dialog;

  @override
  Widget build(BuildContext context) {
    return PortalMasterLayout(
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          UIComponenetsAppBar(
            title: Lang.current.dailogs,
            subtitle: Lang.current.dailogTitle,
            icon: Assets.images.png.secured
                .image(height: kDefaultPadding * 2, fit: BoxFit.cover),
          ),
          EntranceFader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: kDefaultPadding + kTextPadding),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: CardBody(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            direction: Axis.horizontal,
                            spacing: kDefaultPadding * 2.0,
                            runSpacing: kDefaultPadding * 2.0,
                            children: [
                              ElevatedButton(
                                onPressed: () =>
                                    _showDialog(context, DialogType.info),
                                child: const Text('Info'),
                              ),
                              ElevatedButton(
                                onPressed: () => _showDialog(
                                    context, DialogType.infoReverse),
                                child: const Text('Info Reversed'),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    _showDialog(context, DialogType.warning),
                                child: const Text('Warning'),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    _showDialog(context, DialogType.error),
                                child: const Text('Error'),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    _showDialog(context, DialogType.success),
                                child: const Text('Success'),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    _showDialog(context, DialogType.question),
                                child: const Text('Question'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: CardBody(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                              direction: Axis.horizontal,
                              spacing: kDefaultPadding * 2.0,
                              runSpacing: kDefaultPadding * 2.0,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    _showDialogs(
                                        context,
                                        SimpleFontelicoProgressDialogType
                                            .normal,
                                        'Normal');
                                  },
                                  child: const Text('Normal'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _showDialogs(
                                        context,
                                        SimpleFontelicoProgressDialogType
                                            .normal,
                                        'Normal Vertical');
                                  },
                                  child: const Text('Normal Vertical'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _showDialogs(
                                        context,
                                        SimpleFontelicoProgressDialogType
                                            .normal,
                                        'Updating');
                                  },
                                  child: const Text('Updating'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _showDialogs(
                                        context,
                                        SimpleFontelicoProgressDialogType
                                            .threelines,
                                        'Three Lines');
                                  },
                                  child: const Text('Three Lines'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _showDialogs(
                                        context,
                                        SimpleFontelicoProgressDialogType
                                            .multilines,
                                        'Multilines');
                                  },
                                  child: const Text('Multilines'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _showDialogs(
                                        context,
                                        SimpleFontelicoProgressDialogType
                                            .refresh,
                                        'Refresh');
                                  },
                                  child: const Text('Refresh'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _showDialogs(
                                        context,
                                        SimpleFontelicoProgressDialogType
                                            .phoenix,
                                        'Phoenix');
                                  },
                                  child: const Text('Phoenix'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _showDialogs(
                                        context,
                                        SimpleFontelicoProgressDialogType
                                            .hurricane,
                                        'Hurricane');
                                  },
                                  child: const Text('Hurricane'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _showDialogs(
                                        context,
                                        SimpleFontelicoProgressDialogType
                                            .iphone,
                                        'Iphone');
                                  },
                                  child: const Text('Iphone'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _showDialogs(
                                        context,
                                        SimpleFontelicoProgressDialogType
                                            .custom,
                                        'Custom');
                                  },
                                  child: const Text('Custom'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _showDialogs(
                                        context,
                                        SimpleFontelicoProgressDialogType
                                            .spinner,
                                        'Spinner');
                                  },
                                  child: const Text('Spinner'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _showDialogs(
                                        context,
                                        SimpleFontelicoProgressDialogType.cog,
                                        'Cog');
                                  },
                                  child: const Text('Cog'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _showDialogs(
                                        context,
                                        SimpleFontelicoProgressDialogType.redo,
                                        'Redo');
                                  },
                                  child: const Text('Redo'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _showDialogs(
                                        context,
                                        SimpleFontelicoProgressDialogType.notch,
                                        'Notch');
                                  },
                                  child: const Text('Notch'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _showDialogs(
                                        context,
                                        SimpleFontelicoProgressDialogType
                                            .bullets,
                                        'Bullets');
                                  },
                                  child: const Text('Bullets'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _showDialogs(
                                        context,
                                        SimpleFontelicoProgressDialogType
                                            .multiHurricane,
                                        'MultiHurricane');
                                  },
                                  child: const Text('MultiHurricane'),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _showDialogs(BuildContext context, SimpleFontelicoProgressDialogType type,
      String text) async {
    _dialog ??= SimpleFontelicoProgressDialog(context: context);
    if (type == SimpleFontelicoProgressDialogType.custom) {
      _dialog!.show(
          message: text,
          type: type,
          loadingIndicator: const Text(
            'C',
            style: TextStyle(fontSize: 24.0),
          ));
    } else if (text == 'Normal Vertical') {
      _dialog!.show(
          message: text,
          type: SimpleFontelicoProgressDialogType.normal,
          hideText: false,
          indicatorColor: AppColors.buttonWarningColor);
    } else if (text == 'Updating') {
      _dialog!.show(
          message: text,
          type: SimpleFontelicoProgressDialogType.normal,
          hideText: false,
          indicatorColor: AppColors.buttonWarningColor);
      await Future.delayed(const Duration(seconds: 1));
      _dialog!.updateMessageText('Changing text');
    } else {
      _dialog!.show(
          message: text,
          type: type,
          hideText: false,
          indicatorColor: AppColors.buttonWarningColor);
    }
    await Future.delayed(const Duration(seconds: 1));
    _dialog!.hide();
  }
}
