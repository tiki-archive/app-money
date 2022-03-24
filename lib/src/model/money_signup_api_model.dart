class MoneySignUpModel {
  int? total;

  MoneySignUpModel({this.total});

  MoneySignUpModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      total = json['total'];
    }
  }

  Map<String, dynamic> toJson() => {'total': total};
}
