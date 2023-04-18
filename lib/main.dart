import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:kkaebom/core/di/provider_setup.dart';
import 'package:kkaebom/firebase_options.dart';
import 'package:kkaebom/main2.dart';
import 'package:kkaebom/ui/shared/routes.dart';
import 'package:kkaebom/ui/shared/shared_view_model.dart';
import 'package:provider/provider.dart';

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

  runApp(
    MultiProvider(
      providers: await getProviders(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    final sharedViewModel = context.watch<SharedViewModel>();

    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
        title: 'Flutter Demo',
        navigatorObservers: <NavigatorObserver>[observer],
        debugShowCheckedModeBanner: false,
        initialRoute: Main2.routeName,
        routes: Routes.routes,
        theme: ThemeData(
          colorScheme: lightColorScheme ??
              sharedViewModel.sharedState.lightModeColorScheme,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme ??
              sharedViewModel.sharedState.darkModeColorScheme,
          useMaterial3: true,
        ),
        themeMode: ThemeMode.light,
      );
    });
  }
}
