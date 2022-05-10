import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:website/about_us/board.dart';
import 'package:website/about_us/history.dart';
import 'package:website/responsive.dart';
import 'package:website/widgets/lang_changer.dart';

import '../navigation.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  static const Map<String, Map<String, String>> annualTeams = {
    "Fundraising Team": {
      "greek":
          "Σκοπός της ομάδας αυτής είναι η διαχείριση των οικονομικών ζητημάτων του τοπικού παραρτήματος της Ξάνθης μέσα από την εύρεση των κατάλληλων πόρων. Μέσα στις αρμοδιότητες της είναι και η εύρεση χορηγών για την οικονομική στήριξη των events που διοργανώνονται από το LC.  Παράλληλα, είναι υπεύθυνη για τις επαφές και τις συνεργασίες του LC με τον επιχειρηματικό κόσμο, αποσκοπώντας στην δημιουργία ενός αξιοπρεπούς εταιρικού προφίλ και στην δομημένη τακτική.",
      "english":
          "The purpose of this group is to manage the financial issues of the local branch of Xanthi through finding the appropriate resources. Its responsibilities include finding sponsors for the financial support of events organized by the LC. At the same time, she is responsible for the contacts and collaborations of LC with the business world, aiming to create a decent corporate profile and structured tactics.",
    },
    "Information Technology Team (IT)": {
      "greek":
          "Η ομάδα αυτή φροντίζει για την εύρυθμη λειτουργία και ελέγχει το τεχνικό μέρος του LC μας.  Μία από τις αρμοδιότητες της είναι η διαχείριση της ιστοσελίδας και η συνεχή συντήρηση της. Επίσης δέχεται και εφαρμόζει ιδέες που προκύπτουν από το ενδιαφέρον των μελών της ομάδας ώστε να εφαρμοστούν τόσο για το LC αλλά και για άλλες ομάδες και event.",
      "english":
          "This team takes care of the smooth operation and controls the technical part of our LC. One of its responsibilities is the management of the website and its continuous maintenance. It also accepts and implements ideas that arise from the interest of team members to be applied both for the LC and for other teams and events.",
    },
    "Public Relations Team (PR)": {
      "greek":
          "Η PR Team εργάζεται για να αναδείξει το LC Xanthi στην τοπική και όχι μόνο κοινότητα. Είναι υπεύθυνη για την επικοινωνία με εξωτερικούς συνεργάτες, την προώθηση των εκδηλώσεων που πραγματοποιούνται από το LC μας και σε τοπικό αλλά και σε international επίπεδο και την διαχείριση των Social Media λογαριασμών του LC.",
      "english":
          "The PR Team is working to promote the LC Xanthi to the local community and beyond. She is responsible for communicating with external partners, promoting events held by our LC both locally and internationally and managing LC Social Media accounts.",
    },
    "Design Team": {
      "greek":
          "Η Design Team  είναι υπεύθυνη για τη δημιουργία του γραφιστικού υλικού που πλαισιώνει την εικόνα του LC μας. Όλα τα μέλη της συνεργάζονται μεταξύ τους με σκοπό να αναπτυχθούν τα κατάλληλα σχέδια που χρειάζονται όλες οι ομάδες του LC για να καλύψουν τις διάφορες ανάγκες τους .",
      "english":
          "The Design Team is responsible for creating the graphic material that frames the image of our LC. All its members work together in order to develop the appropriate plans that all LC teams need to meet their various needs.",
    },
    "Academics Team": {
      "greek":
          "Η Academics Team είναι υπεύθυνη για τη  ακαδημαϊκή δράση του παραρτήματος μας.  Κάποιες από τις δραστηριότητες της ομάδας είναι να αναζητήσει, να μελετήσει και να παρουσιάσει θέματα σε ημερίδες, σεμινάρια και workshops, που την συναρπάζουν ακαδημαϊκά.",
      "english":
          "The Academics Team is responsible for the academic activities of our branch. Some of the group activities are to look for, study and present topics in workshops, seminars and workshops that fascinate it academically.",
    },
    "Human Resources (HR)": {
      "greek":
          "Η Ηuman Resources Team έχει ως στόχο με τις δράσεις της την ενίσχυση της κοινότητας της EESTEC σε τοπικό επίπεδο και την αύξηση του engagement και του awareness των μελών.  Δραστηριοποιείται στη διοργάνωση και διεκπεραίωση εκδηλώσεων που αφορούν το ανθρώπινο δυναμικό του LC και είναι υπεύθυνη για τις ψυχαγωγικές δραστηριότητες μέσα στο LC.",
      "english":
          "The Human Resources Team aims with its actions to strengthen the EESTEC community at the local level and to increase the engagement and awareness of the members. She is active in organizing and conducting events related to the human resources of the LC and is responsible for the leisure activities within the LC.",
    },
  };

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      Padding(
          child: const Text("Info"),
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w)),
      // Padding(
      //     child: const Text("Board"),
      //     padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w))
    ];

    tabs.addAll(annualTeams.keys
        .map<Widget>((e) => Padding(
            child: Text(e),
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w)))
        .toList());

    List<Widget> pageViews = [
      const History(),
      // const Board(),
      ...annualTeams.keys
          .map<Widget>((e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(children: [
                  // Text(e,
                  //     style: TextStyle(
                  //         color: Colors.red,
                  //         fontSize: Responsive.isMobile(context) ? 7.w : 3.w)),
                  Image.asset(
                    "assets/annualTeams/$e.png",
                    fit: Responsive.isMobile(context) ? BoxFit.fitHeight : null,
                    height: Responsive.isMobile(context) ? 35.h : null,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DottedLine(
                      lineThickness: 0.5.w,
                      dashLength: 1.w,
                      dashGapLength: 1.w,
                      lineLength: 90.w,
                      dashColor: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: Responsive.isMobile(context)
                        ? const EdgeInsets.all(0)
                        : const EdgeInsets.symmetric(horizontal: 60.0),
                    child: LangText(
                        greek: annualTeams[e]?["greek"] ?? "",
                        english: annualTeams[e]?["english"] ?? "",
                        style: TextStyle(
                            fontSize:
                                Responsive.isMobile(context) ? 5.w : 2.w)),
                  ),
                ]),
              ))
          .toList(),
    ];

    return DefaultTabController(
        length:
            annualTeams.length + 2 - 1, // one for History tab and one for board
        child: Navigation(
          bottom: TabBar(
            isScrollable: true,
            tabs: tabs,
          ),
          child: TabBarView(
            children: pageViews,
          ),
        ));
  }
}
