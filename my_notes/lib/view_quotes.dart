import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/quotes.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'quote_detail_page.dart';
import 'client.dart' as client;

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});
  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  List<dynamic>? myquoteslist = [];

  // The parameter must be 'Key? key'

  @override
  Widget build(BuildContext context) {
    Quotes myquote = Provider.of<Quotes>(context);

    myquote.getquoteslist();

    if (myquote.quote != null) {
      myquoteslist = myquote.quote?.allQuotes;
    }
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20.4),
        color: Colors.black12,
        child: myquoteslist!.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Center(
                    child: SpinKitChasingDots(
                      color: Colors.purple,
                    ),
                  ),
                  if (client.failed)
                    ElevatedButton(
                      child: const Text('retry'),
                      onPressed: () {
                        myquote.getquoteslist();
                      },
                    )
                ],
              )
            : ListView.builder(
                itemCount: myquoteslist!.length,
                itemBuilder: (context, int i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              QuoteDetailPage(quotesDetail: myquoteslist![i]),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Icon(Icons.person),
                      ),
                      title: Text("${myquoteslist![i]['by']}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          bool success =
                              myquote.deletequote(myquoteslist![i]["id"]);

                          if (success) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Center(
                                child: Text(
                                  "deleted succesfully",
                                ),
                              ),
                              duration: Duration(seconds: 2),
                            ));
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
