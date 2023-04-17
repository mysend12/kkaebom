import 'package:event_hub/event_hub.dart';
import 'package:flutter/material.dart';
import 'package:kkaebom/data/shared_state/model/base_colors.dart';
import 'package:kkaebom/ui/shared/theme/colors.dart';

class SharedState {

  SharedState(this._eventHub, BaseColors color) {
    changeColor(color);
  }

  final EventHub _eventHub;
  late ColorScheme _lightModeColorScheme;
  late ColorScheme _darkModeColorScheme;
  ColorScheme get lightModeColorScheme => _lightModeColorScheme;
  ColorScheme get darkModeColorScheme => _darkModeColorScheme;

  changeColor(BaseColors color) {
    MaterialColor materialColor = _baseColorToMaterialColor(color);
    _lightModeColorScheme =
        ColorScheme.fromSwatch(primarySwatch: materialColor);

    _darkModeColorScheme = ColorScheme.fromSwatch(
        primarySwatch: createDarkModeMaterialColor(materialColor),
        brightness: Brightness.dark);
  }

  MaterialColor _baseColorToMaterialColor(BaseColors baseColor) {
    switch(baseColor) {
      case BaseColors.red: return Colors.red;
      case BaseColors.pink: return Colors.pink;
      case BaseColors.purple: return Colors.purple;
      case BaseColors.deepPurple: return Colors.deepPurple;
      case BaseColors.indigo: return Colors.indigo;
      case BaseColors.blueGrey: return Colors.blueGrey;
      case BaseColors.blue: return Colors.blue;
      case BaseColors.lightBlue: return Colors.lightBlue;
      case BaseColors.cyan: return Colors.cyan;
      case BaseColors.teal: return Colors.teal;
      case BaseColors.green: return Colors.green;
      case BaseColors.lightGreen: return Colors.lightGreen;
      case BaseColors.lime: return Colors.lime;
      case BaseColors.yellow: return Colors.yellow;
      case BaseColors.amber: return Colors.amber;
      case BaseColors.orange: return Colors.orange;
      case BaseColors.deepOrange: return Colors.deepOrange;
    }

  }

}