import 'package:flutter/material.dart';
import 'package:xo_game/game_page.dart';
import 'package:xo_game/menu_page.dart';

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
      initialRoute: '/menu',
      routes: {
        '/menu': (context) => const MenuPage(),
        '/game-page': (context) => const GamePage(),
      },
    );
  }
}
