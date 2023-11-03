import 'package:forexql/models/stock.dart';
import 'package:forexql/models/stock_data.dart';

class MockStock {
  static final List<Stock> stock = [
    Stock(
      1,
      "appl",
      23.0,
      21.0,
      18.0,
      "https://cdn-icons-png.flaticon.com/512/0/747.png",
      [StockData("random feed", "day trade", "jim")],
    ),
    Stock(
      2,
      "googl",
      45.0,
      41.0,
      28.0,
      "https://icon-library.com/images/google-icon-logo/google-icon-logo-14.jpg",
      [StockData("random feed", "day trade", "tutu")],
    )
  ];

  static List<Stock> fetchAllStocks() {
    return MockStock.stock;
  }

  static Stock fetchSingleStock(int index) {
    return MockStock.stock[index];
  }
}
