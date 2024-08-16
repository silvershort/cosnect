import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainContainer extends HookWidget {
  const MainContainer({
    Key? key,
    required this.child,
    this.padding,
  }) : super(key: key);
  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    const double angle = 0.1;

    // 2개의 컨테이너를 기울여서 겹쳐서 종이가 겹친듯한 느낌을 줌
    return AspectRatio(
      aspectRatio: 1,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiaryContainer.withAlpha(150),
          ),
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          child: Transform.rotate(
            angle: -angle,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer.withAlpha(150),
              ),
              padding: padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              alignment: Alignment.center,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
