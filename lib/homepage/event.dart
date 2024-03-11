import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/homepage/sponsors.dart';
import 'package:sizer/sizer.dart';

class EventList extends StatelessWidget {
  const EventList({super.key});

  Future<List<EventModel>> getevents() async {
    final manifest = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> decoded = json.decode(manifest);
    List<String> rootkeys = decoded.keys.toList();

    List<EventModel> events = [];

    events.add(const EventModel(
      // externalLink: ,
      color: Color(0xFF9B2065),
      name: "Soft Skill Academy 9",
      image: "ssa9.png",
      sponsors:  [CurrentEventSponsor(image: "deloitte.png",name: "Deloitte",link: "https://deloitte.com" )],
    ));

      events.add(const EventModel(
      // externalLink: ,
      color: Color(0xFF52BDE9),
      name: "EESTech Challenge",
      image: "eestecchallenge.png",
      sponsors: [
      CurrentEventSponsor(image: "oracle.png",name: "Oracle",link: "https://oracle.com",desc: {"greek":"""H Oracle παρέχει ολοκληρωμένα πακέτα εφαρμογών και ασφαλή, αυτόνομη υποδομή στο Oracle Cloud. Mε \$42 δισ. τζίρο, 170.000 εργαζομένους, 20.000 συνεργάτες και περισσότερους από 430.000 πελάτες, σε 175 χώρες, υποστηρίζει τους πελάτες της σε κάθε βήμα του ψηφιακού ταξιδιού τους, με συμβουλευτικές υπηρεσίες, τεχνική υποστήριξη και εκπαίδευση.
Στο πλαίσιο της Εταιρικής Κοινωνικής Ευθύνης, παρέχει τη δυνατότητα πρόσβασης σε δωρεάν εκπαιδευτικό υλικό και ευκαιρίες επαγγελματικής πιστοποίησης μέσω του προγράμματος Learning Explorer του Oracle University.
Για περισσότερες πληροφορίες σχετικά με την Oracle επισκεφθείτε την ιστοσελίδα www.oracle.com"""}),
      CurrentEventSponsor(image: "softcom.png",name: "SoftCom",link: "https://softcom-int.com",desc: {"greek":"""Η Software Competitiveness International (για τους φίλους SoftCom) είναι μια συνεχώς αναπτυσσόμενη εταιρεία, που ειδικεύεται σε Υπηρεσίες Έρευνας & Ανάπτυξης Λογισμικού και Εξατομικευμένες Λύσεις Πληροφορικής. Ιδρύθηκε το 2010 και από τότε καταφέρνει να συνδυάσει την εμπειρία και τις διαδικασίες μιας μεγάλης πολυεθνικής εταιρείας με την ευελιξία και την προσωπική δέσμευση μιας start-up. Αναγνωρίζοντας τις ανάγκες ενός ταχύτατα αναπτυσσόμενου τεχνολογικά κόσμου, η εταιρεία εστιάζει στην προσφορά υπηρεσιών λογισμικού για large scale projects, safety-sensitive λογισμικό και εξατομικευμένες λύσεις λογισμικού, βασισμένες στις απαιτήσεις των πελατών της. Η καινοτόμος προσέγγιση των υπηρεσιών και των λύσεων που παρέχονται στους πελάτες της είναι αυτά που έχουν καθιερώσει την εταιρεία στη διεθνή αγορά, με ιδιαίτερη έμφαση στην Κεντρική Ευρώπη. Η Softcom αποτελεί έναν αξιόπιστο συνεργάτη με ποιοτική προσέγγιση και μεθοδολογίες διεθνών προδιαγραφών στην ανάπτυξη λογισμικού και, ταυτόχρονα, ένα ιδανικό εργασιακό περιβάλλον με επίπεδη οργανωτική δομή, όπου οι 150 και πλέον εργαζόμενοί της συνεργάζονται σε συνθήκες κατάλληλες για να αναπτύξουν τις τεχνολογικές γνώσεις τους και μέσα σε ένα πολυεθνικό περιβάλλον."""}), 
      CurrentEventSponsor(image: "sunlight-2.png",name: "Sunlight Group",link: "https://the-sunlight-group.com",desc: {"greek":"""Η Sunlight Group είναι κορυφαία εταιρεία τεχνολογίας και παροχής καινοτόμων λύσεων αποθήκευσης ενέργειας για βιομηχανικές και εκτός δρόμου εφαρμογές, με περισσότερα από 30 χρόνια εμπειρίας. Ειδικεύεται στην ανάπτυξη, παραγωγή και διάθεση μπαταριών μολύβδου-οξέος και ιόντων λιθίου για βιομηχανική ηλεκτροκίνηση και ηλεκτροκίνηση οχημάτων αναψυχής, καθώς και συστημάτων αποθήκευσης ενέργειας. Τα προϊόντα αυτά κατασκευάζονται και συναρμολογούνται στις υπερσύγχρονες εγκαταστάσεις της Sunlight στην Ελλάδα, την Ιταλία, τη Γερμανία, τις ΗΠΑ και αλλού, και εξάγονται σε περισσότερες από 115 χώρες."""}), ]
    ));

    

    events.add(const EventModel(
      externalLink: "https://jobfair.eestecxanthis.gr",
      color: Color(0xFF76202E),
      name: "JobFair",
      image: "jobfair.png",
      sponsors:  [
              CurrentEventSponsor(image: "sunlight-2.png",name: "Sunlight Group",link: "https://the-sunlight-group.com",desc: {"greek":"""Η Sunlight Group είναι κορυφαία εταιρεία τεχνολογίας και παροχής καινοτόμων λύσεων αποθήκευσης ενέργειας για βιομηχανικές και εκτός δρόμου εφαρμογές, με περισσότερα από 30 χρόνια εμπειρίας. Ειδικεύεται στην ανάπτυξη, παραγωγή και διάθεση μπαταριών μολύβδου-οξέος και ιόντων λιθίου για βιομηχανική ηλεκτροκίνηση και ηλεκτροκίνηση οχημάτων αναψυχής, καθώς και συστημάτων αποθήκευσης ενέργειας. Τα προϊόντα αυτά κατασκευάζονται και συναρμολογούνται στις υπερσύγχρονες εγκαταστάσεις της Sunlight στην Ελλάδα, την Ιταλία, τη Γερμανία, τις ΗΠΑ και αλλού, και εξάγονται σε περισσότερες από 115 χώρες."""}), 

        CurrentEventSponsor(image: "ey.png",name: "EY",link: "https://ey.com",desc: {"greek":"""Στην ΕΥ, σκοπός μας είναι η δημιουργία ενός καλύτερου εργασιακού κόσμου, παράγοντας
μακροπρόθεσμη αξία για τους πελάτες μας, τους ανθρώπους μας και την κοινωνία, και
οικοδομώντας εμπιστοσύνη στις κεφαλαιαγορές.
Αξιοποιώντας τα δεδομένα και την τεχνολογία, οι πολυσυνθετικές ομάδες μας, σε
περισσότερες από 150 χώρες, οικοδομούν την εμπιστοσύνη μέσω της διασφάλισης της καλής
λειτουργίας των επιχειρήσεων και βοηθούν τους πελάτες μας να αναπτυχθούν, να
μετασχηματιστούν και να λειτουργήσουν αποτελεσματικότερα. Μέσω των Ελεγκτικών,
Συμβουλευτικών, Νομικών και Φορολογικών Υπηρεσιών μας, καθώς και μέσω των
Συμβουλευτικών Υπηρεσιών Εταιρικής Στρατηγικής και Συναλλαγών, οι ομάδες της EY
θέτουν καλύτερες ερωτήσεις, για να καταλήξουν σε νέες απαντήσεις στα περίπλοκα ζητήματα
που αντιμετωπίζει ο κόσμος μας σήμερα."""} ),
        CurrentEventSponsor(image: "thracegroup.png",name: "Thracegroup",link: "https://thracegroup.com",desc: {"greek":"""Από το 1977 μέχρι και σήμερα, ο Όμιλος Πλαστικά Θράκης δραστηριοποιείται στην παραγωγή και διάθεση προϊόντων πολυπροπυλενίου και πολυαιθυλενίου κατασκευάζοντας Τεχνικά Υφάσματα & Λύσεις Συσκευασίας που διατίθενται στην παγκόσμια αγορά. Με αφετηρία το Μαγικό Ξάνθης, εξελίχθηκε σε έναν επιτυχημένο Ελληνικό Πολυεθνικό Όμιλο που απασχολεί περισσότερους από 2,000 εργαζόμενους και λειτουργεί παραγωγικές & εμπορικές μονάδες σε 9 χώρες (Ελλάδα, Σκωτία, Βουλγαρία, Ρουμανία, Ιρλανδία, Η.Π.Α., Σερβία, Νορβηγία και Σουηδία) και εκτεταμένο δίκτυο πωλήσεων σε περισσότερες από 80 χώρες.

Οι μεγαλύτερες εγκαταστάσεις του ομίλου παραμένουν στο Μαγικό Ξάνθης, εκτείνονται σε έκταση 500 στρεμμάτων και απασχολούν περίπου 1,000 εργαζόμενους σε θέσεις που σχετίζονται με την παραγωγή, την έρευνα και ανάπτυξη προϊόντων, τη συντήρηση και βελτίωση τεχνολογικού εξοπλισμού και σύγχρονες τεχνικές εφαρμογές. Το 2013 εντάχθηκαν στον Όμιλο τα Θερμοκήπια Θράκης με τις υδροπονικές καλλιέργειες που αξιοποιούν τη γεωθερμία στην περιοχή της Ξάνθης.

Τα τελευταία χρόνια ο Όμιλος επενδύει δυναμικά στης Βιώσιμη Ανάπτυξη και κάνει την κυκλική οικονομία πράξη με τη λειτουργία μονάδας ανακύκλωσης, τη χρήση αναγεννημένης πρώτης ύλης στην παραγωγική διαδικασία, αλλά και τη συνεχή μείωση των αποβλήτων. Επίσης, συμβάλλει στη μείωση των επιπτώσεων της κλιματικής αλλαγής με τη χρήση ενέργειας από ανανεώσιμες πηγές (ηλιακή, γεωθερμική και υδροηλεκτρική), και τη συνεχή μείωση της κατανάλωσης ενέργειας κατά την παραγωγική διαδικασία. Μέσω της πλατφόρμας IN THE LOOP, ο όμιλος δικτυώνει εταιρείες, δημόσιους φορείς και καταναλωτές με στόχο τη μείωση του περιβαλλοντικού αποτυπώματος σε ολόκληρη την αλυσίδα αξίας. Για όλα τα παραπάνω, έχει αξιολογηθεί με τη διάκριση «Β» από τον διεθνή μη κερδοσκοπικό οργανισμό CDP υπερβαίνοντας τον παγκόσμιο μέσο όρο."""} ),
        ],
    ));

    return events;

    // EventModel(color: color, name: name, image: image);

    // return events;

    // try {
    //   int index = 0;
    //   while (true) {
    //     final keys = rootkeys
    //         .where(
    //             (dynamic key) => key.startsWith('assets/events/${index}_event'))
    //         .toList();
    //     final String filename = Uri.decodeFull(keys[0]).split('/').last;
    //     print(filename);
    //     final parts = filename.split('_').toList();
    //     print(parts);
    //     final color = Color(int.parse("0x${parts[3].substring(0, 8)}"));
    //     String? externalLink;
    //     try {
    //       externalLink = "https://${parts[4]}";
    //       externalLink = externalLink.replaceAll(".png", "");
    //       externalLink = externalLink.replaceAll(".jpg", "");
    //     } catch (e) {print(e);}
    //     print(events);
    //     var sponsorsKeys = rootkeys
    //         .where((dynamic key) =>
    //             key.startsWith('assets/events/${index}_sponsor'))
    //         .toList();
    //     sponsorsKeys =
    //         sponsorsKeys.map((String key) => key.split('/').last).toList();

    //     List<CurrentEventSponsor> sponsors = [];
    //     for (String k in sponsorsKeys) {
    //       // sponsor_3_fagi_fagi.gr_test description.png
    //       //    0    1   2    3              4
    //       // print("key encoded: $k");
    //       k = Uri.decodeFull(k);
    //       print("---------------------:k: $k");
    //       // print("key decoded: $k");
    //       final parts = k.split('_').toList();

    //       final stars = int.parse(parts[2]);
    //       Map<String, String>? desc;
    //       String link = "";

    //       if (parts.length == 6) {
    //         link = parts[4];
    //       }

    //       desc = {
    //         "greek": await rootBundle
    //             .loadString('events/${parts[3]}.txt')
    //             .catchError((_) => _),
    //         // "greek": parts[5].substring(0, parts[5].length - 4),
    //         "english": "todo",
    //       };

    //       ///to cut the last 4 characters from the link
    //       /// it includes extentsions like (.png,.jpg)
    //       if (parts.length == 5) {
    //         link = parts[4].substring(0, parts[4].length - 4);
    //       }
    //       if (link != "") {
    //         link = "http://$link";
    //       }

    //       final s = CurrentEventSponsor(
    //         stars: stars,
    //         name: parts[3],
    //         link: link,
    //         desc: desc,
    //         image: k,
    //       );
    //       sponsors.add(s);
    //     }

    //     sponsors.sort((a, b) {
    //       if (a.stars > b.stars) {
    //         return -1;
    //       } else if (a.stars < b.stars) {
    //         return 1;
    //       }
    //       return 0;
    //     });

    //     final List<CurrentEventSponsor> primarySponsors =
    //         sponsors.where((CurrentEventSponsor s) => s.stars != 0).toList();
    //     final List<CurrentEventSponsor> secondarySponsors =
    //         sponsors.where((CurrentEventSponsor s) => s.stars == 0).toList();
    //     final event = EventModel(
    //       color: color,
    //       name: parts[2],
    //       image: filename,
    //       sponsors: primarySponsors,
    //       also: secondarySponsors,
    //       externalLink: externalLink,
    //     );
    //     events.add(event);
    //     index++;
    //   }
    //   // ignore: empty_catches
    // } catch (e) {print(e);}

    // return events;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EventModel>>(
        future: getevents(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const CircularProgressIndicator();
          }
          return Column(
            children: data
                .map((e) => EventContainer(event: e))
                .toList()
                .reversed
                .toList(),
          );
        });
  }
}

class EventContainer extends StatelessWidget {
  const EventContainer({
    required this.event,
    super.key,
  });
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Image.asset("assets/events/${event.image}"),
          onTap: () async {
            final link = event.externalLink;
            if (link == null) {
              return;
            }
            if (await canLaunchUrl(Uri.parse(link))) {
              await launchUrl(Uri.parse(link));
            } else {
              throw "Could not launch $link";
            }
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text(
            "${event.name} Sponsors:",
            style: TextStyle(
              color: event.color,
              fontWeight: FontWeight.bold,
              fontSize: 4.w,
            ),
          ),
        ),
        SponsorList(
          sponsors: event.sponsors,
          color: event.color,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.h),
          child: event.also.isNotEmpty
              ? Text(
                  "WE ALSO THANK",
                  style: TextStyle(
                    color: event.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 3.w,
                  ),
                )
              : null,
        ),
        SponsorList(
          sponsors: event.also,
          color: event.color,
          size: 0.5,
        ),
      ],
    );
  }
}

class EventModel {
  final Color color;
  final String name;
  final String image;
  final List<CurrentEventSponsor> sponsors;
  final List<CurrentEventSponsor> also;
  final String? externalLink;

  const EventModel({
    required this.color,
    required this.name,
    required this.image,
    this.also = const [],
    this.sponsors = const [],
    this.externalLink,
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
