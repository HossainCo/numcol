import 'package:flutter/material.dart';

import '../../../styles.dart';
import '../../../core/index.dart';

class ProgressBarWidget extends StatefulWidget {
  ProgressBarWidget({Key key, @required this.timer}) : super(key: key);

  final Timer timer;

  @override
  _ProgressBarWidgetState createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> with TickerProviderStateMixin {
  void _setState() {
    setState(() => null);
  }

  @override
  void initState() {
    super.initState();
    widget.timer.controller.addListener(_setState);
  }

  @override
  Widget build(BuildContext context) {
    var animation = Tween(begin: 1.0, end: 0.0).animate(widget.timer.controller.value)
      ..addListener(() {
        setState(() => null);
      });

    var colorAnimation = ColorTween(
        begin: ScreenColors.green,
        end: ScreenColors.red,
      ).animate(widget.timer.controller.value)
      ..addListener(() {
        setState(() => null);
        });
    return Container(
      child: LinearProgressIndicator(
        value: animation.value,
        valueColor: colorAnimation,
        backgroundColor: ScreenColors.lightGrey,
      ),
    );
  }

  @override
  void dispose() {
    widget.timer.controller.removeListener(_setState);
    super.dispose();
  }
}
