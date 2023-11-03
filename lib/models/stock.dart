import "./stock_data.dart";
import "package:json_annotation/json_annotation.dart";
import "dart:convert";

part "stock.g.dart";

@JsonSerializable()
class Stock {
  final int stockId;
  final String stockName;
  final double stockPrice;
  final double stockStartingDayPrice;
  final double stockEndingDayPrice;
  final String assetIcon;
  final List<StockData> strategies;
  Stock(
      this.stockId,
      this.stockName,
      this.stockPrice,
      this.stockStartingDayPrice,
      this.stockEndingDayPrice,
      this.assetIcon,
      this.strategies);

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);
}
