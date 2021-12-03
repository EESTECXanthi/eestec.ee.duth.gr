import 'package:flutter/material.dart';

class Event {
  final String name;
  final Image banner;
  final Image logo;
  final Color color;

  Event({required this.name, required this.color})
      : banner = Image.asset("assets/$name/banner"),
        logo = Image.asset("assets/$name/logo");
}
