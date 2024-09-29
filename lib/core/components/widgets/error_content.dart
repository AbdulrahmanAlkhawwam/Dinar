import 'package:flutter/material.dart';

class ErrorContent extends StatelessWidget {
  final String message;
  final Widget errorMessage;

  const ErrorContent({
    super.key,
    required this.message,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          errorMessage,
          const SizedBox(height: 8),
          Text(message),
        ],
      ),
    );
  }
}
