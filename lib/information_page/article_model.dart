import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ArticleModel {
  final Map<String, String> name;
  final Map<String, String>? quote;
  final Color color;
  final Map<String, String> desc;
  final String image;

  const ArticleModel(
      {required this.name,
      this.quote,
      required this.color,
      required this.desc,
      required this.image});
}

const List<ArticleModel> articles = [
  ArticleModel(
      name: {
        "greek": "Η 1η ΦΩΤΟΓΡΑΦΙΑ ΜΑΥΡΗΣ ΤΡΥΠΑΣ ΛΕΕΙ ΜΠΡΑΒΟ ΑΙΝΣΤΑΙΝ!",
        "english": "//todo"
      },
      color: Color.fromRGBO(154, 33, 100, 1),
      image:
          "data:image/jpeg;base64,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",
      desc: {
        "greek":
            "Για πρώτη φορά στην ιστορία της αστρονομίας έχουμε τη δυνατότητα να δούμε την πρώτη φωτογραφία μιας μαύρης τρύπας ή μάλλον το τι υπάρχει γύρω από μια μαύρη τρύπα, αφού οι μαύρες τρύπες είναι στην πραγματικότητα αόρατες, καθώς απορροφούν οτιδήποτε εντός τους, ακόμη και το φως.Πρόκειται για την υπερμεγέθη μαύρη τρύπα που βρίσκεται στον γαλαξία  που ονομάζεται Messier 87 ή Α της Παρθένου, έχει μάζα 6,5 δισεκατομμύρια φορές μεγαλύτερη από την μάζα του Ήλιου(!) και διάμετρο 40 δισεκατομμύρια χιλιόμετρα (τρία εκατομμύρια φορές μεγαλύτερη από τη Γη). O γαλαξίας Μ87 απέχει 52 εκατομμύρια έτη φωτός από τη Γη.Η διασύνδεση των τηλεσκοπίων ισοδυναμεί με ένα τεράστιο εικονικό τηλεσκόπιο με μέγεθος σχεδόν όσο η Γη. Με αυτό τον τρόπο, δημιουργείται αρκετή δυνατότητα μεγέθυνσης, ώστε να απεικονισθεί η περιοχή γύρω από μια μαύρη τρύπα, ιδίως του λεγόμενου «ορίζοντα γεγονότων», δηλαδή της «περιμέτρου» πέρα από την οποία τίποτε δεν μπορεί να δραπετεύσει, ούτε το φως (γι’ αυτό, άλλωστε, μια μαύρη τρύπα λέγεται…μαύρη).Ένας Έλληνας επιστήμονας της διασποράς, ο Δημήτρης Ψάλτης, καθηγητής Αστρονομίας και Φυσικής του Πανεπιστημίου της Αριζόνας, διαδραμάτισε κομβικό ρόλο στο νέο μεγάλο Τηλεσκόπιο Ορίζοντα Γεγονότων (Event Horizon Telescope-EHT), που πήρε την πρώτη εικόνα από μια μαύρη τρύπα. Η τερατώδης μαύρη τρύπα, στον γαλαξία Μessier 87, έχει διάμετρο περίπου 40 δισεκατομμυρίων χιλιομέτρων (τρία εκατομμύρια φορές μεγαλύτερη από τη Γη) και βρίσκεται σε απόσταση 500 εκατομμυρίων τρισεκατομμυρίων χιλιομέτρων. Αυτό που ανιχνεύει το υπερ-τηλεσκόπιο Event Horizon είναι η ακτινοβολία που εκπέμπει η μαύρη τρύπα, καθώς οι διεργασίες που εξελίσσονται εντός της προϋποθέτουν θερμοκρασίες που μετρώνται σε δισεκατομμύρια βαθμούς Κελσίου. Τα επιμέρους τηλεσκόπια συγκεντρώνουν δεδομένα από την παρατήρηση, τα οποία κατόπιν τροφοδοτούνται σε πανίσχυρους ηλεκτρονικούς υπολογιστές. Η Τεχνητή Νοημοσύνη αναλαμβάνει να επεξεργαστεί τάχιστα ωκεανούς πληροφοριών και να συνθέσει εικόνες. Αυτές είναι και οι «φωτογραφίες» από την μαύρη τρύπα Μ87* που αποκαλύπτονται σήμερα.Ο Δ. Ψάλτης και οι συνεργάτες του ανέλαβαν -για πρώτη φορά σε τέτοια αστροφυσική κλίμακα- να εξετάσουν κατά πόσο η εικόνα της μαύρης τρύπας επαληθεύει τη Γενική Θεωρία της Σχετικότητας του Άλμπερτ Αϊνστάιν. Γι’ αυτό το σκοπό αυτό ανέπτυξαν τα σχετικά «τεστ» και κατέληξαν στη σημαντική διαπίστωση ότι ο Αϊνστάιν για μια ακόμη φορά δικαιώθηκε, καθώς η εικόνα της μαύρης τρύπας τελικά ταιριάζει πολύ καλά στις προσομοιώσεις που είχαν προηγηθεί με βάση τη θεωρία.",
        "english": "//todo",
      }),
  ArticleModel(
      name: {
        "greek":
            "Σύστημα τεχνητής νοημοσύνης «διαβάζει» στα μάτια τον κίνδυνο εμφράγματος",
        "english": "//todo"
      },
      color: Color.fromRGBO(154, 33, 100, 1),
      quote: {
        "greek": "Τα μάτια μας «παράθυρο» για την πρόβλεψη εμφράγματος",
        "english": "//todo"
      },
      image:
          "https://images.ctfassets.net/u4vv676b8z52/3DGAAIEOlBVIFBuekYpXgd/485ce8a9135d7dc5a646a712dcec2c29/hazel-eye-678x446-compressor.jpg?fm=jpg&q=80",
      desc: {
        "greek":
            "Ευρωπαίοι και άλλοι επιστήμονες ανέπτυξαν ένα πρωτοποριακό σύστημα τεχνητής νοημοσύνης που μπορεί να αναλύσει εικόνες από τα μάτια ενός ανθρώπου και να βρει ποιος αντιμετωπίζει αυξημένο κίνδυνο για έμφραγμα. Το σύστημα έχει ακρίβεια της τάξης του 70% έως 80% στην πρόβλεψη εμφράγματος μέσα στον επόμενο χρόνο.Οι ερευνητές από τη Βρετανία, τη Γαλλία, το Βέλγιο τις ΗΠΑ και την Κίνα, με επικεφαλής τον καθηγητή Υπολογιστικής Ιατρικής Άλεξ Φράνγκι του Πανεπιστημίου του Λιντς και του Ινστιτούτου Άλαν Τιούρινγκ της Βρετανίας, οι οποίοι έκαναν τη σχετική δημοσίευση στο περιοδικό για θέματα Τεχνητής Νοημοσύνης «Nature Machine Intelligence», εκτίμησαν ότι μπορεί να υπάρξει στο μέλλον μία επανάσταση στη διάγνωση των καρδιαγγειακών κινδύνων, ειδικότερα για έμφραγμα.Οι γιατροί γνωρίζουν ότι οι αλλαγές στα μικροσκοπικά αιμοφόρα αγγεία του αμφιβληστροειδούς του ματιού αποτελούν δείκτες για την ευρύτερη αγγειακή υγεία ή νόσο, αποκαλύπτοντας έτσι προβλήματα στην καρδιά. Η νέα εξέλιξη είναι ότι με τη χρήση τεχνικών «βαθιάς» μηχανικής μάθησης εκπαιδεύτηκε ένα σύστημα τεχνητής νοημοσύνης να διαβάζει αυτόματα τις εικόνες του αμφιβληστροειδούς και να αναγνωρίζει σε αυτές τα σημάδια κινδύνου για έμφραγμα.Η βαθιά μάθηση είναι μία πολύπλοκη σειρά αλγόριθμων που επιτρέπουν στους υπολογιστές να αναγνωρίζουν μοτίβα στα δεδομένα και να κάνουν προβλέψεις. Το νέο «έξυπνο» σύστημα ανέλυσε εικόνες αμφιβληστροειδών και καρδιαγγειακές εξετάσεις από 5.000 ανθρώπους, προκειμένου να μάθει να συσχετίζει την παθολογική κατάσταση των ματιών με την υγεία της καρδιάς.Πηγή: ΑΠΕ",
        "english": "//todo"
      }),
  ArticleModel(
      name: {
        "greek": "Τεχνητή νοημοσύνη προβλέπει τους ιούς της επόμενης πανδημίας",
        "english": "//todo"
      },
      color: Color.fromRGBO(154, 33, 100, 1),
      quote: {"greek": "«Το κλειδί» και τα προβλήματα", "english": "//todo"},
      image:
          "https://www.tanea.gr/wp-content/uploads/2021/04/texniti-noimosini_iefimerida.jpg",
      desc: {
        "greek":
            "Μοντέλα μηχανικής μάθησης που αναλύουν τα ιικά γονιδιώματα μπορούν να εντοπίσουν τους ιούς που προέρχονται από ζώα και είναι πιθανό να μετατραπούν στην επόμενη επικίνδυνη ζωονόσο για τους ανθρώπουςι περισσότερες μολυσματικές νόσοι που προκαλούν επιδημίες ή και πανδημίες στον παγκόσμιο πληθυσμό (όπως η COVID-19) προέρχονται από τα ζώα. Είναι λοιπόν άκρως σημαντικό να εντοπίζονται εγκαίρως οι ιοί των ζώων οι οποίοι υπάρχει κίνδυνος να περάσουν το φράγμα των ειδών και να μολύνουν ανθρώπους «εγκυμονώντας» πιθανώς την επόμενη πανδημία.  Ανάλυση ιικών γονιδιωμάτων μέσω μηχανικής μάθησης Τώρα μια νέα μελέτη που δημοσιεύθηκε στην επιθεώρηση «PLoS Biology» από ερευνητές του Πανεπιστημίου της Γλασκώβης δείχνει ότι η μηχανική μάθηση η οποία αναλύει ιικά γονιδιώματα μπορεί να προβλέψει τις πιθανότητες που έχει ένας ιός ο οποίος μολύνει ζώα να μεταπηδήσει στους ανθρώπους.Οι περιορισμοί Βέβαια οι ερευνητές επισημαίνουν ότι τα μοντέλα που αναπτύχθηκαν έχουν περιορισμούς, καθώς τα υπολογιστικά μοντέλα αποτελούν μόνο ένα πρώτο βήμα εντοπισμού των ιών των ζώων που έχουν τη δυναμική να μολύνουν τους ανθρώπους. Οι ιοί που θα προκύψουν ως υψηλού κινδύνου από τα μοντέλα θα απαιτείται να ελέγχονται στη συνέχεια εξονυχιστικά στο εργαστήριο προκειμένου να επιβεβαιωθεί το πόσο επικίνδυνοι είναι για τους ανθρώπους. Επιπροσθέτως, παρότι τα μοντέλα προβλέπουν αν κάποιοι ιοί των ζώων μπορεί να είναι ικανοί να μολύνουν τους ανθρώπους, η ικανότητα μετάδοσης στον άνθρωπο αποτελεί μόνο ένα μέρος ενός ευρύτερου φάσματος κινδύνου – ρόλο επίσης παίζει η δριμύτητα του εκάστοτε ιού στον ανθρώπινο οργανισμό, η ικανότητα μετάδοσής του μεταξύ ανθρώπων καθώς και οι περιβαλλοντικές συνθήκες τη στιγμή της έκθεσης των ανθρώπων στον ιό.  «Κλειδί» η αλληλουχία του γονιδιώματος των ιών Οπως σημειώνουν οι συγγραφείς της μελέτης «τα ευρήματά μας δείχνουν ότι η ικανότητα ιών των ζώων να μεταπηδήσουν στους ανθρώπους μπορεί να υπολογιστεί σε αναπάντεχα υψηλό βαθμό από την αλληλουχία του γονιδιώματός τους. Φέρνοντας στο φως τους ιούς με τη μεγαλύτερη πιθανότητα να μετατραπούν σε ζωονόσους, μπορούμε να επιτύχουμε  μεγαλύτερη στόχευση σε ό,τι αφορά τον περαιτέρω οικολογικό και ιολογικό χαρακτηρισμό τους».  Εντοπισμός και προτεραιοποίηση στην ανάπτυξη εμβολίων O δρ Σάιμον Μπαμπάγιαν, λέκτορας στο Ινστιτούτο Βιοποικιλότητας, Υγείας των Ζώων και Συγκριτικής Ιατρικής, εκ των κύριων συγγραφέων της νέας μελέτης σημείωσε ότι τα καινούργια ευρήματα «συμπληρώνουν ένα καίριο κομμάτι στον ήδη απίστευτα μεγάλο όγκο πληροφορίας που μπορούμε να εξαγάγουμε από τη γενετική αλληλουχία των ιών με χρήση της τεχνητής νοημοσύνης. Η γενετική αλληλουχία είναι συνήθως η πρώτη – και συχνά η μόνη – πληροφορία που έχουμε σχετικά με νεοανακαλυφθέντες ιούς και όσο περισσότερες πληροφορίες μπορούμε να εξαγάγουμε από αυτή, τόσο πιο σύντομα μπορούμε να εντοπίσουμε την προέλευση του εκάστοτε ιού και τον κίνδυνο που μπορεί να έχει να μεταπηδήσει στους ανθρώπους». Οσο περισσότερο αυξάνονται οι ιοί των ζώων που ταυτοποιούνται, τόσο πιο αποτελεσματικά θα γίνονται τα μοντέλα μηχανικής μάθησης που αναπτύσσονται στον εντοπισμό σπάνιων ιών οι οποίοι θα πρέπει να παρακολουθούνται στενά και να προτεραιοποιούνται σε ό,τι αφορά την ανάπτυξη εμβολίων, κατέληξε ο δρ Μπαμπάγιαν.",
        "english": "//todo"
      }),
];
