import "package:flutter/material.dart";
import "package:forexql/mocks/mock_stock.dart";
import "forex.dart";

void main() {
  final mockStock = MockStock.fetchAllStocks();
  Map<int, Color> color = {
    50: const Color.fromRGBO(139, 92, 246, .1),
    100: const Color.fromRGBO(139, 92, 246, .2),
    200: const Color.fromRGBO(139, 92, 246, .3),
    300: const Color.fromRGBO(139, 92, 246, .4),
    400: const Color.fromRGBO(139, 92, 246, .5),
    500: const Color.fromRGBO(139, 92, 246, .6),
    600: const Color.fromRGBO(139, 92, 246, .7),
    700: const Color.fromRGBO(139, 92, 246, .8),
    800: const Color.fromRGBO(139, 92, 246, .9),
    900: const Color.fromRGBO(139, 92, 246, 1),
  };

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: const Color.fromRGBO(139, 92, 246, 1.0)),
      home: Forex(mockStock)));
}
