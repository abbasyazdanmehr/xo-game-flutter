import 'package:flutter/material.dart';
import 'package:xo/widgets.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 200,
              height: 20,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                ),
                child: const Text(
                  "Single Player",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/game-page');
                },
              ),
            ),
            ButtonTheme(
              minWidth: 200,
              height: 20,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                ),
                child: const Text(
                  "Multi Player",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/game-page');
                },
              ),
            ),
            ButtonTheme(
              minWidth: 200,
              height: 20,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                ),
                child: const Text(
                  "Settings",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/game-page');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
