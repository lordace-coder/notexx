import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/quotes.dart';
import 'quote_detail_page.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({super.key}); // The parameter must be 'Key? key'

  @override
  Widget build(BuildContext context) {
    Quotes myquote = Provider.of<Quotes>(context);
    List<dynamic>? myquoteslist = [];
    myquote.getquoteslist();
    myquoteslist = myquote.quote!.allQuotes;

    // Use a null-aware operator to access `myquote.quote!.allQuotes`
    // Use the correct data type of the list

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20.4),
        color: Colors.black12,
        child: myquoteslist!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              )
            : ListView.builder(
                itemCount: myquoteslist.length,
                itemBuilder: (context, int i) {
                  return GestureDetector(
                    onTap: () {
                      if (myquoteslist![i] != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuoteDetailPage(
                                quotes_detail: myquoteslist![i]),
                          ),
                        );
                      }
                    },
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text("${myquoteslist![i]['by']}"),
                      trailing: const Icon(Icons.open_in_browser),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
