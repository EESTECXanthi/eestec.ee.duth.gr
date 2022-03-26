//<year>_<position>_<english name>_<greek name>
import 'package:flutter/material.dart';

class BoardModel {
  final int year;
  final BoardMember chairperson;
  final BoardMember contactPerson;
  final BoardMember externalAffairs;
  final BoardMember internalAffairs;
  final BoardMember treasurer;

  BoardModel({
    required this.year,
    required this.chairperson,
    required this.contactPerson,
    required this.externalAffairs,
    required this.internalAffairs,
    required this.treasurer,
  });
}

class BoardMember {
  final BoardPosition position;
  final String nameGreek;
  final String nameEnglish;
  final String image;

  static const Map<String, BoardPosition> toEnum = {
    "Chairperson": BoardPosition.chairperson,
    "Treasurer": BoardPosition.treasurer,
    "External Affairs": BoardPosition.externalAffairs,
    "Internal Affairs": BoardPosition.internalAffairs,
    "Contact Person": BoardPosition.contactPerson,
  };

  BoardMember({
    required String position,
    required this.nameGreek,
    required this.nameEnglish,
    required this.image,
  }) : position = toEnum[position] ?? BoardPosition.falseRead;

  String get positionEnglish {
    switch (position) {
      case BoardPosition.chairperson:
        return "Chair Person";
      case BoardPosition.treasurer:
        return "Treasurer";
      case BoardPosition.externalAffairs:
        return "V-C for External Affairs";
      case BoardPosition.internalAffairs:
        return "V-C for Internal Affairs";
      case BoardPosition.contactPerson:
        return "Contact Person";
      case BoardPosition.falseRead:
        return "ERROR";
    }
  }

  String get positionGreek {
    switch (position) {
      case BoardPosition.chairperson:
        return "Πρόεδρος";
      case BoardPosition.treasurer:
        return "Ταμίας";
      case BoardPosition.externalAffairs:
        return "Αντιπρόεδρος Εξωτερικών Υποθέσεων";
      case BoardPosition.internalAffairs:
        return "Αντιπρόεδρος Εσωτερικών Υποθέσεων";
      case BoardPosition.contactPerson:
        return "Υπεύθυνος Επικοινωνίας";
      case BoardPosition.falseRead:
        return "ERROR";
    }
  }
}

enum BoardPosition {
  falseRead,
  chairperson,
  contactPerson,
  externalAffairs,
  internalAffairs,
  treasurer,
}
