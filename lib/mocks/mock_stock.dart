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
      "https://images.pexels.com/photos/247676/pexels-photo-247676.jpeg?auto=compress&cs=tinysrgb&w=800",
      [
        StockData(23, 14000, "jim",
            "During a program on CNBC, Michael Saylor stated that if institutional investors take on a larger role in Bitcoin, the cryptocurrency market will mature and filter out malicious individuals and more speculative cryptocurrency projects.")
      ],
    ),
    Stock(
      2,
      "goog",
      45.0,
      41.0,
      28.0,
      "https://images.pexels.com/photos/247676/pexels-photo-247676.jpeg?auto=compress&cs=tinysrgb&w=800",
      [
        StockData(12, 21000, "tutu",
            "During a program on CNBC, Michael Saylor stated that if institutional investors take on a larger role in Bitcoin, the cryptocurrency market will mature and filter out malicious individuals and more speculative cryptocurrency projects.")
      ],
    ),
    Stock(
      3,
      "booql",
      35.0,
      31.0,
      18.0,
      "https://images.pexels.com/photos/247676/pexels-photo-247676.jpeg?auto=compress&cs=tinysrgb&w=800",
      [
        StockData(12, 21000, "tutu",
            "During a program on CNBC, Michael Saylor stated that if institutional investors take on a larger role in Bitcoin, the cryptocurrency market will mature and filter out malicious individuals and more speculative cryptocurrency projects.")
      ],
    ),
    Stock(
      4,
      "ardiuno",
      55.0,
      51.0,
      38.0,
      "https://images.pexels.com/photos/247676/pexels-photo-247676.jpeg?auto=compress&cs=tinysrgb&w=800",
      [
        StockData(12, 21000, "tutu",
            "During a program on CNBC, Michael Saylor stated that if institutional investors take on a larger role in Bitcoin, the cryptocurrency market will mature and filter out malicious individuals and more speculative cryptocurrency projects.")
      ],
    ),
    Stock(
      5,
      "nvida",
      65.0,
      61.0,
      48.0,
      "https://images.pexels.com/photos/247676/pexels-photo-247676.jpeg?auto=compress&cs=tinysrgb&w=800",
      [
        StockData(12, 21000, "tutu",
            "During a program on CNBC, Michael Saylor stated that if institutional investors take on a larger role in Bitcoin, the cryptocurrency market will mature and filter out malicious individuals and more speculative cryptocurrency projects.")
      ],
    ),
    Stock(
      6,
      "meta",
      75.0,
      71.0,
      58.0,
      "https://images.pexels.com/photos/247676/pexels-photo-247676.jpeg?auto=compress&cs=tinysrgb&w=800",
      [
        StockData(12, 21000, "tutu",
            "During a program on CNBC, Michael Saylor stated that if institutional investors take on a larger role in Bitcoin, the cryptocurrency market will mature and filter out malicious individuals and more speculative cryptocurrency projects.")
      ],
    ),
    Stock(
      7,
      "tesla",
      85.0,
      81.0,
      68.0,
      "https://images.pexels.com/photos/247676/pexels-photo-247676.jpeg?auto=compress&cs=tinysrgb&w=800",
      [
        StockData(12, 21000, "tutu",
            "During a program on CNBC, Michael Saylor stated that if institutional investors take on a larger role in Bitcoin, the cryptocurrency market will mature and filter out malicious individuals and more speculative cryptocurrency projects.")
      ],
    ),
    Stock(
      8,
      "cnbc",
      95.0,
      91.0,
      78.0,
      "https://images.pexels.com/photos/247676/pexels-photo-247676.jpeg?auto=compress&cs=tinysrgb&w=800",
      [
        StockData(12, 21000, "tutu",
            "During a program on CNBC, Michael Saylor stated that if institutional investors take on a larger role in Bitcoin, the cryptocurrency market will mature and filter out malicious individuals and more speculative cryptocurrency projects.")
      ],
    ),
    Stock(
      9,
      "pushr",
      15.0,
      11.0,
      38.0,
      "https://images.pexels.com/photos/247676/pexels-photo-247676.jpeg?auto=compress&cs=tinysrgb&w=800",
      [
        StockData(12, 21000, "tutu",
            "During a program on CNBC, Michael Saylor stated that if institutional investors take on a larger role in Bitcoin, the cryptocurrency market will mature and filter out malicious individuals and more speculative cryptocurrency projects.")
      ],
    )
  ];

  static List<Stock> fetchAllStocks() {
    return MockStock.stock;
  }

  static Stock fetchSingleStock(int index) {
    return MockStock.stock[index];
  }
}
