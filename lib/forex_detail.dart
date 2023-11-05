import 'package:flutter/material.dart';
import 'package:forexql/models/stock.dart';
import 'package:forexql/styles/styles.dart';

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: stockDetail(stock))
            ],
          ),
        ));
  }

  List<Widget> stockDetail(Stock stock) {
    return [
      stockBannerImage(stock.assetIcon, 1000.0, 170.0),
      stockAssetName(stock),
      Column(children: stockDescription(stock)),
    ];
  }

  Widget stockExtraInfo(Stock stock) {
    return Text(
      "${stock.stockStartingDayPrice}",
      textAlign: TextAlign.left,
    );
  }

  Widget stockAssetName(Stock stock) {
    return Container(
        padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 15.0),
        child: Text(
          stock.stockName,
          style: Style.headerLarge,
        ));
  }

  Widget stockBannerImage(String url, double width, double height) {
    return Container(
        constraints: BoxConstraints.tightFor(width: width, height: height),
        child: Image.network(
          url,
          fit: BoxFit.fitWidth,
        ));
  }

  List<Widget> stockDescription(Stock stock) {
    List<Widget> result = [];
    for (var i = 0; i < stock.strategies.length; i++) {
      result.add(Container(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            stock.strategies[i].description,
            textAlign: TextAlign.left,
            style: Style.normalText,
          )));
    }
    return result;
  }
}
