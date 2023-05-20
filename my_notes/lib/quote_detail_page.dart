import 'package:flutter/material.dart';

class QuoteDetailPage extends StatelessWidget {
  final Map quotesDetail;
  const QuoteDetailPage({super.key, required this.quotesDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Quotes App")),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "${quotesDetail['quote']}",
              style: style(),
            ),
            Text(
              "${quotesDetail['by']}",
              style: style(),
            ),
            Text(
              "${quotesDetail['date_added'] ?? 'no data'}",
              style: style(),
            ),
          ]),
        ),
      ),
    );
  }
}

TextStyle style() {
  return const TextStyle(fontSize: 27.2);
}
