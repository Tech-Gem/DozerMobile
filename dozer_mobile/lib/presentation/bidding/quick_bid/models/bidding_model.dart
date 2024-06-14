class BidModel {
  final String title;
  final String description;
  final int priceMin;
  final int priceMax;

  BidModel({
    required this.title,
    required this.description,
    required this.priceMin,
    required this.priceMax,
  });

  factory BidModel.fromJson(Map<String, dynamic> json) {
    return BidModel(
      title: json['title'],
      description: json['description'],
      priceMin: json['priceMin'],
      priceMax: json['priceMax'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'priceMin': priceMin,
      'priceMax': priceMax,
    };
  }
}
