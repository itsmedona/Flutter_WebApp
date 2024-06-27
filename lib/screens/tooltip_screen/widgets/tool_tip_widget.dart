import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.buttonname, required this.direction})
      : super(key: key);
  final String buttonname;
  final PopoverDirection direction;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showPopover(
          context: context,
          bodyBuilder: (context) => const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Popover Title'),
                Divider(),
                Text(
                    'Sed posuere consectetur est at lobortis. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.'),
              ],
            ),
          ),
          onPop: () => print('Popover was popped!'),
          direction: direction,
          backgroundColor: Colors.white,
          width: MediaQuery.of(context).size.width / 7,
          arrowHeight: 15,
          arrowWidth: 30,
        );
      },
      child: Text(buttonname),
    );
  }
}
