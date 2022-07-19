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
      appBar: Widgets.appBar2(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/icons/xo-game-ico.png',
                width: 300,
                height: 300,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                height: 50,
                child: Center(
                  child: Column(
                    children: const [
                      Text(
                        "Single Player",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text("You play O"),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/single');
              },
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                height: 50,
                child: const Center(
                  child: Text(
                    "Multi Player",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/multi');
              },
            ),
          ],
        ),
      ),
    );
  }
}
