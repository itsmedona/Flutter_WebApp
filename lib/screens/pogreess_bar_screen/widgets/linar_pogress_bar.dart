import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';

class LinearProgressIndicatorClass extends StatefulWidget {
  final Color backgroundcolor;

  const LinearProgressIndicatorClass(
      {super.key, required this.backgroundcolor});
  @override
  _LinearProgressIndicatorClassState createState() =>
      _LinearProgressIndicatorClassState();
}

class _LinearProgressIndicatorClassState
    extends State<LinearProgressIndicatorClass> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Center(
          child: loading
              ? LinearProgressIndicator(
                  backgroundColor: Colors.grey.shade100,
                  minHeight: kDefaultPadding / 2,
                  color: widget.backgroundcolor,
                )
              : const SizedBox.shrink()),
    );
  }
}
