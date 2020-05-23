import 'package:flutter/material.dart';

class FutureHelper {
  static doDelay({@required int seconds}) async {
    await Future.delayed(Duration(seconds: seconds));
  }
}
