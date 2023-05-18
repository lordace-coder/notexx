import 'package:flutter/material.dart';

class QuoteDetailPage extends StatelessWidget {
  final Map quotes_detail;
  const QuoteDetailPage({super.key, required this.quotes_detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Quotes App")),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "${quotes_detail['quote']}",
            style: style(),
          ),
          Text(
            "${quotes_detail['by']}",
            style: style(),
          ),
          Text(
            "${quotes_detail['date_added'] ?? 'no data'}",
            style: style(),
          ),
        ]),
      ),
    );
  }
}

TextStyle style() {
  return const TextStyle(fontSize: 27.2);
}
