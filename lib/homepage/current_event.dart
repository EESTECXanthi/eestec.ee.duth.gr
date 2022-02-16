import 'package:flutter/material.dart';
import 'package:website/homepage/sponsors.dart';
import 'package:sizer/sizer.dart';
import 'package:website/widgets/lang_changer.dart';

class CurrentEvent extends StatelessWidget {
  const CurrentEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/events/${currentEvent.image}"),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text(
            "Soft ${currentEvent.name} Sponsors:",
            style: TextStyle(
              color: currentEvent.color,
              fontWeight: FontWeight.bold,
              fontSize: 4.w,
            ),
          ),
        ),
        SponsorList(
          sponsors: currentEvent.sponsors,
          color: currentEvent.color,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.h),
          child: Text(
            "WE ALSO THANK",
            style: TextStyle(
              color: currentEvent.color,
              fontWeight: FontWeight.bold,
              fontSize: 3.w,
            ),
          ),
        ),
        SponsorList(
          sponsors: currentEvent.also,
          color: currentEvent.color,
          size: 0.5,
        ),
      ],
    );
  }
}

const currentEvent = CurrentEventModel(
    color: Colors.purple,
    name: "Soft Skills Academy 7",
    image: "ss7.png",
    sponsors: [
      CurrentEventSponsor(
        name: "fagi",
        link: "https://www.fagi.gr/",
        stars: 3,
        image: "fagi.png",
      ),
      CurrentEventSponsor(
          name: "ey",
          link: "https://www.ey.com",
          stars: 3,
          image: "ey.png",
          desc: {
            "greek":
                """H EY λειτουργεί στην Ελλάδα από το 1926. Η ΕΥ Ελλάδος διαθέτει γραφεία σε Αθήνα και Θεσσαλονίκη, ενώ προσεχώς ανοίγει νέο γραφείο και στην Πάτρα και πλέον απασχολεί περισσότερους από 1500 επαγγελματίες σε όλη την Ελλάδα. Εντάσσεται στην περιοχή της ΕΜΕΙΑ (Ευρώπη, Μέση Ανατολή, Ινδία, Αφρική) και είναι μία από τις 31 χώρες που απαρτίζουν την περιοχή της CESA (Κεντρική, Ανατολική, Νοτιοανατολική Ευρώπη & Κεντρική Ασία) – τη μεγαλύτερη περιοχή στην ΕΥ.
 
Στην ΕΥ, σκοπός μας είναι η δημιουργία ενός καλύτερου εργασιακού κόσμου, παράγοντας μακροπρόθεσμη αξία για τους πελάτες μας, τους ανθρώπους μας και την κοινωνία, και οικοδομώντας εμπιστοσύνη στις κεφαλαιαγορές.
 
Αξιοποιώντας τα δεδομένα και την τεχνολογία, οι πολυσυνθετικές ομάδες μας, σε περισσότερες από 150 χώρες, οικοδομούν την εμπιστοσύνη μέσω της διασφάλισης της καλής λειτουργίας των επιχειρήσεων και βοηθούν τους πελάτες μας να αναπτυχθούν, να μετασχηματιστούν και να λειτουργήσουν αποτελεσματικότερα. Μέσω των Ελεγκτικών, Συμβουλευτικών, Νομικών και Φορολογικών Υπηρεσιών μας, καθώς και μέσω των Συμβουλευτικών Υπηρεσιών Εταιρικής Στρατηγικής και Συναλλαγών, οι ομάδες της EY θέτουν καλύτερες ερωτήσεις, για να καταλήξουν σε νέες απαντήσεις στα περίπλοκα ζητήματα που αντιμετωπίζει ο κόσμος μας σήμερα.
 
Μετασχηματίζουμε τις επιχειρήσεις μέσα από τη δύναμη των ανθρώπων, της τεχνολογίας και της καινοτομίας. Ως παγκόσμιος ηγέτης στον χώρο των data, υιοθετούμε αναδυόμενες τεχνολογίες και με ευελιξία και ταχύτητα, βοηθούμε στον επαναπροσδιορισμό διαδικασιών, υπηρεσιών, προϊόντων, ακόμα και ολόκληρων αγορών.
 
Στην EY, πιστεύουμε απόλυτα ότι η δημιουργία ενός καλύτερου εργασιακού κόσμου ξεκινά από τους ανθρώπους μας, οι οποίοι βρίσκονται στην «καρδιά» όλων όσων κάνουμε. Οι άνθρωποί μας έχουν τη δυνατότητα να αξιοποιήσουν στο έπακρο τις δεξιότητες τους, αλλά και να τις αναπτύξουν περαιτέρω.
 
Έχοντας εδραιωθεί ως ένας παγκόσμιος οργανισμός που αποτελεί εργοδότη πρώτης επιλογής για νέους επαγγελματίες και επιστήμονες που ξεκινούν τη σταδιοδρομία τους, δέσμευσή μας είναι να παρέχουμε στους ανθρώπους μας την καλύτερη δυνατή εργασιακή εμπειρία και τις ευκαιρίες να μπορέσουν να φτάσουν εκεί που οι ίδιοι ονειρεύονται, και στο όραμά μας, η ενίσχυση της ισότητας των φύλων και η προώθηση της πολυσυνθετικότητας και συμπερίληψης στην εργασία.""",
            "english": "//TODO",
          }),
      CurrentEventSponsor(
          name: "Accenture",
          link: "https://www.accenture.com/",
          stars: 2,
          image: "accenture.png",
          desc: {
            "greek":
                """Η accenture αποτελεί ηγέτιδα εταιρεία παροχής υπηρεσιών προς επιχειρήσεις σε παγκόσμιο επίπεδο, με κορυφαίες δυνατότητες στους τομείς των ψηφιακών τεχνολογιών, του cloud και της ασφάλειας. Συνδυάζοντας απαράμιλλη εμπειρία και εξειδικευμένες δεξιότητες σε περισσότερους από 40 κλάδους, προσφέρουμε ολοκληρωμένες λύσεις στους τομείς στρατηγικής και συμβουλευτικής, διαδραστικών υπηρεσιών, τεχνολογίας και επιχειρησιακών λειτουργιών, αξιοποιώντας το μεγαλύτερο παγκόσμιο δίκτυο κέντρων Προηγμένης Τεχνολογίας και Ευφυών Λειτουργιών. Τα 537,000 στελέχη μας υλοποιούν καθημερινά έργα με γνώμονα την αλληλεπίδραση της τεχνολογία και της ανθρώπινης εφευρετικότητας, εξυπηρετώντας πελάτες σε περισσότερες από 120 χώρες. Ως Accenture, αγκαλιάζουμε τη δύναμη της αλλαγής με στόχο να δημιουργήσουμε αξία και κοινή επιτυχία για τους πελάτες, τους υπαλλήλους, τους μετόχους, τους συνεργάτες και την κοινωνία.""",
            "english": "todo",
          }),
      CurrentEventSponsor(
        name: "epsa",
        link: "https://epsa.gr",
        stars: 1,
        image: "epsa.png",
      ),
    ],
    also: [
      CurrentEventSponsor(image: "crepa_house.jpg"),
      CurrentEventSponsor(image: "centriko.jpg"),
      CurrentEventSponsor(image: "edesma.png"),
      CurrentEventSponsor(image: "ermis.jpeg"),
      CurrentEventSponsor(image: "express_copy.jpg"),
      CurrentEventSponsor(image: "filo_doras.jpg"),
      CurrentEventSponsor(image: "grand_minion.png"),
      CurrentEventSponsor(image: "kasetophono.png"),
      CurrentEventSponsor(image: "kibernio.jpg"),
      CurrentEventSponsor(image: "migio.png"),
      CurrentEventSponsor(image: "nanou.jpg"),
      CurrentEventSponsor(image: "see_you.jpg"),
      CurrentEventSponsor(image: "tzoukas.jpg"),
    ]);

class CurrentEventModel {
  final Color color;
  final String name;
  final String image;
  final List<CurrentEventSponsor> sponsors;
  final List<CurrentEventSponsor> also;

  const CurrentEventModel({
    required this.color,
    required this.name,
    required this.image,
    this.also = const [],
    this.sponsors = const [],
  });
}

class CurrentEventSponsor {
  final String? name;
  final int stars;
  final Map<String, String>? desc;
  final String image;
  final String? link;

  const CurrentEventSponsor({
    this.link,
    required this.image,
    this.name,
    this.stars = 0,
    this.desc,
  });
}
