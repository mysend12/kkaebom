import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:kkaebom/firebase_options.dart';
import 'package:kkaebom/ui/shared/theme/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  String apiUrl = remoteConfig.getString('apiUrl');
  remoteConfig.fetchAndActivate();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
        title: 'Flutter Demo',
        navigatorObservers: <NavigatorObserver>[observer],
        debugShowCheckedModeBanner: false,
        home: Column(
          children: [
            TextButton(
              onPressed: () {
                changeBaseColor(Colors.blueGrey);
              },
              child: const Text('blueGrey'),
            ),
            TextButton(
              onPressed: () {
                changeBaseColor(Colors.blue);
              },
              child: const Text('blue'),
            ),
            TextButton(
              onPressed: () {
                changeBaseColor(Colors.red);
              },
              child: const Text('red'),
            ),
          ],
        ),
        theme: ThemeData(
          colorScheme: lightColorScheme ?? lightModeColorScheme,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme ?? darkModeColorScheme,
          useMaterial3: true,
        ),
        themeMode: ThemeMode.light,
      );
    });
  }
}
