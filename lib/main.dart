import 'package:flutter/material.dart';
import 'package:netfixclone_app/screens/bottomnavigationscreen.dart';
import 'package:netfixclone_app/screens/splash_screem.dart';
import 'package:netfixclone_app/services/tmdbservies.dart';
import 'package:netfixclone_app/viewmodels/homeviewmodel.dart';
import 'package:netfixclone_app/viewmodels/searchmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(
      create: (_) => Homeviewmodel(),
    ),

    ChangeNotifierProvider(
      create: (_) => SearchViewModel(),
    ),
  ],

    child: const NetfixApp(),
  ));
}

class NetfixApp extends StatelessWidget {
  const NetfixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const SplashScreen()
    );
  }
}