import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'models/quotes.dart';

Future<Response?>? response;

class Postpage extends StatefulWidget {
  const Postpage({super.key});

  @override
  State<Postpage> createState() => _PostpageState();
}

class _PostpageState extends State<Postpage> {
  final quoteTextController = TextEditingController();
  final nameTextController = TextEditingController();
  Map postdata = {};

  void clearAll() {
    quoteTextController.clear();
    nameTextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Post Quote",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: TextField(
                  controller: quoteTextController,
                  decoration: inputBox("Type Quote"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: TextField(
                  controller: nameTextController,
                  decoration: inputBox("Name"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.purple)),
                  onPressed: () {
                    postdata['quote'] = quoteTextController.text;
                    postdata['by'] = nameTextController.text;

                    submitdata(context: context, data: postdata);
                    clearAll();
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 19.0),
                  ),
                ),
              )
            ],
          ),
          if (Provider.of<Quotes>(context).loading)
            const Center(
              child: SpinKitCubeGrid(
                color: Colors.purple,
              ),
            ),
        ],
      ),
    );
  }
}

InputDecoration inputBox(String label) {
  return InputDecoration(
    labelText: label,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
  );
}

// return info based on the succes or failure of the post data
void submitdata({required BuildContext context, required Map data}) {
  response = Provider.of<Quotes>(context, listen: false).postquotes(data);

  response!.then((value) {
    if (value != null) {
      if (value.statusCode == 403) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            json.decode(value.body)['detail'],
          ),
          duration: const Duration(seconds: 2),
        ));
      } else if (value.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "Uploaded succesfully",
          ),
          duration: Duration(seconds: 2),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Error occured ${value.statusCode}",
          ),
          duration: const Duration(seconds: 2),
        ));
      }
    }
  });
}
