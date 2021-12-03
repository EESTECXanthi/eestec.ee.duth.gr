import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class EventCategory {
  final String name;
  final Color color;
  final String desc;

  const EventCategory(
      {required this.name, required this.color, required this.desc});
}

const List<EventCategory> categories = [
  EventCategory(
      name: "Soft Skill Academy",
      color: Color.fromRGBO(154, 33, 100, 1),
      desc: "LOREM"),
  EventCategory(
      name: "EESTech Challenge",
      color: Color.fromRGBO(82, 189, 233, 1),
      desc: "LOREM"),
];
