import 'package:Dinar/core/utils/app_context.dart';
import 'package:flutter/material.dart';

Future<dynamic> sheet({
  required BuildContext context,
  required Widget content,
}) async =>
    await showModalBottomSheet(
      context: context,
      builder: (context) => content,
      sheetAnimationStyle: AnimationStyle(
        duration: const Duration(milliseconds: 750),
        reverseDuration: const Duration(milliseconds: 750),
        curve: Curves.easeInSine,
        reverseCurve: Curves.easeOutSine,
      ),
      backgroundColor: context.colors.surface,
      isScrollControlled: true,
      useSafeArea: true,
    );
