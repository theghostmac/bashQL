import 'package:forexql/models/stock.dart';
import 'package:forexql/models/stock_data.dart';

class MockStock {
  static final List<Stock> stock = [
    Stock(
      1,
      "apple",
      23.0,
      10,
      40,
      "assets/images/apple.png",
      [
        StockData(23, 14000, "jim",
            "Apple Inc. is an American multinational technology company headquartered in Cupertino, California. As of March 2023, Apple is the world's biggest company by market capitalization, and with US394.3 billion the largest technology company by 2022 revenue. Apple is the world's biggest company by market capitalization, and with US394.3 billion the largest technology company by 2022 revenue")
      ],
    ),
    Stock(
      2,
      "google",
      45.0,
      12,
      28,
      "assets/images/google.png",
      [
        StockData(12, 21000, "tutu",
            "Apple Inc. is an American multinational technology company headquartered in Cupertino, California. As of March 2023, Apple is the world's biggest company by market capitalization, and with US394.3 billion the largest technology company by 2022 revenue. Apple is the world's biggest company by market capitalization, and with US394.3 billion the largest technology company by 2022 revenue")
      ],
    ),
    Stock(
      3,
      "microsoft",
      35.0,
      14,
      18,
      "assets/images/microsoft.png",
      [
        StockData(12, 21000, "tutu",
            "Apple Inc. is an American multinational technology company headquartered in Cupertino, California. As of March 2023, Apple is the world's biggest company by market capitalization, and with US394.3 billion the largest technology company by 2022 revenue. Apple is the world's biggest company by market capitalization, and with US394.3 billion the largest technology company by 2022 revenue")
      ],
    ),
    // Stock(
    //   4,
    //   "nvidia",
    //   55.0,
    //   16,
    //   38,
    //   "assets/images/nvidia.png",
    //   [
    //     StockData(12, 21000, "tutu",
    //         "Apple Inc. is an American multinational technology company headquartered in Cupertino, California. As of March 2023, Apple is the world's biggest company by market capitalization, and with US394.3 billion the largest technology company by 2022 revenue. Apple is the world's biggest company by market capitalization, and with US394.3 billion the largest technology company by 2022 revenue")
    //   ],
    // ),
    // Stock(
    //   5,
    //   "snapchat",
    //   65.0,
    //   18,
    //   48,
    //   "assets/images/snapchat.png",
    //   [
    //     StockData(12, 21000, "tutu",
    //         "Apple Inc. is an American multinational technology company headquartered in Cupertino, California. As of March 2023, Apple is the world's biggest company by market capitalization, and with US394.3 billion the largest technology company by 2022 revenue. Apple is the world's biggest company by market capitalization, and with US394.3 billion the largest technology company by 2022 revenue")
    //   ],
    // ),
    Stock(
      6,
      "meta",
      75.0,
      20,
      28,
      "assets/images/meta.png",
      [
        StockData(12, 21000, "tutu",
            "Apple Inc. is an American multinational technology company headquartered in Cupertino, California. As of March 2023, Apple is the world's biggest company by market capitalization, and with US394.3 billion the largest technology company by 2022 revenue. Apple is the world's biggest company by market capitalization, and with US394.3 billion the largest technology company by 2022 revenue")
      ],
    ),
    Stock(
      7,
      "tesla",
      85.0,
      22,
      14,
      "assets/images/tesla.webp",
      [
        StockData(12, 21000, "tutu",
            "Apple Inc. is an American multinational technology company headquartered in Cupertino, California. As of March 2023, Apple is the world's biggest company by market capitalization, and with US394.3 billion the largest technology company by 2022 revenue. Apple is the world's biggest company by market capitalization, and with US394.3 billion the largest technology company by 2022 revenue")
      ],
    ),
    Stock(
      8,
      "cnbc",
      95.0,
      24,
      34,
      "assets/images/cnbc.png",
      [
        StockData(12, 21000, "tutu",
            "Apple Inc. is an American multinational technology company headquartered in Cupertino, California. As of March 2023, Apple is the world's biggest company by market capitalization, and with US394.3 billion the largest technology company by 2022 revenue. Apple is the world's biggest company by market capitalization, and with US394.3 billion the largest technology company by 2022 revenue")
      ],
    ),
  ];

  static List<Stock> fetchAllStocks() {
    return MockStock.stock;
  }

  static Stock fetchSingleStock(int index) {
    return MockStock.stock[index];
  }
}
