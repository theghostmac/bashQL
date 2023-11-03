import "package:test/test.dart";
import "package:forexql/mocks/mock_stock.dart";

void main() {
  test("test that stocks data not empty", () {
    final stocks = MockStock.fetchAllStocks();
    expect(stocks, isNotNull);
    expect(stocks[0].stockName, equals("appl"));
    expect(stocks[0].stockId, isNonNegative);
  });

  test("test that stock data not available is not returned", () {
    final stocks = MockStock.fetchAllStocks();
    expect(stocks[2], isNull);
    expect(stocks[2].stockId, isZero);
  });
}
