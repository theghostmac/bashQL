import "package:json_annotation/json_annotation.dart";
import "dart:convert";

part "stock_data.g.dart";

@JsonSerializable()
class StockData {
  final String feedData;
  final String strategy;
  final String stockQuant;
  final String description;
  StockData(this.feedData, this.strategy, this.stockQuant, this.description);

  factory StockData.fromJson(Map<String, dynamic> json) =>
      _$StockDataFromJson(json);
}
