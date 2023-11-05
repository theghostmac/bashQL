import "package:flutter/material.dart";
import "package:forexql/mocks/mock_stock.dart";
import "forex.dart";

void main() {
  final mockStock = MockStock.fetchAllStocks();
  runApp(MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.teal,
          primaryColor: Colors.tealAccent.withOpacity(0.1)),
      home: Forex(mockStock)));
}
