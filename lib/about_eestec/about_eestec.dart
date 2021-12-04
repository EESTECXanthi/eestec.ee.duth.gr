import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vertical_tab_bar_view/vertical_tab_bar_view.dart';
import 'package:sizer/sizer.dart';

import '../navigation.dart';

class AboutEestec extends StatelessWidget {
  const AboutEestec({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(fontWeight: FontWeight.bold, fontSize: 1.5.w);
    return DefaultTabController(
      length: 3,
      child: Navigation(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Text(
                "About EESTEC",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 3.w,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              thickness: 0.5.h,
              color: Colors.red,
              indent: 25.w,
              endIndent: 25.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 70.h,
                  child: Text(
                    "Η EESTEC (Electrical Engineering STudent’s European assoCiation) αποτελεί έναν μη πολιτικό και μη κερδοσκοπικό οργανισμό φοιτητών Ηλεκτρολόγων Μηχανικών και όχι μόνο. Ο οργανισμός ιδρύθηκε στο Delft, το 1986. Η EESTEC αποσκοπεί στην ανάπτυξη διεθνών επαφών μεταξύ ευρωπαίων φοιτητών, δίνοντας τους την ευκαιρία να εξελιχθούν σε ακαδημαϊκό, επαγγελματικό και κοινωνικό επίπεδο. Η EESTEC έχει παραρτήματα σε 24 χώρες και συνεργάζεται με 54 πανεπιστήμια από όλη την Ευρώπη.Ως διεθνής οργανισμός, η EESTEC αποτελείται από International Teams και Projects, στα οποία συμμετέχουν φοιτητές από όλη την Ευρώπη. Εδώ  μπορείτε να βρείτε παραπάνω πληροφορίες για την διεθνή πλευρά της EESTEC",
                    style: TextStyle(
                      fontSize: 3.h,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Container(
                  width: 20.w,
                  height: 20.w,
                  color: Colors.red,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: TextButton(
                onPressed: () async {
                  if (await canLaunch("https://eestec.net/about")) {
                    await launch("https://eestec.net/about");
                  } else {
                    throw "Could not launch https://eestec.net/about";
                  }
                },
                child: Text(
                  "Μάθετε περισσότερα",
                  style: TextStyle(fontSize: 2.w),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
