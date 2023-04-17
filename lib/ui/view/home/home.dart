import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:kkaebom/data/shared_state/model/base_colors.dart';
import 'package:kkaebom/ui/view/home/home_view_model.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.watch<HomeViewModel>();

    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
        title: 'Flutter Demo',
        navigatorObservers: <NavigatorObserver>[observer],
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: ListView.builder(
            itemCount: BaseColors.values.length,
            itemBuilder: (BuildContext context, int index) {
              return TextButton(
                onPressed: () {
                  homeViewModel.changeColor(BaseColors.values[index]);
                },
                child: Text(BaseColors.values[index].name),
              );
            },
          ),
        ),
        theme: ThemeData(
          colorScheme: lightColorScheme ??
              homeViewModel.sharedState.lightModeColorScheme,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme:
              darkColorScheme ?? homeViewModel.sharedState.darkModeColorScheme,
          useMaterial3: true,
        ),
        themeMode: ThemeMode.light,
      );
    });
  }
}
