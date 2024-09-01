import 'package:core/components/static_components/background.dart';
import 'package:flutter/cupertino.dart';

class Screen extends StatelessWidget {
  Screen({
    super.key,
    required this.child,
    this.withoutBackground = false,
  });

  bool withoutBackground;
  Widget child;

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
