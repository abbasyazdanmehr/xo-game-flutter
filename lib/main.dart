import 'package:flutter/material.dart';
import 'package:xo/multi_player_page.dart';
import 'package:xo/single_player_page.dart';
import 'package:xo/menu_page.dart';
import 'package:xo/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XO Game',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/menu': (context) => const MenuPage(),
        '/single': (context) => const SinglePlayerPage(),
        '/multi': (context) => const MultiPlayerPage(),
      },
    );
  }
}
