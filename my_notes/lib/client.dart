import 'dart:convert';

import 'package:http/http.dart' as http;
import 'models/data_model.dart';

const validUrl = '10.0.2.2';

Future<QuotesModel?> getquotes() async {
  http.Response response;
  QuotesModel? instance;
  try {
    response = await http.get(Uri.parse('$validUrl:8000/quotes'));
    if (response.statusCode == 200) {
      // return an instance of the data
      var newdata = jsonDecode(response.body);
      instance = QuotesModel.fromJson(newdata);
      print(instance.quote);
      return instance;
    }
  } catch (e) {
    print(e.toString());
  }
  return instance;
}
