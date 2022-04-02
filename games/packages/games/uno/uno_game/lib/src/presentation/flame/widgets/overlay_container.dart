import 'package:flutter/material.dart';

class OverlayContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Color? backgroundColor;
  final Gradient? gradient;
  final Color? borderColor;

  const OverlayContainer({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
    this.gradient,
    this.backgroundColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        color: backgroundColor ?? Colors.deepOrange,
        border: Border.all(color: borderColor ?? Colors.white, width: 4),
        borderRadius: BorderRadius.circular(10),
      ),
      height: height,
      width: width,
      child: child,
    );
  }
}
