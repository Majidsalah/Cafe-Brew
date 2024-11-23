class Rating {
  double? rate;

  Rating({this.rate});

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: (json['rate'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'rate': rate,
      };
}
