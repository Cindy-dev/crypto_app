// To parse this JSON data, do
//
//     final cryptoModel = cryptoModelFromJson(jsonString);

import 'dart:convert';

CryptoModel cryptoModelFromJson(String str) =>
    CryptoModel.fromJson(json.decode(str));

String cryptoModelToJson(CryptoModel data) => json.encode(data.toJson());

class CryptoModel {
  CryptoModel({
    required this.result,
    required this.cursor,
    required this.allowance,
  });

  Map<String, Result> result;
  Cursor cursor;
  Allowance allowance;

  factory CryptoModel.fromJson(Map<String, dynamic> json) => CryptoModel(
        result: Map.from(json["result"])
            .map((k, v) => MapEntry<String, Result>(k, Result.fromJson(v))),
        cursor: Cursor.fromJson(json["cursor"]),
        allowance: Allowance.fromJson(json["allowance"]),
      );

  Map<String, dynamic> toJson() => {
        "result": Map.from(result)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "cursor": cursor.toJson(),
        "allowance": allowance.toJson(),
      };
}

class Allowance {
  Allowance({
    required this.cost,
    required this.remaining,
    required this.remainingPaid,
    required this.account,
  });

  int cost;
  int remaining;
  int remainingPaid;
  String account;

  factory Allowance.fromJson(Map<String, dynamic> json) => Allowance(
        cost: json["cost"],
        remaining: json["remaining"],
        remainingPaid: json["remainingPaid"],
        account: json["account"],
      );

  Map<String, dynamic> toJson() => {
        "cost": cost,
        "remaining": remaining,
        "remainingPaid": remainingPaid,
        "account": account,
      };
}

class Cursor {
  Cursor({
    required this.last,
    required this.hasMore,
  });

  String last;
  bool hasMore;

  factory Cursor.fromJson(Map<String, dynamic> json) => Cursor(
        last: json["last"],
        hasMore: json["hasMore"],
      );

  Map<String, dynamic> toJson() => {
        "last": last,
        "hasMore": hasMore,
      };
}

class Result {
  Result({
    required this.price,
    required this.volume,
    required this.volumeBase,
    required this.volumeQuote,
    required this.volumeUsd,
    required this.volumeContracts,
    required this.volumeSettlement,
  });

  Price price;
  double volume;
  double volumeBase;
  double volumeQuote;
  double volumeUsd;
  double volumeContracts;
  double volumeSettlement;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        price: Price.fromJson(json["price"]),
        volume: json["volume"].toDouble(),
        volumeBase: json["volumeBase"].toDouble(),
        volumeQuote: json["volumeQuote"].toDouble(),
        volumeUsd:
            json["volumeUSD"] == null ? null : json["volumeUSD"].toDouble(),
        volumeContracts: json["volumeContracts"] == null
            ? null
            : json["volumeContracts"].toDouble(),
        volumeSettlement: json["volumeSettlement"] == null
            ? null
            : json["volumeSettlement"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "price": price.toJson(),
        "volume": volume,
        "volumeBase": volumeBase,
        "volumeQuote": volumeQuote,
        "volumeUSD": volumeUsd == null ? null : volumeUsd,
        "volumeContracts": volumeContracts == null ? null : volumeContracts,
        "volumeSettlement": volumeSettlement == null ? null : volumeSettlement,
      };
}

class Price {
  Price({
    required this.last,
    required this.high,
    required this.low,
    required this.change,
  });

  double last;
  double high;
  double low;
  Change change;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        last: json["last"].toDouble(),
        high: json["high"].toDouble(),
        low: json["low"].toDouble(),
        change: Change.fromJson(json["change"]),
      );

  Map<String, dynamic> toJson() => {
        "last": last,
        "high": high,
        "low": low,
        "change": change.toJson(),
      };
}

class Change {
  Change({
    required this.percentage,
    required this.absolute,
  });

  double percentage;
  double absolute;

  factory Change.fromJson(Map<String, dynamic> json) => Change(
        percentage: json["percentage"].toDouble(),
        absolute: json["absolute"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "percentage": percentage,
        "absolute": absolute,
      };
}
