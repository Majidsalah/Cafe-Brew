class Category {
  bool? hot;
  bool? cold;

  Category({this.hot, this.cold});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        hot: json['hot'] as bool?,
        cold: json['cold'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'hot': hot,
        'cold': cold,
      };
}
