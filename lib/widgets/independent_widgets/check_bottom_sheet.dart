import 'package:Dinar/manager/general/general_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/category.dart';
import 'package:core/components/dynamic_components/secondary_button.dart';
import 'package:core/components/dynamic_components/edition_text_button.dart';
import 'package:core/styles/colors/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/kind.dart';
import '../../models/wallet.dart';

class CheckBottomSheet extends StatelessWidget {
  const CheckBottomSheet({
    super.key,
    required this.type,
    required this.category,
    required this.wallet,
  });

  final String type;
  final Category? category;

  final Wallet? wallet;

  @override
  Widget build(BuildContext context) {
    final Kind kind = context.read<GeneralBloc>().kind;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom + 32,
        top: 32,
        left: 24,
        right: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                "assets/local_assets/svgs/task_alt.svg",
                width: 32,
                height: 32,
                alignment: AlignmentDirectional.center,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            "Create your $type",
            style: TextStyle(
              color: MainColors.darkTeal,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        "Are you sure you want to add new ${kind.name == Kind.twice.name ? Kind.category.name : kind.name} with ",
                    style: TextStyle(
                      color: MainColors.darkTeal,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: kind != Kind.wallet ? category?.name : wallet?.name,
                    style: TextStyle(
                        color:
                            kind != Kind.wallet && category?.type == "income" ||
                                    kind == Kind.wallet
                                ? MainColors.forestGreen
                                : MainColors.redwood,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: kind == Kind.wallet ? " as name " : " as name and ",
                    style: TextStyle(
                      color: MainColors.darkTeal,
                      fontSize: 16,
                    ),
                  ),
                  kind != Kind.wallet
                      ? TextSpan(
                          text: category?.type,
                          style: TextStyle(
                              color: category?.type == "income"
                                  ? MainColors.forestGreen
                                  : MainColors.redwood,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      : const TextSpan(),
                  kind != Kind.wallet
                      ? TextSpan(
                          text: " as type",
                          style: TextStyle(
                            color: MainColors.darkTeal,
                            fontSize: 16,
                          ),
                        )
                      : const TextSpan(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          SecondaryButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          const SizedBox(height: 16),
          EditionTextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        ],
      ),
    );
  }
}
