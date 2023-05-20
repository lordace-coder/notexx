import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/data_model.dart';

// Future<QuotesModel?> getnewquotes() async {
//   http.Response response;
//   QuotesModel? instance;
//   try {
//     response = await http.get(Uri.parse('http://10.0.2.2:8000/quotes/1'));
//     if (response.statusCode == 200) {
//       // return an instance of the data
//       var newdata = jsonDecode(response.body);
//       instance = QuotesModel.fromJson(newdata);
//       debugPrint('${instance.quote}');
//       debugPrint("my quote: ${instance.quote?["quote"]}");
//       return instance;
//     }
//   } catch (e) {
//     print(e.toString());
//   }
//   return instance;
// }
bool failed = false;
Future<QuotesModel?> getquoteslist() async {
  http.Response response;
  QuotesModel? instance;
  try {
    response = await http.get(Uri.parse('http://10.0.2.2:8000/quotes_create'));
    if (response.statusCode == 200) {
      // return an instance of the data
      var newdata = jsonDecode(response.body);
      instance = QuotesModel.fromList(newdata);
      failed = true;
      return instance;
    }
  } catch (e) {
    debugPrint(e.toString());
    failed = true;
  }

  return instance;
}

Future<http.Response?> postnewquote(Map data) async {
  http.Response? response;

  try {
    response = await http.post(Uri.parse('http://10.0.2.2:8000/quotes_create'),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode(data));
  } catch (e) {
    debugPrint(e.toString());
  }

  return response;
}

Future<http.Response?> deletequote(int pk) async {
  http.Response? response;

  try {
    response = await http.delete(
      Uri.parse('http://10.0.2.2:8000/delete/$pk'),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
  } catch (e) {
    debugPrint(e.toString());
  }

  return response;
}
