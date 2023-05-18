class QuotesModel {
  final Map? quote;
  final List? allQuotes;
  QuotesModel({required this.quote, required this.allQuotes});

  factory QuotesModel.fromJson(Map data) {
    return QuotesModel(quote: data, allQuotes: []);
  }

  factory QuotesModel.fromList(List data) {
    // print(data);
    return QuotesModel(quote: {}, allQuotes: data);
  }
}
