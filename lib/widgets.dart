import 'package:flutter/material.dart';

class Widgets {
  static appBar1() {
    return AppBar(
      title: const Text("XO Game"),
      centerTitle: true,
    );
  }

  static appBar2() {
    return AppBar(
      title: const Text("XO Game"),
      centerTitle: true,
      leading: Container(),
      actions: const [],
    );
  }

  static xIcon() {
    return Center(
      child: Image.asset(
        "assets/icons/x-icon.png",
        fit: BoxFit.cover,
      ),
    );
  }

  static oIcon() {
    return Center(
      child: Image.asset(
        "assets/icons/o-icon.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
