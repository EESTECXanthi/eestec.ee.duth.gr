import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:wave/config.dart';
import 'package:website/homepage/current_event.dart';
import 'package:website/homepage/sponsors.dart';
import 'package:website/navigation.dart';
import 'package:wave/wave.dart';
import 'package:sizer/sizer.dart';
import 'dart:math';

import 'footer.dart';
import 'text_image.dart';

const imagesNumber = 7;

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
                  for (int i = 0; i < imagesNumber; i++)
                    Image.asset(
                      "assets/slider/$i.jpg",
                      fit: BoxFit.fitWidth,
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
            text: [
              TextSpan(text: "Η "),
              TextSpan(
                  text: 'E', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "lectrical "),
              TextSpan(
                  text: 'E', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "ngineering "),
              TextSpan(
                  text: 'ST', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "udents’ "),
              TextSpan(
                  text: 'E', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "uropean asso "),
              TextSpan(
                  text: 'C ', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      'iation (EESTEC) είναι ένας μη πολιτικός, μη κυβερνητικός και μη κερδοσκοπικός πανευρωπαϊκός οργανισμός φοιτητών στο πεδίο του ηλεκτρολόγου μηχανικού. Η EESTEC απαρτίζεται από τοπικές επιτροπές σε όλη την Ευρώπη, ένα εκ των οποίων αποτελεί η '),
              TextSpan(
                  text: 'EESTEC LC Xanthi',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      ". Η Τ.Ε. Ξάνθης ιδρύθηκε το 2010 και υπάρχουν περισσότερα από 80 ενεργά μέλη-φοιτητές του Δημοκρίτειου Πανεπιστημίου Θράκης."),
            ],
            title: "Who are we?",
            image: "assets/homepage/0.jpg",
            reversed: false,
          ),
          const TextImage(
            text: [
              TextSpan(text: "Σκοπός της "),
              TextSpan(
                  text: 'EESTEC',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      ' είναι να δημιουργήσει, να προωθήσει και να αναπτύξει διεθνείς επαφές και ανταλλαγή ιδεών μεταξύ φοιτητών. Η αποστολή της οργάνωσης είναι η ανάπτυξη των μελών τοσο ακαδημαϊκα όσο και επαγγελματικά.'),
            ],
            title: "Our goal",
            image: "assets/homepage/1.jpg",
            reversed: true,
          ),
          const CurrentEvent(),
          const Footer(),
        ],
      ),
    );
  }
}
