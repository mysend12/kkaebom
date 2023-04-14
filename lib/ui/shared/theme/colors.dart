import 'package:flutter/material.dart';

MaterialColor baseColor = Colors.blueGrey;
changeBaseColor(MaterialColor color) {
  baseColor = color;
}

ColorScheme lightModeColorScheme =
    ColorScheme.fromSwatch(primarySwatch: baseColor);

ColorScheme darkModeColorScheme = ColorScheme.fromSwatch(
    primarySwatch: createDarkModeMaterialColor(baseColor),
    brightness: Brightness.dark);

// List<MaterialColor> createDarkModeColors() {
//   return Colors.accents.map(createDarkModeMaterialColor);
//
//   return null;
// }

Color invertColor(Color color) {
  final double invR = 255 - color.red.toDouble();
  final double invG = 255 - color.green.toDouble();
  final double invB = 255 - color.blue.toDouble();

  return Color.fromRGBO(invR.toInt(), invG.toInt(), invB.toInt(), 1);
}

MaterialColor createDarkModeMaterialColor(Color lightModeColor) {
  Color color = invertColor(lightModeColor);
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
