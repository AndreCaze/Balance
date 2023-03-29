import 'package:flutter/material.dart';

class AnimatedRoute extends PageRouteBuilder {
  final Widget widget;
  final int millisec;
  final Curve curva;
  final double valorx;
  final double valory;
  AnimatedRoute(
      {required this.widget,
      this.millisec = 1000,
      this.curva = Curves.bounceIn,
      this.valorx = 1,
      this.valory = 1})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: Duration(milliseconds: millisec),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secAnimation,
            Widget child,
          ) {
            animation = CurvedAnimation(
              parent: animation,
              curve: curva,
            );
            return ScaleTransition(
              alignment: Alignment(valorx, valory),
              scale: animation,
              child: child,
            );
          },
        );
}
