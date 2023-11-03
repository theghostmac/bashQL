import "package:flutter/material.dart";
import "package:forexql/forex_detail.dart";
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
            return stockPreferredTileData(context, stock, index);
          }),
    );
  }

  Widget stockPreferredTileData(
      BuildContext context, List<Stock> stock, int index) {
    return ListTile(
      leading: handleStockImageData(stock[index]),
      title: Text(stock[index].stockName),
      subtitle:Text("current stock price: ${stock[index].stockPrice}"),
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ForexDetail(stock[index])))
      },
    );
  }

  Widget handleStockImageData(Stock stock) {
    return Container(
      constraints: const BoxConstraints.tightFor(width: 150.0),
      child: Image.network(
        stock.assetIcon,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget stockTileMultipleData(List<Stock> stock, int index) {
    return Column(
      children: [
        Text("current stock price: ${stock[index].stockPrice}"),
        Text("${stock[index].stockStartingDayPrice}"),
        Text("${stock[index].stockEndingDayPrice}")
      ],
    );
  }
}
