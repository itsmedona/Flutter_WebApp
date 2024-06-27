import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class CommingSoonScreen extends StatefulWidget {
  const CommingSoonScreen({super.key});

  @override
  State<CommingSoonScreen> createState() => _CommingSoonScreenState();
}

class _CommingSoonScreenState extends State<CommingSoonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EntranceFader(
        child: Container(
          padding: const EdgeInsets.only(
              left: kDefaultPadding, right: kDefaultPadding),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0XFF8EC5FC), Color(0XFFE0C3FC)],
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              commingsoonImage(),
              buildSizedBoxH(kDefaultPadding * 3),
              countdown(),
              buildSizedBoxH(kDefaultPadding * 5),
              textfield(),
            ],
          ),
        ),
      ),
    );
  }

  Widget commingsoonImage() {
    return Column(
      children: [
        Assets.images.png.comingSoonImg.image(
            fit: BoxFit.fill, height: kDefaultPadding * kDefaultPadding - 10),
        buildSizedBoxH(kDefaultPadding),
        Text(
          Lang.current.letsgetstart,
          style: const TextStyle(fontSize: kDefaultPadding + kTextPadding * 2),
        ),
        buildSizedBoxH(kDefaultPadding),
        Text(
          Lang.current.itwillbesimple,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: kDefaultPadding - 2),
        ),
      ],
    );
  }

  Widget countdown() {
    return const SizedBox(
      width: 800,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  '00',
                  style: TextStyle(
                    fontSize: kDefaultPadding + 10,
                  ),
                ),
                Text(
                  'Days',
                  style: TextStyle(fontSize: kDefaultPadding - 2),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  '00',
                  style: TextStyle(
                    fontSize: kDefaultPadding + 10,
                  ),
                ),
                Text(
                  'Hours',
                  style: TextStyle(fontSize: kDefaultPadding - 2),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  '00',
                  style: TextStyle(
                    fontSize: kDefaultPadding + 10,
                  ),
                ),
                Text(
                  'Minutes',
                  style: TextStyle(
                    fontSize: kDefaultPadding - 2,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  '00',
                  style: TextStyle(
                    fontSize: kDefaultPadding + 10,
                  ),
                ),
                Text(
                  'Seconds',
                  style: TextStyle(fontSize: kDefaultPadding - 2),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget textfield() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          child: FormBuilderTextField(
            name: 'username',
            decoration: InputDecoration(
              labelText: Lang.current.enteremailaddress,
              hintText: Lang.current.enteremailaddress,
              border: const OutlineInputBorder(),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            enableSuggestions: false,
          ),
        ),
        buildSizedboxW(kDefaultPadding),
        subscribeButton(),
      ],
    );
  }

  Widget subscribeButton() {
    return Container(
      height: 50,
      width: 120,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: AppColors.buttonAltColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        Lang.current.subscribe,
        style: const TextStyle(
            fontSize: kDefaultPadding - 4, color: AppColors.whiteColor),
      ),
    );
  }
}
