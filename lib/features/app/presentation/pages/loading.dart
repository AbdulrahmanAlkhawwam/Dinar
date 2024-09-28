import 'package:flutter/material.dart';

import '../../../../core/utils/app_context.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearProgressIndicator(
          minHeight: MediaQuery.of(context).size.height,
          color: context.colors.onTertiaryContainer.withOpacity(0.25),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
