import 'package:flutter/material.dart';
import 'package:flutter_animated_progress_bar/flutter_animated_progress_bar.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';

class PogressbarWithToolTip extends StatefulWidget {
  const PogressbarWithToolTip({
    super.key,
    required this.backgroundColor,
  });
  final Color backgroundColor;

  @override
  State<PogressbarWithToolTip> createState() => _PogressbarWithToolTipState();
}

class _PogressbarWithToolTipState extends State<PogressbarWithToolTip>
    with TickerProviderStateMixin {
  late final ProgressBarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ProgressBarController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressBar(
      collapsedProgressBarColor: widget.backgroundColor,
      expandedBufferedBarColor: widget.backgroundColor,
      barCapShape: BarCapShape.round,
      controller: _controller,
      progress: const Duration(seconds: 30),
      buffered: const Duration(seconds: 35),
      total: const Duration(minutes: 2),
      expandedBarHeight: kDefaultPadding,
      progressBarIndicator: ProgressBarIndicator.none,
      onSeek: (position) {},
    );
  }
}

class PogressbarWith extends StatefulWidget {
  const PogressbarWith({
    super.key,
    required this.backgroundColor,
  });
  final Color backgroundColor;

  @override
  State<PogressbarWith> createState() => _PogressbarWithState();
}

class _PogressbarWithState extends State<PogressbarWith>
    with TickerProviderStateMixin {
  late final ProgressBarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ProgressBarController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressBar(
      collapsedProgressBarColor: widget.backgroundColor,
      expandedBufferedBarColor: widget.backgroundColor,
      barCapShape: BarCapShape.round,
      controller: _controller,
      progress: const Duration(seconds: 30),
      buffered: const Duration(seconds: 35),
      total: const Duration(minutes: 2),
      expandedBarHeight: kDefaultPadding,
      progressBarIndicator: ProgressBarIndicator.none,
      onChangeEnd: (value) {
        setState(() {});
      },
      onSeek: (position) {},
    );
  }
}
