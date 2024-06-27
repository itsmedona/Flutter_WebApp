import 'package:animated_progress_bar/animated_progress_bar.dart';
import 'package:flutter/material.dart';

class AnimatedAppBar extends StatefulWidget {
  const AnimatedAppBar({super.key});

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  height: 150,
                  width: 150,
                  child: AnimatedProgressBar(
                    stroke: 15,
                    color: Colors.purple,
                    style: PaintingStyle.stroke,
                    percentage: 1,
                  )),
              SizedBox(
                  height: 150,
                  width: 150,
                  child: AnimatedProgressBar(
                    stroke: 12,
                    style: PaintingStyle.stroke,
                    percentage: 0.8,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
