import 'package:flutter/material.dart';

import '../../constants/styles.dart';
import '../../utils/app_context.dart';
import '../dialog/menu_dialog.dart';

class MenuButton extends StatelessWidget {
  final List<dynamic> menu;
  final Function(dynamic) onTap;
  final Widget? child;
  final String text;
  final String? selected;

  const MenuButton({
    super.key,
    required this.menu,
    required this.text,
    required this.onTap,
    this.child,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: menu.isEmpty
            ? context.gradient.fixedDisabledColor
            : context.gradient.floatColor,
        borderRadius: BorderRadius.circular(circle),
      ),
      child: Material(
        type: MaterialType.button,
        color: Colors.transparent,
        shape: const StadiumBorder(),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: menu.isEmpty
              ? context.colors.outlineVariant
              : context.colors.secondaryContainer,
          onTap: () => menu.isEmpty
              ? null
              : showDialog(
                  context: context,
                  builder: (context) => MenuDialog(
                    menu: menu,
                    onTap: onTap,
                    text: text,
                  ),
                ),
          child: Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: child ??
                        Text(
                          selected ?? text,
                          textAlign: TextAlign.start,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: menu.isEmpty
                                ? context.colors.outline
                                : context.colors.onPrimaryContainer,
                            fontSize: 18,
                          ),
                        ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: context.colors.onPrimaryContainer,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
