import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(double size, [Color? color, FontWeight? fw]) {
  return TextStyle(
      fontSize: size, fontFamily: 'Comfortaa', color: color, fontWeight: fw);
}

List selectableTimes = [
  "300",
  "600",
  "900",
  "1200",
  "1500",
  "1800",
  "2100",
  "2400",
  "2700",
  "3000",
  "3300",
];

Color renderColor(String currentState) {
  if (currentState == "FOCUS") {
    return Colors.white;
  } else {
    return Colors.white;
  }
}

Color renderForestColor(String currentState) {
  if (currentState == "FOCUS") {
    return Color.fromARGB(255, 13, 71, 161);
  } else {
    return Colors.blue.withOpacity(0.3);
  }
}
