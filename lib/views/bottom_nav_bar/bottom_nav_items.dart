import 'package:flutter/material.dart';
import 'package:lomj/views/home_view.dart';
import 'package:lomj/views/main_view.dart';
import 'package:lomj/views/tabs/search/search_view.dart';

class NavigatorItem {
  final String label;
  final String iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem> navigatorItems = [
  NavigatorItem("Home", "assets/images/homee.png", 0, const MainView()),
  NavigatorItem("Search", "assets/images/wallet1.png", 1, const SearchView()),
  NavigatorItem("Add", "assets/images/adds.png", 2, Container()),
  NavigatorItem("Chat", "assets/images/messaging.png", 3, Container()),
  NavigatorItem("Settings", "assets/images/settings.png", 4, const HomeView()),
];
