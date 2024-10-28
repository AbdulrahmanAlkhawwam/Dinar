import 'package:flutter/material.dart';

class DateDialog extends StatelessWidget {
  const DateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DatePickerDialog(
      /// this first date is year 2000
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    );
  }
}
