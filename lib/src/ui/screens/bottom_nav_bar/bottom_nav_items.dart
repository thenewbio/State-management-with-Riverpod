import 'package:flutter/material.dart';

class NavigatorItem {
  final String label;
  final String iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem> navigatorItems = [
  NavigatorItem("Home", "assets/homee.png", 0, Container()),
  NavigatorItem("Wallet", "assets/wallet1.png", 1, Container()),
  NavigatorItem("Add", "assets/adds.png", 2, Container()),
  NavigatorItem("Chat", "assets/messaging.png", 3, Container()),
  NavigatorItem("Settings", "assets/settings.png", 4, Container()),
];
