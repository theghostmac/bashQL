import "dart:io";

import "package:forexql/dataclient/endpoint.dart";
import "package:json_annotation/json_annotation.dart";
import "dart:convert";
import "package:http/http.dart" as http;
import "dart:async";

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

  static Future<List<StockData>> fetchStockData() async {
    var url = Endpoint.uri("/stockdata");
    var resp = await http.get(url.toString() as Uri);
    if (resp.statusCode != HttpStatus.ok) throw ("bad response code");
    var decodedInfo = json.decode(resp.body);
    if (decodedInfo == null) throw ("empty data response");
    List<StockData> stockdata = [];
    for (var res in decodedInfo) {
      StockData.fromJson(res);
    }
    return stockdata;
  }
}
