import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:website/widgets/lang_changer.dart';

class EventCategory {
  final String name;
  final Color color;
  final Map<String, String> desc;
  final String image;

  const EventCategory(
      {required this.name,
      required this.color,
      required this.desc,
      required this.image});
}

const List<EventCategory> categories = [
  EventCategory(
      name: "Soft Skills Academy",
      color: Color.fromRGBO(154, 33, 100, 1),
      image: "ssa.png",
      desc: {
        "greek":
            "Το Soft Skills Academy ( SSA ) αποτελεί ένα διεθνές project που οργανώνεται απο την EESTEC. Το Soft Skills Academy περιέχει μια σειρά από διαδραστικά σεμινάρια για soft skills. Αποσκοπεί στην ενίσχυση των δεξιοτήτων των συμμετεχόντων, έτσι ώστε να αποκτήσουν σημαντικά εφόδια  για την μετέπειτα επαγγελματική τους πορεία. Τα soft skills trainings πραγματοποιούνται από την Training Team της EESTEC.",
        "english":
            "Soft Skills Academy (SSA) is an international project organized by EESTEC. Soft Skills Academy contains a number of interactive soft skills seminars. It aims to enhance the skills of the participants, so that they acquire important supplies for their subsequent career. The soft skills trainings are performed by the Training Team of EESTEC.",
      }),
  EventCategory(
      name: "EESTech Challenge",
      color: Color(0xFF52BDE9),
      image: "eestech.png",
      desc: {
        "greek":
            "To EESTech Challenge (EESTEC Technology Challenge) αποτελεί έναν διεθνή φοιτητικό διαγωνισμό, ο οποίος αφορά θέματα που σχετίζονται με το αντικείμενο του Ηλεκτρολόγου Μηχανικού. Αποτελείται από έναν Local Round στον οποίο φοιτητές από κάθε παράρτημα της EESTEC στην Ευρώπη διαγωνίζονται σε τοπικό επίπεδο. Οι νικητές συμμετέχουν και στον Final Round ο οποίος πραγματοποιείται σε μία ευρωπαϊκή πόλη. Στόχος του Project είναι να η παροχή ακαδημαϊκών γνώσεων στους συμμετέχοντες, όπως επίσης και η δημιουργία ενός ισχυρού διεθνούς δικτύου φοιτητών.",
        "english":
            "EESTech Challenge (EESTEC Technology Challenge) is an international student competition, which deals with topics related to the subject of Electrical Engineering. It consists of a Local Round in which students from every EESTEC branch in Europe compete locally. The winners also take part in the Final Round which takes place in a European city. The aim of the Project is to provide academic knowledge to the participants, as well as to create a strong international network of students.",
      }),
  EventCategory(
      name: "JobFair Xanthi",
      color: Color.fromRGBO(118, 32, 46, 1),
      image: "jobfair.png",
      desc: {
        "greek":
            "Το JobFair είναι μια διημερίδα επαγγελματικού προσανατολισμού που διοργανώνεται από την EESTEC LC Xanthi και απευθύνεται σε φοιτητές πολυτεχνικών σχολών. Στόχος του event είναι να δημιουργήσει μια πρώτη επαφή ανάμεσα στους φοιτητές και την αγορά εργασίας, δίνοντάς τους την ευκαιρία να πάρουν μια γεύση του επιχειρηματικού κόσμου.",
        "english":
            "JobFair is a two-day professional orientation event organized by EESTEC LC Xanthi for students of technical colleges. The aim of the event is to create a first contact between students and the job market, giving them the opportunity to get a taste of the business world.",
      })
];
