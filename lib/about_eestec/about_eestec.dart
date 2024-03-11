import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sizer/sizer.dart';
import 'package:website/responsive.dart';
import 'package:website/widgets/lang_changer.dart';

import '../navigation.dart';

class AboutEestec extends StatelessWidget {
  const AboutEestec({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var style = TextStyle(fontWeight: FontWeight.bold, fontSize: 1.5.w);
    return DefaultTabController(
      length: 3,
      child: Navigation(
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: ExtendedImage.asset(
                  "assets/misc/aboutEestec.png",
                  enableMemoryCache: true,
                  cacheRawData: true,
                  loadStateChanged: (ExtendedImageState state) {
                    switch (state.extendedImageLoadState) {
                      case LoadState.loading:
                        return const Center(child: CircularProgressIndicator());
                      case LoadState.completed:
                        return ExtendedRawImage(
                          image: state.extendedImageInfo?.image,
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
                ),
                // Text(
                //   "About EESTEC",
                //   style: TextStyle(
                //       color: Colors.red,
                //       fontSize: Responsive.isMobile(context) ? 7.w : 3.w,
                //       fontWeight: FontWeight.bold),
                // ),
              ),
            ),
            Divider(
              thickness: 0.5.h,
              color: Colors.red,
              indent: 25.w,
              endIndent: 25.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60.w,
                    child: LangText(
                      english:
                          "EESTEC (Electrical Engineering STudents' European assoCiaton) is an apolitical, non-governmental and non-profit organization for EECS students at universities, institutes and schools of technology. The organization was founded in Delft, in 1986. EESTEC aims to develop international contacts among european students, giving them the chance to develop their academic, professional and social lives. EESTEC is present in 24 countries and 54 cities across Europe. As an international organization, EESTEC contains International Teams and Projects, in which students can be part of",
                      greek:
                          "Η EESTEC (Electrical Engineering STudents' European assoCiation) αποτελεί έναν μη πολιτικό και μη κερδοσκοπικό οργανισμό φοιτητών Ηλεκτρολόγων Μηχανικών και όχι μόνο. Ο οργανισμός ιδρύθηκε στο Delft, το 1986. Η EESTEC αποσκοπεί στην ανάπτυξη διεθνών επαφών μεταξύ ευρωπαίων φοιτητών, δίνοντας τους την ευκαιρία να εξελιχθούν σε ακαδημαϊκό, επαγγελματικό και κοινωνικό επίπεδο. Η EESTEC έχει παραρτήματα σε 24 χώρες και συνεργάζεται με 54 πανεπιστήμια από όλη την Ευρώπη.Ως διεθνής οργανισμός, η EESTEC αποτελείται από International Teams και Projects, στα οποία συμμετέχουν φοιτητές από όλη την Ευρώπη. Εδώ  μπορείτε να βρείτε παραπάνω πληροφορίες για την διεθνή πλευρά της EESTEC",
                      style: TextStyle(
                        fontSize: Responsive.isMobile(context) ? 5.w : 1.5.w,
                      ),
                    ),
                  ),
                  // Responsive.isMobile(context)
                  //     ? const SizedBox.shrink()
                  //     : SizedBox(width: 10.w),
                  // Responsive.isMobile(context)
                  //     ? const SizedBox.shrink()
                  //     : Container(
                  //         width: 20.w,
                  //         height: 20.w,
                  //         color: Colors.red,
                  //       )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 30.w),
              child: ElevatedButton(
                onPressed: () async {
                  if (await canLaunchUrl(Uri.parse("https://eestec.net/about"))) {
                    await launchUrl(Uri.parse("https://eestec.net/about"));
                  } else {
                    throw "Could not launch https://eestec.net/about";
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: LangText(
                  english: "Learn more",
                  greek: "Μάθετε περισσότερα",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: Responsive.isMobile(context) ? 5.w : 2.w),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
