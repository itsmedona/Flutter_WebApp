import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class MaintanenceScreen extends StatefulWidget {
  const MaintanenceScreen({super.key});

  @override
  State<MaintanenceScreen> createState() => _MaintanenceScreenState();
}

class _MaintanenceScreenState extends State<MaintanenceScreen> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: EntranceFader(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0XFF8EC5FC), Color(0XFFE0C3FC)],
            )),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  maintenenceimage(),
                  buildSizedBoxH(kDefaultPadding + kDefaultPadding),
                  maintanenceCrad(themeData)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget maintenenceimage() {
    return Column(
      children: [
        Assets.images.png.maintenance.image(
            fit: BoxFit.fill, height: kDefaultPadding * kDefaultPadding - 10),
        buildSizedBoxH(kDefaultPadding),
        Text(
          Lang.current.siteundermaintenence,
          style: const TextStyle(fontSize: kDefaultPadding + kTextPadding * 2),
        ),
        buildSizedBoxH(kDefaultPadding),
        Text(
          Lang.current.pleasecheckbackinsometime,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: kDefaultPadding - 2),
        ),
      ],
    );
  }

  Widget maintanenceCrad(ThemeData themeData) {
    return Wrap(
      alignment: WrapAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(
              top: kDefaultPadding, bottom: kDefaultPadding),
          padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              top: kDefaultPadding + kDefaultPadding,
              bottom: kDefaultPadding),
          decoration: BoxDecoration(
            color: themeData.cardColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 15,
                child: Icon(Icons.cloud_queue_rounded),
              ),
              buildSizedBoxH(kDefaultPadding),
              Text(
                Lang.current.whyisthissitedown,
                style: const TextStyle(fontSize: kDefaultPadding),
              ),
              buildSizedBoxH(kDefaultPadding),
              const Text(
                'There are many variations of passages of Lorem\nIpsum available, but the majority have suffered\nalteration.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: kDefaultPadding - 3),
              )
            ],
          ),
        ),
        buildSizedboxW(kDefaultPadding),
        Container(
          margin: const EdgeInsets.only(
              top: kDefaultPadding, bottom: kDefaultPadding),
          padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              top: kDefaultPadding + kDefaultPadding,
              bottom: kDefaultPadding),
          decoration: BoxDecoration(
            color: themeData.cardColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 15,
                child: Icon(Icons.cloud_queue_rounded),
              ),
              buildSizedBoxH(kDefaultPadding),
              Text(
                Lang.current.whatisthedowntime,
                style: const TextStyle(fontSize: kDefaultPadding),
              ),
              buildSizedBoxH(kDefaultPadding),
              const Text(
                'There are many variations of passages of Lorem\nIpsum available, but the majority have suffered\nalteration.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: kDefaultPadding - 3),
              )
            ],
          ),
        ),
        buildSizedboxW(kDefaultPadding),
        Container(
          margin: const EdgeInsets.only(
              top: kDefaultPadding, bottom: kDefaultPadding),
          padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              top: kDefaultPadding + kDefaultPadding,
              bottom: kDefaultPadding),
          decoration: BoxDecoration(
            color: themeData.cardColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 15,
                child: Icon(Icons.cloud_queue_rounded),
              ),
              buildSizedBoxH(kDefaultPadding),
              Text(
                Lang.current.doyouneedsupport,
                style: const TextStyle(fontSize: kDefaultPadding),
              ),
              buildSizedBoxH(kDefaultPadding),
              const Text(
                'There are many variations of passages of Lorem\nIpsum available, but the majority have suffered\nalteration.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: kDefaultPadding - 3),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget maintanenceCradmobile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              top: kDefaultPadding + kDefaultPadding,
              bottom: kDefaultPadding),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 15,
                child: Icon(Icons.cloud_queue_rounded),
              ),
              buildSizedBoxH(kDefaultPadding),
              Text(
                Lang.current.whyisthissitedown,
                style: const TextStyle(
                    fontSize: kDefaultPadding, color: AppColors.blackColor),
              ),
              buildSizedBoxH(kDefaultPadding),
              const Text(
                'There are many variations of passages of Lorem\nIpsum available, but the majority have suffered\nalteration.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.blackColor, fontSize: kDefaultPadding - 3),
              )
            ],
          ),
        ),
        buildSizedBoxH(kDefaultPadding),
        Container(
          padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              top: kDefaultPadding + kDefaultPadding,
              bottom: kDefaultPadding),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 15,
                child: Icon(Icons.cloud_queue_rounded),
              ),
              buildSizedBoxH(kDefaultPadding),
              Text(
                Lang.current.whatisthedowntime,
                style: const TextStyle(
                    fontSize: kDefaultPadding, color: AppColors.blackColor),
              ),
              buildSizedBoxH(kDefaultPadding),
              const Text(
                'There are many variations of passages of Lorem\nIpsum available, but the majority have suffered\nalteration.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.blackColor, fontSize: kDefaultPadding - 3),
              )
            ],
          ),
        ),
        buildSizedBoxH(kDefaultPadding),
        Container(
          padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              top: kDefaultPadding + kDefaultPadding,
              bottom: kDefaultPadding),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 15,
                child: Icon(Icons.cloud_queue_rounded),
              ),
              buildSizedBoxH(kDefaultPadding),
              Text(
                Lang.current.doyouneedsupport,
                style: const TextStyle(
                    fontSize: kDefaultPadding, color: AppColors.blackColor),
              ),
              buildSizedBoxH(kDefaultPadding),
              const Text(
                'There are many variations of passages of Lorem\nIpsum available, but the majority have suffered\nalteration.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.blackColor, fontSize: kDefaultPadding - 3),
              )
            ],
          ),
        ),
      ],
    );
  }
}
