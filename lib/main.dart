import "package:flutter/material.dart";
import "package:forexql/mocks/mock_stock.dart";
import "forex.dart";

void main() {
  final mockStock = MockStock.fetchAllStocks();
  runApp(MaterialApp(home: Forex(mockStock)));
}
