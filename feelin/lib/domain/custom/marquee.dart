import 'package:flutter/material.dart';

import 'measure_size.dart';

class Marquee extends StatefulWidget {
  final Widget child;
  final Axis direction;
  final Duration animationDuration, backDuration, pauseDuration;

  const Marquee({
    Key? key,
    required this.child,
    this.direction = Axis.horizontal,
    this.animationDuration = const Duration(milliseconds: 3000),
    this.backDuration = const Duration(milliseconds: 3000),
    this.pauseDuration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  _MarqueeState createState() => _MarqueeState();
}

class _MarqueeState extends State<Marquee> {
  late ScrollController scrollController;
  late Duration animationDuration, backDuration;
  @override
  void initState() {
    scrollController = ScrollController(initialScrollOffset: 0);
    WidgetsBinding.instance.addPostFrameCallback(scroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: widget.direction,
      controller: scrollController,
      physics: const NeverScrollableScrollPhysics(),
      child: MeasureSize(onChange: (size){
        setState(() {
          animationDuration = Duration(milliseconds: 1000+(size.width.floor()-300) * 15);
          backDuration = animationDuration;
        });
      } ,child: widget.child),
    );
  }

  void scroll(_) async {
    while (scrollController.hasClients) {
      await Future.delayed(widget.pauseDuration);
      if (scrollController.hasClients) {
        await scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: animationDuration,
          curve: Curves.linear,
        );
      }
      await Future.delayed(widget.pauseDuration);
      if (scrollController.hasClients) {
        await scrollController.animateTo(
          0.0,
          duration: backDuration,
          curve: Curves.easeOut,
        );
      }
    }
  }
}