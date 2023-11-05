import "package:flutter/material.dart";
import "package:forexql/ext.dart";
import "package:forexql/forex_detail.dart";
import "package:forexql/styles/styles.dart";
import "package:google_fonts/google_fonts.dart";
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
              child: Image.asset(
                "assets/images/tbl.png",
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
              )),
          title: const Text("Bool Forex"),
          actions: const [Icon(Icons.search, color: Colors.black54)],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 30.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text("€549.65",
                          style: GoogleFonts.alegreya(
                              fontSize: 45.0, fontWeight: FontWeight.bold)),
                      trailing: ElevatedButton.icon(
                          icon: const Icon(Icons.wallet_rounded),
                          onPressed: () {},
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    const EdgeInsets.all(20.0)),
                          ),
                          label: Text(
                            "Withdraw",
                            style: GoogleFonts.alegreya(
                                color: Colors.white, fontSize: 16.0),
                          )),
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
                              Text("today",
                                  style: GoogleFonts.lato(color: Colors.green))
                            ],
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Closed: 3 Nov, 19:59 GMT-4",
                                style: GoogleFonts.lato(
                                    color: Colors.grey, fontSize: 10.0),
                              ),
                              Text("  • Disclaimer",
                                  style: GoogleFonts.lato(
                                      color: Colors.grey, fontSize: 10.0))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
            ListView.separated(
              itemCount: stock.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return stockPreferredTileData(context, stock, index);
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            ),
          ],
        )));
  }

  Widget stockCard() {
    return Card(
        elevation: 20,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        margin: const EdgeInsets.fromLTRB(9.0, 15.0, 9.0, 9.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 239, 186, 166),
                  Color.fromARGB(255, 224, 219, 219),
                ],
              )),
          child: SizedBox(
              width: 300,
              height: 500,
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // header for card
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage("/images/xaomi.png"),
                            backgroundColor: Colors.transparent,
                            radius: 25,
                          ),
                          Row(
                            children: [
                              Column(children: [
                                Container(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Column(children: [
                                      Text(
                                        "Xiaomi",
                                        style: GoogleFonts.redHatDisplay(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        "XMO",
                                        style: Style.normalText,
                                      )
                                    ]))
                              ])
                            ],
                          )
                        ],
                      ),
                      // money section
                      Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 10.0, 10.0, 10.0),
                              child: Column(children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "£1,045,983",
                                        style: GoogleFonts.lato(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Icon(
                                        Icons.arrow_drop_down_circle_rounded,
                                        size: 15.0,
                                        color: Colors.green,
                                      ),
                                      Text(
                                        "£1.12",
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.normal),
                                      ),
                                      const Icon(
                                        Icons.show_chart_rounded,
                                        color: Colors.green,
                                      )
                                    ])
                              ])),
                        ],
                      )
                    ],
                  ))),
        ));
  }

  Widget stockPreferredTileData(
      BuildContext context, List<Stock> stock, int index) {
    return ListTile(
      leading: handleStockImageData(stock[index].assetIcon),
      trailing: const Icon(
        Icons.more_vert_rounded,
        color: Colors.teal,
      ),
      title: Text(
        stock[index].stockName.capitalize(),
        style:
            GoogleFonts.alegreya(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      subtitle: Text(
        "Selling price: €${stock[index].stockPrice}",
        style: GoogleFonts.alegreya(color: Colors.green),
      ),
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ForexDetail(stock[index])))
      },
    );
  }

  Widget handleStockImageData(String url) {
    return Image.asset(
      url,
      height: 150.0,
      width: 100.0,
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
