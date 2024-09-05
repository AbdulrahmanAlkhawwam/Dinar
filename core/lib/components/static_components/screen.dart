import 'package:core/components/static_components/background.dart';
import 'package:flutter/cupertino.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.child,
    this.withoutBackground = false,
  });

  final bool withoutBackground;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        withoutBackground ? const SizedBox() : const Background(),
        child,
      ],
    );
  }
}
