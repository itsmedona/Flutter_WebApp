import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/asset_gen/assets.gen.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class FAQSScreen extends StatefulWidget {
  const FAQSScreen({super.key});

  @override
  State<FAQSScreen> createState() => _FAQSScreenState();
}

class _FAQSScreenState extends State<FAQSScreen> {
  bool isfirstshow = true;
  bool isfsecshow = false;
  bool isthirdshow = false;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return PortalMasterLayout(
      body: EntranceFader(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              top: kDefaultPadding,
            ),
            child: faqCard(themeData),
          ),
        ),
      ),
    );
  }

  Widget faqCard(ThemeData themeData) {
    return Container(
      padding: const EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          top: kDefaultPadding,
          bottom: kDefaultPadding),
      decoration: BoxDecoration(
        color: themeData.cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            faqImage(),
            buildSizedboxW(kDefaultPadding),
            Text(
              Lang.current.cantfinde,
              style: const TextStyle(fontSize: kDefaultPadding),
            ),
            buildSizedBoxH(kDefaultPadding),
            Text(
              Lang.current.ifservallanguage,
              style: const TextStyle(fontSize: kDefaultPadding),
            ),
            buildSizedBoxH(kDefaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                emailusButton(),
                buildSizedboxW(kDefaultPadding),
                sendusButton()
              ],
            ),
            buildSizedBoxH(kDefaultPadding),
            Column(
              children: [
                genralQuestion(themeData),
                buildSizedBoxH(kDefaultPadding),
                privacyPolicy(themeData),
                buildSizedBoxH(kDefaultPadding),
                pricingandplanse(themeData)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget emailusButton() {
    return Container(
      alignment: Alignment.center,
      height: 50,
      padding:
          const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
      decoration: BoxDecoration(
          color: AppColors.buttonAltColor,
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        Lang.current.emailus,
        style: const TextStyle(
          color: AppColors.whiteColor,
          fontSize: kDefaultPadding,
        ),
      ),
    );
  }

  Widget sendusButton() {
    return Container(
      alignment: Alignment.center,
      height: 50,
      padding:
          const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(10)),
      child: Text(
        Lang.current.sendusatweet,
        style: const TextStyle(
            color: AppColors.whiteColor, fontSize: kDefaultPadding),
      ),
    );
  }

  Widget faqImage() {
    return Assets.images.png.error404.image(
        fit: BoxFit.fill, height: kDefaultPadding * kDefaultPadding - 10);
  }

  Widget genralQuestion(ThemeData themeData) {
    return Container(
      padding: const EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          top: kDefaultPadding,
          bottom: kDefaultPadding),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: themeData.canvasColor, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              isfirstshow = !isfirstshow;
              setState(() {});
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      child: Icon(Icons.question_mark_outlined),
                    ),
                    buildSizedboxW(kDefaultPadding),
                    Column(
                      children: [
                        Text(
                          Lang.current.genralquestion,
                          style: const TextStyle(fontSize: kDefaultPadding),
                        ),
                        Text(
                          Lang.current.genralquestion,
                          style: const TextStyle(fontSize: kDefaultPadding),
                        ),
                      ],
                    )
                  ],
                ),
                const Icon(Icons.keyboard_arrow_down_sharp)
              ],
            ),
          ),
          Visibility(
              visible: isfirstshow, child: buildSizedBoxH(kDefaultPadding * 5)),
          Visibility(
            visible: isfirstshow,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 15,
                          child: Icon(Icons.question_mark_outlined),
                        ),
                        buildSizedboxW(kDefaultPadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'What is Lorem Ipsum ?',
                              style: TextStyle(fontSize: kDefaultPadding),
                            ),
                            buildSizedBoxH(kDefaultPadding - 5),
                            const Text(
                              'If several languages coalesce, the grammar of the resulting\nlanguage is more simple',
                              style: TextStyle(fontSize: kDefaultPadding),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 15,
                          child: Icon(Icons.question_mark_outlined),
                        ),
                        buildSizedboxW(kDefaultPadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'What is Lorem Ipsum ?',
                              style: TextStyle(fontSize: kDefaultPadding),
                            ),
                            buildSizedBoxH(kDefaultPadding - 5),
                            const Text(
                              'If several languages coalesce, the grammar of the resulting\nlanguage is more simple',
                              style: TextStyle(fontSize: kDefaultPadding),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                buildSizedBoxH(kDefaultPadding),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      child: Icon(Icons.question_mark_outlined),
                    ),
                    buildSizedboxW(kDefaultPadding),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'What is Lorem Ipsum ?',
                          style: TextStyle(fontSize: kDefaultPadding),
                        ),
                        buildSizedBoxH(kDefaultPadding - 5),
                        const Text(
                          'If several languages coalesce, the grammar of the resulting\nlanguage is more simple',
                          style: TextStyle(fontSize: kDefaultPadding),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget privacyPolicy(ThemeData themeData) {
    return Container(
      padding: const EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          top: kDefaultPadding,
          bottom: kDefaultPadding),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: themeData.canvasColor, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              isfsecshow = !isfsecshow;
              setState(() {});
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      child: Icon(Icons.question_mark_outlined),
                    ),
                    buildSizedboxW(kDefaultPadding),
                    Column(
                      children: [
                        Text(
                          Lang.current.privacypolicy,
                          style: const TextStyle(fontSize: kDefaultPadding),
                        ),
                        Text(
                          Lang.current.privacypolicy,
                          style: const TextStyle(fontSize: kDefaultPadding),
                        ),
                      ],
                    )
                  ],
                ),
                const Icon(Icons.keyboard_arrow_down_sharp)
              ],
            ),
          ),
          Visibility(
              visible: isfsecshow, child: buildSizedBoxH(kDefaultPadding * 5)),
          Visibility(
            visible: isfsecshow,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 15,
                          child: Icon(Icons.question_mark_outlined),
                        ),
                        buildSizedboxW(kDefaultPadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'What is Lorem Ipsum ?',
                              style: TextStyle(fontSize: kDefaultPadding),
                            ),
                            buildSizedBoxH(kDefaultPadding - 5),
                            const Text(
                              'If several languages coalesce, the grammar of the resulting\nlanguage is more simple',
                              style: TextStyle(fontSize: kDefaultPadding),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 15,
                          child: Icon(Icons.question_mark_outlined),
                        ),
                        buildSizedboxW(kDefaultPadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'What is Lorem Ipsum ?',
                              style: TextStyle(fontSize: kDefaultPadding),
                            ),
                            buildSizedBoxH(kDefaultPadding - 5),
                            const Text(
                              'If several languages coalesce, the grammar of the resulting\nlanguage is more simple',
                              style: TextStyle(fontSize: kDefaultPadding),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                buildSizedBoxH(kDefaultPadding),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      child: Icon(Icons.question_mark_outlined),
                    ),
                    buildSizedboxW(kDefaultPadding),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'What is Lorem Ipsum ?',
                          style: TextStyle(fontSize: kDefaultPadding),
                        ),
                        buildSizedBoxH(kDefaultPadding - 5),
                        const Text(
                          'If several languages coalesce, the grammar of the resulting\nlanguage is more simple',
                          style: TextStyle(fontSize: kDefaultPadding),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget pricingandplanse(ThemeData themeData) {
    return Container(
      padding: const EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          top: kDefaultPadding,
          bottom: kDefaultPadding),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: themeData.canvasColor, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              isthirdshow = !isthirdshow;
              setState(() {});
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      child: Icon(Icons.question_mark_outlined),
                    ),
                    buildSizedboxW(kDefaultPadding),
                    Column(
                      children: [
                        Text(
                          Lang.current.pricingplanse,
                          style: const TextStyle(fontSize: kDefaultPadding),
                        ),
                        Text(
                          Lang.current.pricingplanse,
                          style: const TextStyle(fontSize: kDefaultPadding),
                        ),
                      ],
                    )
                  ],
                ),
                const Icon(Icons.keyboard_arrow_down_sharp)
              ],
            ),
          ),
          Visibility(
              visible: isthirdshow, child: buildSizedBoxH(kDefaultPadding * 5)),
          Visibility(
            visible: isthirdshow,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 15,
                          child: Icon(Icons.question_mark_outlined),
                        ),
                        buildSizedboxW(kDefaultPadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'What is Lorem Ipsum ?',
                              style: TextStyle(fontSize: kDefaultPadding),
                            ),
                            buildSizedBoxH(kDefaultPadding - 5),
                            const Text(
                              'If several languages coalesce, the grammar of the resulting\nlanguage is more simple',
                              style: TextStyle(fontSize: kDefaultPadding),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 15,
                          child: Icon(Icons.question_mark_outlined),
                        ),
                        buildSizedboxW(kDefaultPadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'What is Lorem Ipsum ?',
                              style: TextStyle(fontSize: kDefaultPadding),
                            ),
                            buildSizedBoxH(kDefaultPadding - 5),
                            const Text(
                              'If several languages coalesce, the grammar of the resulting\nlanguage is more simple',
                              style: TextStyle(fontSize: kDefaultPadding),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                buildSizedBoxH(kDefaultPadding),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      child: Icon(Icons.question_mark_outlined),
                    ),
                    buildSizedboxW(kDefaultPadding),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'What is Lorem Ipsum ?',
                          style: TextStyle(fontSize: kDefaultPadding),
                        ),
                        buildSizedBoxH(kDefaultPadding - 5),
                        const Text(
                          'If several languages coalesce, the grammar of the resulting\nlanguage is more simple',
                          style: TextStyle(fontSize: kDefaultPadding),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
