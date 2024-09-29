import 'package:flutter/material.dart';

class TimeDialog extends StatelessWidget {
  const TimeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return TimePickerDialog(
      initialTime: TimeOfDay.now(),
    );
  }
}
