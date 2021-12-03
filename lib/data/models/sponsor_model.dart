import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SponsorModel {
  final String name;
  final String link;
  final Image logo;

  SponsorModel({required this.name, required this.link})
      : logo = Image.asset(
          "assets/sponsors/$name.png",
          height: 17.w,
          width: 17.w,
        );
}
