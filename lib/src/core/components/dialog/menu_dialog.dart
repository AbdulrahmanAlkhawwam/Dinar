import 'package:flutter/material.dart';

class MenuDialog extends StatelessWidget {
  const MenuDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.red,
      child: Column(
        children: [
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
        ],
      ),
    );
  }
}
