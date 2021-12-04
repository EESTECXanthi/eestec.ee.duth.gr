import 'package:flutter/material.dart';
import 'package:vertical_tab_bar_view/vertical_tab_bar_view.dart';
import 'package:sizer/sizer.dart';

import '../navigation.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  static const Map<String, String> annualTeams = {
    "Fundraising Team":
        "Σκοπός της ομάδας αυτής είναι η διαχείριση των οικονομικών ζητημάτων του τοπικού παραρτήματος της Ξάνθης μέσα από την εύρεση των κατάλληλων πόρων. Μέσα στις αρμοδιότητες της είναι και η εύρεση χορηγών για την οικονομική στήριξη των events που διοργανώνονται από το LC.  Παράλληλα, είναι υπεύθυνη για τις επαφές και τις συνεργασίες του LC με τον επιχειρηματικό κόσμο, αποσκοπώντας στην δημιουργία ενός αξιοπρεπούς εταιρικού προφίλ και στην δομημένη τακτική.",
    "Information Technology Team (IT)":
        "Η ομάδα αυτή φροντίζει για την εύρυθμη λειτουργία και ελέγχει το τεχνικό μέρος του LC μας.  Μία από τις αρμοδιότητες της είναι η διαχείριση της ιστοσελίδας και η συνεχή συντήρηση της. Επίσης δέχεται και εφαρμόζει ιδέες που προκύπτουν από το ενδιαφέρον των μελών της ομάδας ώστε να εφαρμοστούν τόσο για το LC αλλά και για άλλες ομάδες και event.",
    "Public Relations Team (PR)":
        "Η PR Team εργάζεται για να αναδείξει το LC Xanthi στην τοπική και όχι μόνο κοινότητα. Είναι υπεύθυνη για την επικοινωνία με εξωτερικούς συνεργάτες, την προώθηση των εκδηλώσεων που πραγματοποιούνται από το LC μας και σε τοπικό αλλά και σε international επίπεδο και την διαχείριση των Social Media λογαριασμών του LC.",
    "Design Team":
        "Η Design Team  είναι υπεύθυνη για τη δημιουργία του γραφιστικού υλικού που πλαισιώνει την εικόνα του LC μας. Όλα τα μέλη της συνεργάζονται μεταξύ τους με σκοπό να αναπτυχθούν τα κατάλληλα σχέδια που χρειάζονται όλες οι ομάδες του LC για να καλύψουν τις διάφορες ανάγκες τους .",
    "Academics Team":
        "Η Academics Team είναι υπεύθυνη για τη  ακαδημαϊκή δράση του παραρτήματος μας.  Κάποιες από τις δραστηριότητες της ομάδας είναι να αναζητήσει, να μελετήσει και να παρουσιάσει θέματα σε ημερίδες, σεμινάρια και workshops, που την συναρπάζουν ακαδημαϊκά .",
    "Human Resources (HR)":
        "Η Ηuman Resources Team έχει ως στόχο με τις δράσεις της την ενίσχυση της κοινότητας της EESTEC σε τοπικό επίπεδο και την αύξηση του engagement και του awareness των μελών.  Δραστηριοποιείται στη διοργάνωση και διεκπεραίωση εκδηλώσεων που αφορούν το ανθρώπινο δυναμικό του LC και είναι υπεύθυνη για τις ψυχαγωγικές δραστηριότητες μέσα στο LC.",
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: annualTeams.length,
      child: Navigation(
        bottom: TabBar(
          isScrollable: true,
          tabs: annualTeams.keys
              .map<Widget>((e) => Padding(
                  child: Text(e),
                  padding:
                      EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w)))
              .toList(),
        ),
        child: VerticalTabBarView(
            children:
                annualTeams.values.map<Widget>((e) => Text("d")).toList()),
      ),
    );
  }
}
