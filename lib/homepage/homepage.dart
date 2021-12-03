import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:wave/config.dart';
import 'package:website/homepage/sponsors.dart';
import 'package:website/navigation.dart';
import 'package:wave/wave.dart';
import 'package:sizer/sizer.dart';
import 'dart:math';

import 'footer.dart';
import 'text_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigation(
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: const Icon(Icons.message)),
      child: ListView(
        children: [
          Stack(
            children: [
              CarouselSlider(
                items: [
                  Image.asset(
                    "name",
                    fit: BoxFit.fill,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.pink,
                    child: const Text("What is EESTEC?"),
                  ),
                ],
                options: CarouselOptions(
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  autoPlay: true,
                  viewportFraction: 1,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
              Positioned(
                bottom: 0,
                child: WaveWidget(
                  config: CustomConfig(
                    durations: [35000, 19440],
                    heightPercentages: [0.20, 0.23],
                    colors: [
                      Colors.redAccent,
                      Colors.red,
                    ],
                  ),
                  size: Size(MediaQuery.of(context).size.width, 15.h),
                ),
              ),
            ],
          ),
          Transform.rotate(
              angle: pi,
              child: WaveWidget(
                config: CustomConfig(
                  durations: [350000, 194400],
                  heightPercentages: [0.13, 0.12],
                  colors: [
                    Colors.redAccent,
                    Colors.red,
                  ],
                ),
                size: Size(MediaQuery.of(context).size.width, 2.h),
              )),
          const TextImage(
            text: "LOREM",
            title: "Who are we?",
            image: "assets/homepage/0.jpg",
            reversed: false,
          ),
          const TextImage(
            text: "LOREM",
            title: "Our goal?",
            image: "assets/homepage/1.jpg",
            reversed: true,
          ),
          const SponsorList(),
          const Footer(),
        ],
      ),
    );
  }
}
