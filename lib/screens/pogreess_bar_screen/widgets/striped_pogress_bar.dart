import 'package:flutter/material.dart';

class AnimatedStripeProgressBar extends StatefulWidget {
  final double value;

  final Color backgroundColor;
  final Color progressColor;
  final double stripesWidth;
  final int stripesCount;

  const AnimatedStripeProgressBar({
    super.key,
    required this.value,
    required this.backgroundColor,
    required this.progressColor,
    required this.stripesWidth,
    required this.stripesCount,
  });

  @override
  _AnimatedStripeProgressBarState createState() =>
      _AnimatedStripeProgressBarState();
}

class _AnimatedStripeProgressBarState extends State<AnimatedStripeProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: false);
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          color: Colors.grey.shade200,
          width: double.infinity,
          height: 8,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              color: Colors.grey.shade100,
              width: double.infinity,
              height: 8,
              child: Stack(
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: widget.value,
                    child: ClipRect(
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: List.generate(widget.stripesCount, (index) {
                          final stripePosition =
                              (index / widget.stripesCount + _animation.value) %
                                  1;
                          final stripeWidth = 16.0 / widget.stripesCount;
                          final stripeColor = (stripePosition >= widget.value)
                              ? widget.backgroundColor
                              : widget.progressColor;

                          return FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: stripeWidth,
                            child: Container(
                              width: widget.stripesWidth,
                              color: stripeColor,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void startAnimation() {
    _animationController.forward(from: 0.0);
  }

  void stopAnimation() {
    _animationController.stop();
  }
}
