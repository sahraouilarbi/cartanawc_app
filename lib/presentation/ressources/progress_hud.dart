import 'package:flutter/material.dart';

class ProgressHUD extends StatelessWidget {
  const ProgressHUD({
    Key? key,
    required this.child,
    required this.isAsyncCall,
    required this.opacity,
    this.color,
    this.valueColor,
  }) : super(key: key);

  final Widget child;
  final bool isAsyncCall;
  final double opacity;
  final Color? color;
  final Animation<Color>? valueColor;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetList = <Widget>[];
    widgetList.add(child);
    if (isAsyncCall) {
      final modal = Stack(
        children: [
          Opacity(
            opacity: opacity,
            child: ModalBarrier(
              dismissible: false,
              color: color,
            ),
          ),
          const Center(
            child: CircularProgressIndicator(),
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}
