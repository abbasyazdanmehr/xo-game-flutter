import 'package:flutter/material.dart';
import 'package:xo_game/widgets.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.appBar1(),
      body: Center(
        child: ElevatedButton(
          child: const Text("New Game"),
          onPressed: () {
            Navigator.pushNamed(context, '/game-page');
          },
        ),
      ),
    );
  }
}
