import "package:flutter/material.dart";
import "./models/stock.dart";

class Forex extends StatelessWidget {
  final List<Stock> stock;
  const Forex(this.stock, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.home,
          color: Colors.deepPurple,
        ),
        title: const Text("Bash Forex"),
        actions: const [Icon(Icons.search, color: Colors.black54)],
      ),
      body: ListView.builder(
          itemCount: stock.length,
          itemBuilder: (context, index) {
            return stockTileData(stock, index);
          }),
    );
  }

  Widget stockTileData(List<Stock> stock, int index) {
    return ListTile(
      leading: Image.asset("demo.png"),
      title: Text(stock[index].stockName),
      subtitle: stockTileMultipleData(stock, index),
    );
  }

  Widget stockTileMultipleData(List<Stock> stock, int index) {
    return Column(
      children: [
        Text("${stock[index].stockPrice}"),
        Text("${stock[index].stockStartingDayPrice}"),
        Text("${stock[index].stockEndingDayPrice}")
      ],
    );
  }
}
