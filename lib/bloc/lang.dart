import 'package:flutter_bloc/flutter_bloc.dart';

class Language extends Cubit<String> {
  Language() : super("el");

  void changeLang(String lang) {
    emit(lang);
  }
}
