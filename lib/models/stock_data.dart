import "package:json_annotation/json_annotation.dart";
import "dart:convert";

part "stock_data.g.dart";

@JsonSerializable()
class StockData {
  final double day;
  final double price;
  final String stockQuant;
  final String description;
  StockData(this.day, this.price, this.stockQuant, this.description);

  factory StockData.fromJson(Map<String, dynamic> json) =>
      _$StockDataFromJson(json);
}
