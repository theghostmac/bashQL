import 'package:flutter/material.dart';
import 'package:forexql/models/stock.dart';

class ForexDetail extends StatelessWidget {
  final Stock stock;
  const ForexDetail(this.stock, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stock detail")),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [],
      ),
    );
  }
}
