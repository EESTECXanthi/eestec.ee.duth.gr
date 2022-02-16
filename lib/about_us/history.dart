import 'package:flutter/material.dart';
import 'package:website/responsive.dart';
import 'package:website/widgets/lang_changer.dart';
import 'package:sizer/sizer.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/misc/EESTECHistory.png",
            filterQuality: FilterQuality.none),
        LangText(
            english:
                "LC Xanthi was founded in 2010 by students of the Electrical and Computer Engineering Department of Democritus University of Thrace and became officially a Local Committee in 2014 Congress in Athens. In November 2013, we organized our first international workshop \"Rock the Bit\". In 2015 we organized our 2nd workshop, \"Plan B: Hack the system\", as well as our first exchange, \"Aquaholics\". We also had the chance to organize the HOBOM for 2015, hosting the 2014 and 2015 international boards for 1 week. In March 2016 we organized our 3rd international workshop \"Brewing Bad\". So far, we are counting more than 80 active members!  We organize many local activities that address not only to the students of our faculty but the whole society of Xanthi, having received excellent feedback! Our goal is to spread the EESTEC spirit, which we accomplish through our highly motivated members and various activities!",
            greek:
                "Η LC Xanthi ιδρύθηκε το 2010 από φοιτητές του Τμήματος Ηλεκτρολόγων Μηχανικών και Μηχανικών Υπολογιστών του Δημοκρίτειου Πανεπιστημίου Θράκης και έγινε επίσημα Τοπική Επιτροπή το 2014 στο Συνέδριο στην Αθήνα. Τον Νοέμβριο του 2013 διοργανώσαμε το πρώτο μας διεθνές workshop «Rock the Bit». Το 2015 διοργανώσαμε το 2ο workshop μας, \"Plan B: Hack the system\", καθώς και την πρώτη μας ανταλλαγή, \"Aquaholics\". Είχαμε επίσης την ευκαιρία να διοργανώσουμε το HOBOM για το 2015, φιλοξενώντας τα διεθνή συμβούλια του 2014 και του 2015 για 1 εβδομάδα. Τον Μάρτιο του 2016 διοργανώσαμε το 3ο διεθνές μας workshop «Brewing Bad». Μέχρι στιγμής μετράμε περισσότερα από 80 ενεργά μέλη! Διοργανώνουμε πολλές τοπικές δραστηριότητες που απευθύνονται όχι μόνο στους φοιτητές της σχολής μας αλλά σε όλη την κοινωνία της Ξάνθης, έχοντας λάβει εξαιρετική ανατροφοδότηση! Στόχος μας είναι να διαδώσουμε το πνεύμα της EESTEC, το οποίο επιτυγχάνουμε μέσα από τα μέλη μας με υψηλά κίνητρα και διάφορες δραστηριότητες!",
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: Responsive.isMobile(context) ? 5.w : 2.w)),
      ],
    );
  }
}
