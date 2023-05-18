import 'package:flutter/material.dart';
import 'package:flutter_provider/flutter_provider.dart';
import '../client.dart';
import 'dart:io';
import 'data_model.dart';

class Quotes extends ChangeNotifier {
  QuotesModel? quote;

  void getquotes() async {
    quote = await getquotes();
  }
}
