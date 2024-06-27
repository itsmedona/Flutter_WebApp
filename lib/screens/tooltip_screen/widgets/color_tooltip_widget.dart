import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:popover/popover.dart';

class ColorToolTipButton extends StatelessWidget {
  const ColorToolTipButton(
      {Key? key,
      required this.buttonname,
      required this.direction,
      required this.color})
      : super(key: key);
  final String buttonname;
  final PopoverDirection direction;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
        onPressed: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    buttonname,
                    style: const TextStyle(color: AppColors.whiteColor),
                  ),
                  const Divider(
                    color: AppColors.whiteColor,
                  ),
                  const Text(
                    'Sed posuere consectetur est at lobortis. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.',
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ],
              ),
            ),
            onPop: () => print('Popover was popped!'),
            direction: direction,
            backgroundColor: color,
            width: MediaQuery.of(context).size.width / 7,
            arrowHeight: 15,
            arrowWidth: 30,
          );
        },
        child: Text(buttonname));
  }
}
