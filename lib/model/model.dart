import 'dart:convert';

List<Coin> coinModelFromJson(String str) =>
    List<Coin>.from(json.decode(str).map((x) => Coin.fromJson(x)));

String coinModelToJson(List<Coin> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Coin {
  String name;
  String id;
  String symbol;
  double price;
  double price_change_percentage;

  Coin(
      {required this.name,
      required this.id,
      required this.symbol,
      required this.price,
      required this.price_change_percentage});

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
    id: json["id"],
    name: json["name"],
    symbol: json["symbol"],
    price: json["market_data"]["current_price"]["usd"],
    price_change_percentage: json["market_data"]["price_change_percentage_24h"] ,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "symbol": symbol,
    "price": price,
    "price_change_percentage": price_change_percentage,

  };
}
