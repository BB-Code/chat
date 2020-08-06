import 'package:flutter/material.dart';

class TouchCallback extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final bool isfeed;
  final Color background;

  const TouchCallback(
      {Key key,
      @required this.onPressed,
      this.isfeed: true,
      this.background: const Color(0xffd8d8d8),
      @required this.child})
      : super(key: key);

  @override
  _TouchCallbackState createState() => _TouchCallbackState();
}

class _TouchCallbackState extends State<TouchCallback> {
  Color color = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(color: color, child: widget.child),
      onTap: widget.onPressed,
      onPanDown: (d) => {
        if (widget.isfeed == false)
          setState(() {
            color = widget.background;
          })
      },
      onPanCancel: () {
        setState(() {
          color = Colors.transparent;
        });
      },
    );
  }
}
