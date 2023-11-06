import "dart:io";

import "package:forexql/dataclient/endpoint.dart";

import "./stock_data.dart";
import "package:json_annotation/json_annotation.dart";
import "dart:convert";
import "dart:async";
import "package:http/http.dart" as http;

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

  static Future<List<Stock>> fetchStocks() async {
    var url = Endpoint.uri("/stocks");
    var resp = await http.get(url.toString() as Uri);
    if (resp.statusCode != HttpStatus.ok) throw ("bad response code");
    List<Stock> stocks = [];
    if (json.decode(resp.body) == null) throw ("empty response");
    for (var res in json.decode(resp.body)) {
      stocks.add(Stock.fromJson(res));
    }
    return stocks;
  }

  static Future<Stock> fetchSingleStockData(int stockId) async {
    var url = Endpoint.uri("/stock/$stockId");
    var resp = await http.get(url.toString() as Uri);
    if (resp.statusCode != HttpStatus.ok) throw ("error fetching single data");
    var dataResponse = json.decode(resp.body);
    var result = Stock.fromJson(dataResponse);
    return result;
  }
}
