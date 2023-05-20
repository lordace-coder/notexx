import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../client.dart' as client;
import 'data_model.dart';

class Quotes extends ChangeNotifier {
  QuotesModel? quote;
  Response? response;
  bool loading = false;

  Future<Response?> postquotes(Map data) async {
    loading = true;
    notifyListeners();
    response = await client.postnewquote(data);
    loading = false;
    notifyListeners();
    return response;
  }

  void getquoteslist() async {
    quote = await client.getquoteslist();
    notifyListeners();
  }

  bool deletequote(int pk) {
    client.deletequote(pk).then((value) => response = value);
    if (response?.statusCode == 204) {
      notifyListeners();
      
      return true;
    }

    return false;
  }
}
