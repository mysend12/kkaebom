import 'package:flutter/material.dart';

import '../view/init_screen.dart';

class Routes {
  Routes._();

  static final routes = <String, WidgetBuilder>{
    InitScreen.routeName: (ctx) => InitScreen(),
  };
}