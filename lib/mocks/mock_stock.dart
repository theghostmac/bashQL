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
      "https://images.pexels.com/photos/10678683/pexels-photo-10678683.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      [StockData("random feed", "day trade", "jim")],
    ),
    Stock(
      2,
      "googl",
      45.0,
      41.0,
      28.0,
      "https://images.pexels.com/photos/10678683/pexels-photo-10678683.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
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
