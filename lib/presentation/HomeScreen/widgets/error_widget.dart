import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorAnimation extends StatelessWidget {
  const ErrorAnimation(this.animation, this.message, this.widget, {super.key});

  final String animation;
  final String message;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: LottieBuilder.asset(
            animation,
            repeat: false,
          ),
        ),
        Text(
          message,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
        widget,
      ],
    );
  }
}
