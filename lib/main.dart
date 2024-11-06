import 'dart:developer';

import 'package:flutter/material.dart';

import './core/service_locator/service_locator.dart';
import 'app.dart';

void main() async {
  try {
    await initializeApp();
    runApp(App());
  } catch (e) {
    log("log __ ${e.runtimeType} ${e.toString()} __");
  }
}
