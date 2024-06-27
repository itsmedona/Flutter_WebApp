import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/route/app_route.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:go_router/go_router.dart';

class Error404Screen extends StatefulWidget {
  const Error404Screen({super.key});

  @override
  State<Error404Screen> createState() => _Error404ScreenState();
}

class _Error404ScreenState extends State<Error404Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: EntranceFader(
      child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0XFF8EC5FC), Color(0XFFE0C3FC)],
          )),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: errorbody(),
          ))),
    ));
  }

  Widget errorbody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.png.error404.image(
            fit: BoxFit.fill, height: kDefaultPadding * kDefaultPadding - 10),
        buildSizedBoxH(kDefaultPadding),
        Text(
          Lang.current.sorrypagenotfound,
          style: const TextStyle(fontSize: kDefaultPadding + kTextPadding * 2),
        ),
        buildSizedBoxH(kDefaultPadding),
        Text(
          Lang.current.itwillbetext,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: kDefaultPadding - 2),
        ),
        buildSizedBoxH(kDefaultPadding * 5),
        backButton()
      ],
    );
  }

  Widget backButton() {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).go(RouteUri.home);
      },
      child: Container(
        height: kDefaultPadding + kDefaultPadding + kDefaultPadding,
        width: kDefaultPadding * 10,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
            left: kDefaultPadding - 10, right: kDefaultPadding - 10),
        decoration: BoxDecoration(
            color: AppColors.buttonFocusColor,
            borderRadius: BorderRadius.circular(kDefaultPadding - 6),
            boxShadow: const [
              BoxShadow(color: AppColors.bgGreyColor, blurRadius: 2)
            ]),
        child: Text(
          Lang.current.backtodashboard,
          style: const TextStyle(
              fontSize: kDefaultPadding - 2, color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
