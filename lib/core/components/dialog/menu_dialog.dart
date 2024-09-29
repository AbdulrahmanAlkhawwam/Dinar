import 'package:flutter/material.dart';

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
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: context.colors.secondary,
          width: 5,
        ),
      ),
      alignment: Alignment.center,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: Icon(Icons.close),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      text,
                      style: context.textTheme.headlineSmall,
                    )
                  ],
                ),
                const SizedBox(height: 16),
                for (var item in menu)
                  ListTile(
                    title: Text(item),
                    onTap: () => onTap(item),
                    shape: StadiumBorder(),
                    splashColor: context.colors.secondary,
                  ),
              ],
            ),
          )),
    );
  }
}
