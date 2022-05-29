import 'dart:math';
import 'package:flutter/material.dart';

List<MaterialColor> myColor = [
  Colors.lightBlue,
  Colors.lightGreen,
  Colors.pink,
  Colors.yellow,
  Colors.red,
  Colors.orange,
];

createRandomColor() {
  var rng = Random();
  var value = rng.nextInt(5);
  return myColor[value];
}