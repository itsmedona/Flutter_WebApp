import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;

  const CustomCard(
      {super.key,
      this.color,
      this.padding,
      required this.child,
      this.height,
      this.width});
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            color: color ?? themeData.cardColor),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(12.0),
          child: child,
        ));
  }
}
