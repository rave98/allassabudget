import 'package:logging/logging.dart';
import 'package:flutter/material.dart';

void setupLogger() {
  /// Logger settings
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    debugPrint("${record.time.hour}:${record.time.minute}:${record.time.second},${record.time.millisecond} [${record.level}] ${record.message}");
  });
}

final logger = Logger("AAALogger");
