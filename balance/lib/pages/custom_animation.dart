import 'package:flutter/material.dart';

class CustomAnimation extends PageRouteBuilder {
  final Widget page;
  final Curve curve;
  final Alignment alineacion;
  final Duration duration;

  CustomAnimation(
      {required this.page,
      this.curve = Curves.easeIn,
      this.duration = const Duration(milliseconds: 1000),
      this.alineacion = const Alignment(0, 0)})
      : super(
            transitionDuration: duration,
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
                Widget child) {
              animation = CurvedAnimation(parent: animation, curve: curve);
              return ScaleTransition(
                alignment: alineacion,
                scale: animation,
                child: child,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secAnimation) =>
                page);
}
