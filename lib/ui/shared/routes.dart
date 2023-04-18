import 'package:flutter/material.dart';
import 'package:kkaebom/main2.dart';
import 'package:kkaebom/ui/view/home/home.dart';

class Routes {
  Routes._();

  static final routes = <String, WidgetBuilder>{
    Home.routeName: (ctx) => Home(),
    Main2.routeName: (ctx) => Main2(),

  };
}