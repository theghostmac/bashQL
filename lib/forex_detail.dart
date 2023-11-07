import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:forexql/ext.dart';
import 'package:forexql/finance_actions/buy.dart';
import 'package:forexql/finance_actions/sell.dart';
import 'package:forexql/models/stock.dart';
import 'package:forexql/styles/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class ForexDetail extends StatelessWidget {
  final Stock stock;
  const ForexDetail(this.stock, {super.key});
  final int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color.fromRGBO(139, 92, 246, 1.0),
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded), label: "Account"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.wallet_giftcard_rounded), label: "Balance"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.widgets_rounded), label: "Menu"),
            ]),
        appBar: AppBar(title: Text("${stock.stockName.capitalize()} Stocks")),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: stockDetail(context, stock))
            ],
          ),
        ));
  }

  List<Widget> stockDetail(BuildContext context, Stock stock) {
    return [
      Container(
        margin: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 30.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("€${stock.stockPrice}",
                  style: GoogleFonts.alegreya(
                      fontSize: 45.0, fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "-0.92 (-0.52%)",
                style: GoogleFonts.lato(color: Colors.red),
              ),
              const Icon(
                Icons.arrow_downward_rounded,
                size: 10.0,
                color: Colors.red,
              ),
              Text("today", style: GoogleFonts.lato(color: Colors.red))
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Closed: 3 Nov, 19:59 GMT-4",
                style: GoogleFonts.lato(color: Colors.grey, fontSize: 10.0),
              ),
              Text("  • Disclaimer",
                  style: GoogleFonts.lato(color: Colors.grey, fontSize: 10.0))
            ],
          ),
        ]),
      ),
      stockDataChart(stock),
      // stockBannerImage(stock.assetIcon, 1000.0, 170.0),
      // stockAssetName(stock),
      ListTile(
        leading: Image.asset(stock.assetIcon),
        title: Text(
          stock.stockName.capitalize(),
          style: Style.headerLarge,
        ),
        subtitle: Text("NASDAQ:${stock.stockName.capitalize()}"),
        trailing: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(20.0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.red)))),
            child: const Icon(Icons.show_chart_outlined)),
      ),
      Column(children: stockDescription(stock)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Buy(stock)))
                  },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(20.0)),
              ),
              child: Text(
                "Buy Stock",
                style:
                    GoogleFonts.alegreya(color: Colors.white, fontSize: 20.0),
              )),
          ElevatedButton(
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sell(stock)))
                  },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(20.0)),
              ),
              child: Text(
                "Sell Stock",
                style:
                    GoogleFonts.alegreya(color: Colors.white, fontSize: 20.0),
              ))
        ],
      )
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
          stock.stockName.capitalize(),
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
            textAlign: TextAlign.justify,
            style: GoogleFonts.alegreya(),
          )));
    }
    return result;
  }

  Widget stockDataChart(Stock stock) {
    const cutOffYValue = 0.0;

    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(enabled: false),
          lineBarsData: [
            LineChartBarData(
              // when y is lesser than x the graph goes down
              // when x is lesser than y the graph goes up
              // each asset should have data for flspot data
              // x would always go up, we can have a negative time : time always progresses
              spots: const [
                FlSpot(8.00, 2),
                FlSpot(10.00, 1),
                FlSpot(12.00, 4),
                FlSpot(14.00, 3),
                FlSpot(16.00, 2),
                FlSpot(18.00, 3),
                FlSpot(20.00, 2),
                FlSpot(21.00, 2),
                FlSpot(23.00, 1),
                FlSpot(24.00, 2),
              ],
              isCurved: true,
              barWidth: 2,
              color: Colors.teal.withOpacity(0.5),
              belowBarData: BarAreaData(
                show: true,
                color: const Color.fromRGBO(
                  139,
                  92,
                  246,
                  0.1,
                ),
                cutOffY: cutOffYValue,
                applyCutOffY: true,
              ),
              aboveBarData: BarAreaData(
                show: true,
                color: const Color.fromRGBO(
                  139,
                  92,
                  246,
                  0.1,
                ),
                cutOffY: cutOffYValue,
                applyCutOffY: true,
              ),
              dotData: FlDotData(
                show: false,
              ),
            ),
          ],
          borderData:
              FlBorderData(border: const Border(bottom: BorderSide.none)),
          minY: 0,
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true, reservedSize: 10)),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
                reservedSize: 10,
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 5,
              ),
            ),
          ),
          gridData: FlGridData(
            show: true,
          ),
        ),
      ),
    );
  }

  List<FlSpot> getMultipleFlspot(Stock stock) {
    List<FlSpot> spots = [];
    for (var i = 0; i < stock.strategies.length; i++) {
      spots.add(FlSpot(stock.stockStartingDayPrice, stock.stockEndingDayPrice));
    }
    return spots;
  }
}
