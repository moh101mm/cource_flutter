import 'package:clean_mvvm/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

import '../presentation/resources/routs_manager.dart';

class MyApp extends StatefulWidget {
 //named constructor
 MyApp._internal();
int appState =0;
//singleton or single instance
static final MyApp _instance = MyApp._internal();
// factory
factory MyApp() => _instance;


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
