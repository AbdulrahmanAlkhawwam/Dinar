import 'package:Dinar/core/utils/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/res.dart';

class EmptyCard extends StatelessWidget {
  /// you should make text like this [income is] or any thing like this
  final String text;

  const EmptyCard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.colors.onSurface,
      ),
      child: Stack(children: [
        Row(
          children: [
            Column(
              children: [
                const Spacer(),
                ClipRRect(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(10)),
                    child: SvgPicture.asset(Res.emptyCard)),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Transform.rotate(
                    angle: 45 * 3.1415926535,
                    child: ClipRRect(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(10)),
                        child: SvgPicture.asset(Res.emptyCard))),
                const Spacer()
              ],
            ),
          ],
        ),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(text,
                  style: context.textTheme.titleSmall
                      ?.copyWith(color: context.colors.tertiary)),
              Text("Empty",
                  style: context.textTheme.titleSmall
                      ?.copyWith(color: context.colors.secondary)),
            ],
          ),
        )
      ]),
    );
  }
}
