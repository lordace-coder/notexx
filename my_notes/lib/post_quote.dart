import 'package:flutter/material.dart';
import 'client.dart';

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

  void submitData() {
    postdata["quote"] = quoteTextController.text;
    postdata["by"] = nameTextController.text;
    postnewquote(postdata);
    clearAll();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      child: Column(
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
                setState(() {
                  submitData();
                  print(postdata);
                });
              },
              child: const Text(
                "Submit",
                style: TextStyle(fontSize: 19.0),
              ),
            ),
          )
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
