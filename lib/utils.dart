import 'package:flutter/material.dart';
import 'dart:math';

Color associatedColor(String name) {
  return Colors.primaries[Random(name.hashCode).nextInt(Colors.primaries.length)];
}
