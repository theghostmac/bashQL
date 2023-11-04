import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:forexql/models/stock.dart';
import 'package:forexql/models/stock_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ForexDetail extends StatelessWidget {
  final Stock stock;
  const ForexDetail(this.stock, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Stock detail")),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: stockDetail(stock, 0))
            ],
          ),
        ));
  }

  List<Widget> stockDetail(Stock stock, int index) {
    return [
      Image.network(
        stock.assetIcon,
        fit: BoxFit.fitWidth,
      ),
      Text(
        stock.stockName,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple),
      ),
      stockDescription(stock.strategies, index),
      Text(
        "${stock.stockStartingDayPrice}",
        textAlign: TextAlign.left,
      ),
    ];
  }

  Widget stockDescription(List<StockData> stockdata, int index) {
    return Text(
      stockdata[index].description,
      textAlign: TextAlign.left,
    );
  }
}
