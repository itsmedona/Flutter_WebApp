import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:toastification/toastification.dart';
// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/tap_bounce_container.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';

// class ToastifyWidget extends StatefulWidget {
//   const ToastifyWidget({Key? key}) : super(key: key);

//   @override
//   ToastifyWidgetState createState() => ToastifyWidgetState();
// }

// class ToastifyWidgetState extends State<ToastifyWidget> {
//   late AnimationController localAnimationController;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             child: TapBounceContainer(
//               onTap: () {
//                 showTopSnackBar(
//                   snackBarPosition: SnackBarPosition.bottom,
//                   Overlay.of(context),
//                   const CustomSnackBar.info(
//                     message:
//                         'There is some information. You need to do something with that',
//                   ),
//                 );
//               },
//               child: buildButton(context, 'Show info'),
//             ),
//           ),
//           const SizedBox(height: 24),
//           TapBounceContainer(
//             onTap: () {
//               showTopSnackBar(
//                 Overlay.of(context),
//                 const CustomSnackBar.success(
//                   message:
//                       'Good job, your release is successful. Have a nice day',
//                 ),
//               );
//             },
//             child: buildButton(context, 'Show success'),
//           ),
//           const SizedBox(height: 24),
//           TapBounceContainer(
//             onTap: () {
//               showTopSnackBar(
//                 Overlay.of(context),
//                 const CustomSnackBar.error(
//                   message:
//                       'Something went wrong. Please check your credentials and try again',
//                 ),
//               );
//             },
//             child: buildButton(context, 'Show error'),
//           ),
//           const SizedBox(height: 48),
//           TapBounceContainer(
//             onTap: () {
//               showTopSnackBar(
//                 Overlay.of(context),
//                 const CustomSnackBar.info(
//                   message: 'Persistent SnackBar',
//                 ),
//                 persistent: true,
//                 onAnimationControllerInit: (controller) {
//                   localAnimationController = controller;
//                 },
//               );
//             },
//             child: buildButton(context, 'Show persistent SnackBar'),
//           ),
//           const SizedBox(height: 24),
//           TapBounceContainer(
//             onTap: () => localAnimationController.reverse(),
//             child: buildButton(context, 'Dismiss persistent SnackBar'),
//           ),
//           const SizedBox(height: 24),
//           TapBounceContainer(
//             onTap: () {
//               showTopSnackBar(
//                 Overlay.of(context),
//                 const CustomSnackBar.info(
//                   message: 'Try to swipe me left',
//                 ),
//                 dismissType: DismissType.onSwipe,
//                 dismissDirection: [DismissDirection.endToStart],
//               );
//             },
//             child: buildButton(
//               context,
//               'Show swiped dismissible SnackBar',
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Container buildButton(BuildContext context, String text) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Theme.of(context).primaryColor,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.4),
//             spreadRadius: 6,
//             blurRadius: 10,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
//         child: Center(
//           child: Text(
//             text,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class Toastifywidget extends StatefulWidget {
  const Toastifywidget({super.key});

  @override
  State<Toastifywidget> createState() => _ToastifywidgetState();
}

class _ToastifywidgetState extends State<Toastifywidget> {
  ValueNotifier<ToastificationAnimationBuilder?> animationBuilder =
      ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: ValueListenableBuilder<ToastificationAnimationBuilder?>(
          valueListenable: animationBuilder,
          builder: (context, value, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ToastificationButtons(animationBuilder: value),
                AnimationButtons(
                  onChange: (selectedValue) {
                    animationBuilder.value = selectedValue;
                  },
                  callback: () {
                    setState(() {});
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class AnimationButtons extends StatefulWidget {
  const AnimationButtons({
    super.key,
    required this.onChange,
    required this.callback,
  });
  final VoidCallback callback;

  final ValueChanged<ToastificationAnimationBuilder?> onChange;

  @override
  State<AnimationButtons> createState() => _AnimationButtonsState();
}

class _AnimationButtonsState extends State<AnimationButtons> {
  bool isdefault = false;
  bool isfade = false;
  bool isslide = false;
  bool isscale = false;
  bool isrotate = false;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: kDefaultPadding,
      children: <Widget>[
        const SizedBox(height: 16),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff1976d2),
            minimumSize: const Size(150, 40),
          ),
          onPressed: () {
            widget.onChange(null);
            isdefault = true;
            isfade = false;
            isslide = false;
            isscale = false;
            isrotate = false;
            widget.callback();
            setState(() {});
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(visible: isdefault, child: const Icon(Icons.check)),
              buildSizedboxW(kTextPadding),
              const Text('Default'),
            ],
          ),
        ),
        buildSizedboxW(kDefaultPadding),
        const SizedBox(height: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: const Size(150, 40),
          ),
          onPressed: () {
            widget.onChange(
              (context, animation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            );
            isdefault = false;
            isfade = true;
            isslide = false;
            isscale = false;
            isrotate = false;
            widget.callback();
            setState(() {});
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(visible: isfade, child: const Icon(Icons.check)),
              buildSizedboxW(kTextPadding),
              const Text('Fade'),
            ],
          ),
        ),
        buildSizedboxW(kDefaultPadding),
        const SizedBox(height: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amberAccent,
            minimumSize: const Size(150, 40),
          ),
          onPressed: () {
            widget.onChange(
              (context, animation, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: const Offset(0, 0),
                  ).animate(animation),
                  child: child,
                );
              },
            );
            isdefault = false;
            isfade = false;
            isslide = true;
            isscale = false;
            isrotate = false;
            widget.callback();
            setState(() {});
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(visible: isslide, child: const Icon(Icons.check)),
              buildSizedboxW(kTextPadding),
              const Text('Slide'),
            ],
          ),
        ),
        buildSizedboxW(kDefaultPadding),
        const SizedBox(height: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: const Size(150, 40),
          ),
          onPressed: () {
            widget.onChange((context, animation, child) {
              return ScaleTransition(scale: animation, child: child);
            });
            isdefault = false;
            isfade = false;
            isslide = false;
            isscale = true;
            isrotate = false;
            widget.callback();
            setState(() {});
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(visible: isscale, child: const Icon(Icons.check)),
              buildSizedboxW(kTextPadding),
              const Text('Scale'),
            ],
          ),
        ),
        buildSizedboxW(kDefaultPadding),
        const SizedBox(height: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            minimumSize: const Size(150, 40),
          ),
          onPressed: () {
            widget.onChange((context, animation, child) {
              return RotationTransition(
                turns: animation,
                child: child,
              );
            });
            isdefault = false;
            isfade = false;
            isslide = false;
            isscale = false;
            isrotate = true;
            widget.callback();
            setState(() {});
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(visible: isrotate, child: const Icon(Icons.check)),
              buildSizedboxW(kTextPadding),
              const Text('Rotate'),
            ],
          ),
        ),
      ],
    );
  }
}

class AnimationverticalButtons extends StatelessWidget {
  const AnimationverticalButtons({
    super.key,
    required this.onChange,
  });

  final ValueChanged<ToastificationAnimationBuilder?> onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const SizedBox(height: 16),
        Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1976d2),
                minimumSize: const Size(150, 40),
              ),
              onPressed: () {
                onChange(null);
              },
              child: const Text('Default'),
            ),
            buildSizedboxW(kDefaultPadding),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(150, 40),
              ),
              onPressed: () {
                onChange(
                  (context, animation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                );
              },
              child: const Text('Fade'),
            ),
            buildSizedboxW(kDefaultPadding),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amberAccent,
                minimumSize: const Size(150, 40),
              ),
              onPressed: () {
                onChange(
                  (context, animation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: const Offset(0, 0),
                      ).animate(animation),
                      child: child,
                    );
                  },
                );
              },
              child: const Text('Slide'),
            ),
            buildSizedboxW(kDefaultPadding),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(150, 40),
              ),
              onPressed: () {
                onChange((context, animation, child) {
                  return ScaleTransition(scale: animation, child: child);
                });
              },
              child: const Text('Scale'),
            ),
          ],
        ),
        Row(
          children: [
            buildSizedboxW(kDefaultPadding),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(150, 40),
              ),
              onPressed: () {
                onChange((context, animation, child) {
                  return RotationTransition(
                    turns: animation,
                    child: child,
                  );
                });
              },
              child: const Text('Rotate'),
            ),
          ],
        )
      ],
    );
  }
}
