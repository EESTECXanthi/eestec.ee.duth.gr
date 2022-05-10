import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:website/homepage/sponsors.dart';
import 'package:sizer/sizer.dart';

class EventList extends StatelessWidget {
  const EventList({Key? key}) : super(key: key);

  Future<List<EventModel>> getevents() async {
    final manifest = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> decoded = json.decode(manifest);
    List<String> rootkeys = decoded.keys.toList();

    List<EventModel> events = [];

    try {
      int index = 0;
      while (true) {
        final keys = rootkeys
            .where(
                (dynamic key) => key.startsWith('assets/events/${index}_event'))
            .toList();

        final String filename = Uri.decodeFull(keys[0]).split('/').last;
        final parts = filename.split('_').toList();
        final color = Color(int.parse("0x${parts[3].substring(0, 8)}"));

        var sponsorsKeys = keys
            .where((dynamic key) =>
                key.startsWith('assets/events/${index}_sponsor'))
            .toList();
        sponsorsKeys =
            sponsorsKeys.map((String key) => key.split('/').last).toList();

        List<CurrentEventSponsor> sponsors = [];
        for (String k in keys) {
          // sponsor_3_fagi_fagi.gr_test description.png
          //    0    1   2    3              4
          // print("key encoded: $k");
          k = Uri.decodeFull(k);
          // print("key decoded: $k");
          final parts = k.split('_').toList();

          final stars = int.parse(parts[2]);
          Map<String, String>? desc;
          String link = "";

          if (parts.length == 6) {
            link = parts[4];
            print("link: $link");
            desc = {
              "greek": parts[5].substring(0, parts[5].length - 4),
              "english": "todo",
            };
          }

          if (parts.length == 5) {
            link = parts[4].substring(0, parts[3].length - 4);
            print("link: $link");
          }

          if (link != "") {
            link = "http://$link";
          }

          final s = CurrentEventSponsor(
            stars: stars,
            name: parts[3],
            link: link,
            desc: desc,
            image: k,
          );
          sponsors.add(s);
        }

        sponsors.sort((a, b) {
          if (a.stars > b.stars) {
            return -1;
          } else if (a.stars < b.stars) {
            return 1;
          }
          return 0;
        });

        final List<CurrentEventSponsor> primarySponsors =
            sponsors.where((CurrentEventSponsor s) => s.stars != 0).toList();
        final List<CurrentEventSponsor> secondarySponsors =
            sponsors.where((CurrentEventSponsor s) => s.stars == 0).toList();

        events.add(EventModel(
            color: color,
            name: parts[2],
            image: filename,
            sponsors: primarySponsors,
            also: secondarySponsors));
        index++;
      }
      // ignore: empty_catches
    } catch (e) {}

    return events;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 100,
      child: FutureBuilder<List<EventModel>>(
          future: getevents(),
          builder: (context, snapshot) {
            log("object");
            final data = snapshot.data;
            print(data);
            if (data == null) {
              return const CircularProgressIndicator();
            }
            return Column(
              children: data.map((e) => EventDisplay(event: e)).toList(),
            );
          }),
    );
  }
}

class EventDisplay extends StatelessWidget {
  const EventDisplay({Key? key, required this.event}) : super(key: key);
  final EventModel event;
  @override
  Widget build(BuildContext context) {
    Future<EventModel> dynamicEventFuture = CurrentEventUtil.getCurrentEvent();
    return FutureBuilder<EventModel>(
      future: dynamicEventFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Image.asset("assets/currentEvent/${snapshot.data!.image}"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  "${snapshot.data?.name} Sponsors:",
                  style: TextStyle(
                    color: snapshot.data?.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 4.w,
                  ),
                ),
              ),
              SponsorList(
                sponsors: snapshot.data!.sponsors,
                color: snapshot.data!.color,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h),
                child: snapshot.data!.also.isNotEmpty
                    ? Text(
                        "WE ALSO THANK",
                        style: TextStyle(
                          color: snapshot.data!.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 3.w,
                        ),
                      )
                    : null,
              ),
              SponsorList(
                sponsors: snapshot.data!.also,
                color: snapshot.data!.color,
                size: 0.5,
              ),
            ],
          );
        }
        return Column(
          children: const [
            Text("Loading current event"),
            CircularProgressIndicator()
          ],
        );
      },
    );
    // return Column(
    //   children: [
    //     FutureBuilder<CurrentEventModel>(
    //       future: dynamicEventFuture,
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           return Text(
    //               "DEBUG Current Event\n${snapshot.data?.name}\n${snapshot.data?.image}\n${snapshot.data?.color}");
    //         }
    //         return const Text("Loading current event");
    //       },
    //     ),
    //     Image.asset("assets/events/${currentEvent.image}"),
    //     Padding(
    //       padding: EdgeInsets.symmetric(vertical: 10.h),
    //       child: Text(
    //         "Soft ${currentEvent.name} Sponsors:",
    //         style: TextStyle(
    //           color: currentEvent.color,
    //           fontWeight: FontWeight.bold,
    //           fontSize: 4.w,
    //         ),
    //       ),
    //     ),
    //     SponsorList(
    //       sponsors: currentEvent.sponsors,
    //       color: currentEvent.color,
    //     ),
    //     Padding(
    //       padding: EdgeInsets.symmetric(vertical: 3.h),
    //       child: Text(
    //         "WE ALSO THANK",
    //         style: TextStyle(
    //           color: currentEvent.color,
    //           fontWeight: FontWeight.bold,
    //           fontSize: 3.w,
    //         ),
    //       ),
    //     ),
    //     SponsorList(
    //       sponsors: currentEvent.also,
    //       color: currentEvent.color,
    //       size: 0.5,
    //     ),
    //   ],
    // );
  }
}

/*
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
*/
class EventModel {
  final Color color;
  final String name;
  final String image;
  final List<CurrentEventSponsor> sponsors;
  final List<CurrentEventSponsor> also;

  const EventModel({
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

class CurrentEventUtil {
  static Future<EventModel> getCurrentEvent() async {
    // print("CurrentEventUtil: Loading current event");
    final manifest = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> decoded = json.decode(manifest);
    List<String> keys = decoded.keys.toList();

    keys = keys
        .where((dynamic key) => key.startsWith('assets/events/event'))
        .toList();

    final String filename = Uri.decodeFull(keys[0]).split('/').last;
    final parts = filename.split('_').toList();
    final color = Color(int.parse("0x${parts[2].substring(0, 8)}"));

    final List<CurrentEventSponsor> sponsors = await getCurrentEventSponsors();
    final List<CurrentEventSponsor> primarySponsors =
        sponsors.where((CurrentEventSponsor s) => s.stars != 0).toList();
    final List<CurrentEventSponsor> secondarySponsors =
        sponsors.where((CurrentEventSponsor s) => s.stars == 0).toList();

    return EventModel(
        color: color,
        name: parts[1],
        image: filename,
        sponsors: primarySponsors,
        also: secondarySponsors);
  }

  static Future<List<CurrentEventSponsor>> getCurrentEventSponsors() async {
    // print("CurrentEventUtil: Loading sponsors");
    final manifest = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> decoded = json.decode(manifest);
    List<String> keys = decoded.keys.toList();

    keys = keys
        .where((dynamic key) => key.startsWith('assets/currentEvent/sponsor'))
        .toList();
    keys = keys.map((String key) => key.split('/').last).toList();

    List<CurrentEventSponsor> sponsors = [];
    for (String k in keys) {
      // sponsor_3_fagi_fagi.gr_test description.png
      //    0    1   2    3              4
      // print("key encoded: $k");
      k = Uri.decodeFull(k);
      // print("key decoded: $k");
      final parts = k.split('_').toList();

      final stars = int.parse(parts[1]);
      Map<String, String>? desc;
      String link = "";

      if (parts.length == 5) {
        link = parts[3];
        // print("link: $link");
        desc = {
          "greek": parts[4].substring(0, parts[4].length - 4),
          "english": "todo",
        };
      }

      if (parts.length == 4) {
        link = parts[3].substring(0, parts[3].length - 4);
        // print("link: $link");
      }

      if (link != "") {
        link = "http://$link";
      }

      final s = CurrentEventSponsor(
        stars: stars,
        name: parts[2],
        link: link,
        desc: desc,
        image: k,
      );
      sponsors.add(s);
    }

    sponsors.sort((a, b) {
      if (a.stars > b.stars) {
        return -1;
      } else if (a.stars < b.stars) {
        return 1;
      }
      return 0;
    });
    return sponsors;
  }
}
