import 'package:flutter/material.dart';

import '../../../../core/utils/app_context.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: LinearProgressIndicator(
            minHeight: double.infinity ,
            color: context.colors.onTertiaryContainer.withOpacity(0.25),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
