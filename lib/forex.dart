import "package:flutter/material.dart";
import "package:forexql/forex_detail.dart";
import "package:forexql/styles/styles.dart";
import "./models/stock.dart";

class Forex extends StatelessWidget {
  final List<Stock> stock;
  const Forex(this.stock, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            margin: const EdgeInsets.fromLTRB(20.0, 0, 0, 8.0),
            child: Image.network(
              "https://cdn.prod.website-files.com/6257adef93867e50d84d30e2/636e0a6a49cf127bf92de1e2_icon_clyde_blurple_RGB.png",
              fit: BoxFit.fitWidth,
              alignment: Alignment.center,
            )),
        title: const Text("Bash Forex"),
        actions: const [Icon(Icons.search, color: Colors.black54)],
      ),
      body: ListView.separated(
        itemCount: stock.length,
        itemBuilder: (context, index) {
          return stockPreferredTileData(context, stock, index);
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }

  Widget stockPreferredTileData(
      BuildContext context, List<Stock> stock, int index) {
    return ListTile(
      leading: handleStockImageData(stock[index]),
      trailing: const Icon(Icons.more_vert),
      title: Text(
        stock[index].stockName,
        style: Style.normalText,
      ),
      subtitle: Text(
        "current stock price: ${stock[index].stockPrice}",
        style: Style.normalText,
      ),
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ForexDetail(stock[index])))
      },
    );
  }

  Widget handleStockImageData(Stock stock) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        stock.assetIcon,
        height: 150.0,
        width: 100.0,
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
