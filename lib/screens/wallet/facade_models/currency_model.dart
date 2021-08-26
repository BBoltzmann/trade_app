class Currency {
  final int? code;
  final String? name;
  final CurrencyType? currencyType;

  Currency({this.code, this.name, this.currencyType});
}

enum CurrencyType {
  crypto,
  fiat,
}
