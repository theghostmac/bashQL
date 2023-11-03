import "./stock_data.dart";

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
}
