class QuotesModel {
  final Map? quote;
  QuotesModel({required this.quote});

  factory QuotesModel.fromJson(Map data) {
    return QuotesModel(quote: data);
  }
}
