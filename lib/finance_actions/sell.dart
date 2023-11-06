import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class Sell extends StatelessWidget {
  const Sell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sell stock"),
        actions: const [Icon(Icons.search)],
      ),
      body: SingleChildScrollView(child: sellStockInfo()),
    );
  }

  /// text field with stock name to purchase and another for price
  Widget sellStockInfo() {
    return Column(
      children: [
        ListTile(
          minVerticalPadding: 10.0,
          title: Text("€549.65",
              style: GoogleFonts.alegreya(
                  fontSize: 45.0, fontWeight: FontWeight.bold)),
          trailing: const CircleAvatar(
            backgroundImage: AssetImage("assets/images/userheader.jpeg"),
          ),
          subtitle: Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "+1.92 (+3.29%)",
                    style: GoogleFonts.lato(color: Colors.green),
                  ),
                  const Icon(
                    Icons.arrow_upward_rounded,
                    size: 10.0,
                    color: Colors.green,
                  ),
                  Text("today", style: GoogleFonts.lato(color: Colors.green))
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
                      style:
                          GoogleFonts.lato(color: Colors.grey, fontSize: 10.0))
                ],
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Stock to sell",
                  helperStyle:
                      GoogleFonts.alegreya(color: Colors.white, fontSize: 20.0),
                  contentPadding: const EdgeInsets.all(30.0)),
            )),
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "amount to sell",
                  helperStyle:
                      GoogleFonts.alegreya(color: Colors.white, fontSize: 20.0),
                  contentPadding: const EdgeInsets.all(30.0)),
            )),
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "secret selling code",
                  helperStyle:
                      GoogleFonts.alegreya(color: Colors.white, fontSize: 20.0),
                  contentPadding: const EdgeInsets.all(30.0)),
            )),
        sellStockInfoButton(),
      ],
    );
  }

  /// Button to submit the stock purchase
  Widget sellStockInfoButton() {
    return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(20.0)),
          textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(fontSize: 20.0)),
        ),
        child: Text(
          "Sell stock",
          style: GoogleFonts.alegreya(color: Colors.white, fontSize: 20.0),
        ));
  }
}
