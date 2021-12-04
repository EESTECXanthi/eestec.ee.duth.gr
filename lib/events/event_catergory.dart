import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class EventCategory {
  final String name;
  final Color color;
  final String desc;

  const EventCategory(
      {required this.name, required this.color, required this.desc});
}

const List<EventCategory> categories = [
  EventCategory(
      name: "Soft Skill Academy",
      color: Color.fromRGBO(154, 33, 100, 1),
      desc:
          "Το Soft Skills Academy ( SSA ) αποτελεί ένα διεθνές project που οργανώνεται απο την EESTEC. Το Soft Skills Academy περιέχει μια σειρά από διαδραστικά σεμινάρια για soft skills. Αποσκοπεί στην ενίσχυση των δεξιοτήτων των συμμετεχόντων, έτσι ώστε να αποκτήσουν σημαντικά εφόδια  για την μετέπειτα επαγγελματική τους πορεία. Τα soft skills trainings πραγματοποιούνται από την Training Team της EESTEC."),
  EventCategory(
      name: "EESTech Challenge",
      color: Color.fromRGBO(82, 189, 233, 1),
      desc:
          "To EESTech Challenge (EESTEC Technology Challenge) αποτελεί έναν διεθνή φοιτητικό διαγωνισμό, ο οποίος αφορά θέματα που σχετίζονται με το αντικείμενο του Ηλεκτρολόγου Μηχανικού. Αποτελείται από έναν Local Round στον οποίο φοιτητές από κάθε παράρτημα της EESTEC στην Ευρώπη διαγωνίζονται σε τοπικό επίπεδο. Οι νικητές συμμετέχουν και στον Final Round ο οποίος πραγματοποιείται σε μία ευρωπαϊκή πόλη. Στόχος του Project είναι να η παροχή ακαδημαϊκών γνώσεων στους συμμετέχοντες, όπως επίσης και η δημιουργία ενός ισχυρού διεθνούς δικτύου φοιτητών."),
];