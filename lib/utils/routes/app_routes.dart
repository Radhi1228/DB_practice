import 'package:db_practice/screens/category/view/category_screen.dart';
import 'package:db_practice/screens/entry/view/entry_screen.dart';
import 'package:db_practice/screens/home/view/home_screen.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder> app_routes = {
  '/' : (c1) => const HomeScreen(),
  '/entry' : (c1) => const EntryScreen(),
  '/category' : (c1) => const CategoryScreen(),
};