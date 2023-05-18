import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/quotes.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Quotes myquote = Provider.of<Quotes>(context);
    // myquote.getquoteslist();
    List? myquoteslist = myquote.quote!.allQuotes;
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20.4),
        color: Colors.black12,
        child: ListView.builder(
            itemCount: myquoteslist!.length,
            itemBuilder: (context, int i) {
              return GestureDetector(
                onTap: () {
                  debugPrint('${myquoteslist[i]}');
                },
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text("${myquoteslist[i]['by']}"),
                  trailing: const Icon(Icons.open_in_browser),
                ),
              );
            }),
      ),
    );
  }
}
