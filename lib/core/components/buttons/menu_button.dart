import 'package:flutter/material.dart';

import '../dialog/menu_dialog.dart';
import '../../utils/app_context.dart';
import '../../constants/styles.dart';

class MenuButton extends StatelessWidget {
  /// this [menu] is the list of dynamic widget or variable which will appear
  /// when it clicked
  ///
  /// if this list is empty . so , this mean button is DISABLED
  final List<dynamic> menu;

  /// [onTap] we added for do some thing in menu dialog
  final Function(dynamic) onTap;

  /// we added [child] if you want to add Row not a Text
  /// like Icon with Text but we not support it as Item we support it as Row
  final Widget? child;

  /// this is the type of list
  final String text;

  /// this is selected item
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
