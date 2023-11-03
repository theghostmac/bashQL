import "package:flutter/material.dart";

class Forex extends StatelessWidget {
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
        body: null);
  }
}
