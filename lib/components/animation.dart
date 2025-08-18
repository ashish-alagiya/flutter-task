import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FadeAnimationTransition extends StatelessWidget {
  final Widget child;

  FadeAnimationTransition({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child
        .animate()
        .fadeIn(duration: 500.ms, delay: 100.ms)
        .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad);
  }
}
