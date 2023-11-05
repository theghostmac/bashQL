import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:forexql/ext.dart';
import 'package:forexql/models/stock.dart';
import 'package:forexql/styles/styles.dart';
import 'package:google_fonts/google_fonts.dart';

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
      Container(
        margin: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 30.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("€176.65",
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
            textAlign: TextAlign.left,
            style: Style.normalText,
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
              color: Colors.deepPurple.withOpacity(0.5),
              belowBarData: BarAreaData(
                show: true,
                color: Colors.purpleAccent.withOpacity(0.1),
                cutOffY: cutOffYValue,
                applyCutOffY: true,
              ),
              aboveBarData: BarAreaData(
                show: true,
                color: Colors.lightGreen.withOpacity(0.5),
                cutOffY: cutOffYValue,
                applyCutOffY: true,
              ),
              dotData: FlDotData(
                show: false,
              ),
            ),
          ],
          borderData: FlBorderData(border: const Border(bottom: BorderSide())),
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
