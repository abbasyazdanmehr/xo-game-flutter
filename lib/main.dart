import 'package:flutter/material.dart';
import 'package:xo/game_page.dart';
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
        '/game-page': (context) => const GamePage(),
      },
    );
  }
}
