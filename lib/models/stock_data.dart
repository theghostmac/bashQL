import "package:json_annotation/json_annotation.dart";
import "dart:convert";

part "stock_data.g.dart";

@JsonSerializable()
class StockData {
  final String feedData;
  final String strategy;
  final String stockQuant;
  StockData(this.feedData, this.strategy, this.stockQuant);
}
