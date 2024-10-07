import 'package:flutter/material.dart';

import '../../constants/styles.dart';
import '../../utils/app_context.dart';

class MenuDialog extends StatelessWidget {
  /// [onTap] we added this function to return item which selected
  final Function(dynamic) onTap;

  /// this list is the items which you must select one of them
  final List<dynamic> menu;
  final String text;

  const MenuDialog({
    super.key,
    required this.onTap,
    required this.menu,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.colors.secondaryContainer,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(semicircle),
        borderSide: BorderSide(
          color: context.colors.secondary,
          width: border,
        ),
      ),
      alignment: Alignment.center,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                for (var item in menu)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ListTile(
                      title: Text(item),
                      onTap: () {
                        onTap(item);
                        context.pop();
                      },
                      shape: StadiumBorder(),
                      splashColor: context.colors.secondary,
                    ),
                  ),
              ],
            ),
          )),
    );
  }
}
