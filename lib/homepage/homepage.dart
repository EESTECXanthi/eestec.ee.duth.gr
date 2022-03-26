import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wave/config.dart';
import 'package:website/faq/faq.dart';
import 'package:website/faq/faq_container.dart';
import 'package:website/faq/faq_model.dart';
import 'package:website/homepage/current_event.dart';
import 'package:website/homepage/sponsors.dart';
import 'package:website/navigation.dart';
import 'package:wave/wave.dart';
import 'package:sizer/sizer.dart';
import 'package:website/responsive.dart';
import 'dart:math';
import 'dart:ui' as ui;

import 'footer.dart';
import 'text_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigation(
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (await canLaunch(
                "https://www.facebook.com/messages/t/554449414607675")) {
              await launch(
                  "https://www.facebook.com/messages/t/554449414607675");
            } else {
              throw "Could not launch messanger";
            }
          },
          child: const Icon(Icons.message)),
      child: ListView(
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              CarouselSlider(
                items: const [
                  _Image(image: "0"),
                  _Image(image: "1"),
                  _Image(image: "2"),
                  _Image(image: "3"),
                  _Image(image: "4"),
                  _Image(image: "5"),
                  _Image(image: "6"),
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
                  size: Size(MediaQuery.of(context).size.width, 22.h),
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
                size: Size(MediaQuery.of(context).size.width, 1.h),
              )),
          const TextImage(
            greekText: [
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
              TextSpan(text: "uropean asso"),
              TextSpan(
                  text: 'C', style: TextStyle(fontWeight: FontWeight.bold)),
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
            englishText: [
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
              TextSpan(text: "uropean asso"),
              TextSpan(
                  text: 'C', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      'iation (EESTEC) is a non-political, non-governmental and non-profit pan-European student organization in the field of electrical engineering. EESTEC is made up of local committees throughout Europe, one of which is '),
              TextSpan(
                  text: 'EESTEC LC Xanthi',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                text:
                    ". LC Xanthi was founded in 2010 and there are more than 80 active members-students of the Democritus University of Thrace. ",
              )
            ],
            greek: "WHO ARE WE",
            image: "assets/homepage/0.jpg",
            reversed: false,
          ),
          const TextImage(
            greekText: [
              TextSpan(text: "Σκοπός της "),
              TextSpan(
                  text: 'EESTEC',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      ' είναι να δημιουργήσει, να προωθήσει και να αναπτύξει διεθνείς επαφές και ανταλλαγή ιδεών μεταξύ φοιτητών. Η αποστολή της οργάνωσης είναι η ανάπτυξη των μελών τοσο ακαδημαϊκα όσο και επαγγελματικά.'),
            ],
            englishText: [
              TextSpan(text: "Purpose of"),
              TextSpan(
                  text: 'EESTEC',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      " is to create, promote and develop international contacts and exchange of ideas between students. The mission of the organization is the development of members both academically and professionally."),
            ],
            greek: "OUR GOAL",
            image: "assets/homepage/1.jpg",
            reversed: true,
          ),
          const CurrentEvent(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "FAQ",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: Responsive.isMobile(context) ? 5.w : 3.w),
            ),
          ),
          Divider(
            thickness: 3,
            indent: 5,
            endIndent: 8.w,
            color: Colors.red,
          ),
          for (final faq in faqs) FaqContainer(faq: faq),
          const SizedBox(height: 30),
          const Footer(),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.asset(
      "assets/slider/$image.jpg",
      enableMemoryCache: true,
      cacheRawData: true,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return const Center(child: CircularProgressIndicator());
          case LoadState.completed:
            return ExtendedRawImage(
              image: state.extendedImageInfo?.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            );
          case LoadState.failed:
            return GestureDetector(
              child: const Center(child: Icon(Icons.error)),
              onTap: () {
                state.reLoadImage();
              },
            );
        }
      },
    );
    // return Image(
    //   //imageUrl: "http://eestec.ee.duth.gr/assets/assets/slider/$image.jpg",
    //   image: UiImage(),
    //   fit: BoxFit.cover,
    //   height: double.infinity,
    //   width: double.infinity,
    //   placeholder: (context, url) => const CircularProgressIndicator(),
    //   errorWidget: (context, url, error) => const Icon(Icons.error),
    // );

    // return Container(
    //   width: MediaQuery.of(context).size.width,
    //   //height: 100,
    //   decoration: BoxDecoration(
    //     image: DecorationImage(
    //       fit: BoxFit.cover,
    //       image: AssetImage("assets/slider/$image.jpg"),
    //     ),
    //   ),
    // );
  }
}
