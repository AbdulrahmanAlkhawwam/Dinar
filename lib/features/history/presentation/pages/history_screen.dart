import 'package:flutter/material.dart';

import '../../../../core/utils/app_context.dart';
import '../../../operations/presentation/pages/operations_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("Operations"),
      ),
      body: OperationsScreen(),
    );
  }
}
