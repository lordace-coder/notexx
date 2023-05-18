import 'package:flutter/material.dart';
import '../client.dart' as client;
import 'data_model.dart';

class Quotes extends ChangeNotifier {
  QuotesModel? quote;

  // void getquotes() async {
  //   quote = await client.getnewquotes();
  //   notifyListeners();
  // }

  void postquotes() async {}

  void getquoteslist() async {
    quote = await client.getquoteslist();
    notifyListeners();
  }
}
