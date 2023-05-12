import 'package:event_hub/event_hub.dart';
import 'package:flutter/material.dart';
import 'package:kkaebom/domain/user/model/user.dart';

import '../../data/shared_state/model/base_colors.dart';
import 'theme/colors.dart';

class SharedState {
  SharedState(this._eventHub, BaseColors color) {
    changeColor(color);
  }

  double _keyboardHeight = 0;
  double get keyboardHeight => _keyboardHeight;

  final EventHub _eventHub;
  late ColorScheme _lightModeColorScheme;
  late ColorScheme _darkModeColorScheme;
  int _bottomNavigationIndex = 0;

  ColorScheme get lightModeColorScheme => _lightModeColorScheme;
  ColorScheme get darkModeColorScheme => _darkModeColorScheme;
  int get bottomNavigationIndex => _bottomNavigationIndex;

  late User? _user;
  User? get user => _user;

  setUser(User? user) {
    _user = user;
  }

  changeColor(BaseColors color) {
    MaterialColor materialColor = _baseColorToMaterialColor(color);
    _lightModeColorScheme = ColorScheme.fromSwatch(
        primarySwatch: materialColor, backgroundColor: Colors.white);

    _darkModeColorScheme = ColorScheme.fromSwatch(
        primarySwatch: createDarkModeMaterialColor(materialColor),
        backgroundColor: Colors.black12,
        brightness: Brightness.dark);
  }

  setBottomNavigationIndex(int index) {
    _bottomNavigationIndex = index;
  }

  setKeyboardHeight(double keyboardHeight) {
    if (keyboardHeight < 0) return;
    _keyboardHeight = keyboardHeight;
  }

  MaterialColor _baseColorToMaterialColor(BaseColors baseColor) {
    switch (baseColor) {
      case BaseColors.red:
        return Colors.red;
      case BaseColors.pink:
        return Colors.pink;
      case BaseColors.purple:
        return Colors.purple;
      case BaseColors.deepPurple:
        return Colors.deepPurple;
      case BaseColors.indigo:
        return Colors.indigo;
      case BaseColors.blueGrey:
        return Colors.blueGrey;
      case BaseColors.blue:
        return Colors.blue;
      case BaseColors.lightBlue:
        return Colors.lightBlue;
      case BaseColors.cyan:
        return Colors.cyan;
      case BaseColors.teal:
        return Colors.teal;
      case BaseColors.green:
        return Colors.green;
      case BaseColors.lightGreen:
        return Colors.lightGreen;
      case BaseColors.lime:
        return Colors.lime;
      case BaseColors.yellow:
        return Colors.yellow;
      case BaseColors.amber:
        return Colors.amber;
      case BaseColors.orange:
        return Colors.orange;
      case BaseColors.deepOrange:
        return Colors.deepOrange;
    }
  }
}
