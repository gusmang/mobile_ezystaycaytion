import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:getxtest/config/colorUtils.dart';
import 'package:getxtest/config/media.dart';
import 'package:getxtest/controllers/counters.dart';
import 'package:getxtest/pages/component/widget/list/banklist.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage>
    with TickerProviderStateMixin {
  String? nokamar = "";
  final counterC = Get.put(Counter());
  //late TabController _tabController;
  List<Tab> tabList = [];
  late TabController _tabController;
  bool _customTileExpanded = false;
  bool _customTileExpanded2 = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    tabList.add(new Tab(
      text: 'Local Payment',
    ));
    tabList.add(new Tab(
      text: 'International Payment',
    ));
    _tabController = new TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemWidth = size.width;
    final double itemHeight = size.height;

    return Scaffold(
        body: Column(children: [
      Container(
          width: itemWidth,
          height: itemHeight - (itemHeight / 1.5),
          alignment: Alignment.topLeft,
          color: AppColors().primary,
          child: Column(children: [
            Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 30),
                child: Row(children: [
                  const SizedBox(
                    width: 30,
                    height: 30,
                    child:
                        Icon(Icons.chevron_left, color: Colors.white, size: 24),
                  ),
                  SizedBox(
                    width: itemWidth - 50,
                    child: const Text("Payment Pages",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontStyle: FontStyle.normal)),
                  ),
                ])),
            Container(
                padding: const EdgeInsets.only(left: 30),
                height: itemHeight - (itemHeight / 1.5) - 120,
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      SizedBox(
                        width: itemWidth - 30,
                        child: const Text("Total Price ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                                fontStyle: FontStyle.normal)),
                      ),
                      Obx(() => Container(
                            margin: const EdgeInsets.only(top: 0),
                            width: itemWidth - 30,
                            child: Text("Rp. ${counterC.scannedString[1]} , - ",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal)),
                          )),
                      Container(
                        width: itemWidth - 30,
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text("Room No ",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 14, color: Colors.white)),
                      ),
                      Obx(() => Container(
                            width: itemWidth - 30,
                            margin: const EdgeInsets.only(top: 5),
                            child: Text(counterC.scannedString[0],
                                //counterC.scannedString.value.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 21,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal)),
                          )),
                    ])))
          ])),
      Container(
          width: itemWidth,
          height: itemHeight - (itemHeight - (itemHeight / 1.5)),
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).primaryColor),
                    child: Material(
                        color: Color.fromARGB(255, 1, 104, 97),
                        child: TabBar(
                            controller: _tabController,
                            indicatorColor: AppColors().primary,
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: tabList)),
                  ),
                  Container(
                    height: 440,
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        Center(
                          child: Column(children: [
                            ExpansionTile(
                              initiallyExpanded: true,
                              title: const Text('Virtual Account',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              subtitle: const Text(
                                  'All Banks With Virtual Account Available',
                                  style: TextStyle(fontSize: 11)),
                              trailing: Icon(
                                _customTileExpanded
                                    ? Icons.arrow_drop_up_rounded
                                    : Icons.arrow_drop_down,
                              ),
                              children: [
                                SizedBox(
                                    height: 282,
                                    child: ListView(
                                        padding: EdgeInsets.only(top: 0),
                                        shrinkWrap: true,
                                        physics:
                                            const AlwaysScrollableScrollPhysics(), // new
                                        controller: _scrollController,
                                        children: <Widget>[
                                          Column(children: [
                                            RoomAvailable(
                                                "BCA",
                                                "BCA Virtual Account",
                                                "https://www.freepnglogos.com/uploads/logo-bca-png/bank-bca-bank-central-asia-logo-vector-cdr-download-3.png"),
                                            RoomAvailable(
                                                "BRI",
                                                "BRI Virtual Account",
                                                "https://i2.wp.com/febi.uinsaid.ac.id/wp-content/uploads/2020/11/Logo-BRI-Bank-Rakyat-Indonesia-PNG-Terbaru.png?ssl=1"),
                                            RoomAvailable(
                                                "BCA",
                                                "BCA Virtual Account",
                                                "https://www.freepnglogos.com/uploads/logo-bca-png/bank-bca-bank-central-asia-logo-vector-cdr-download-3.png"),
                                            RoomAvailable(
                                                "BRI",
                                                "BRI Virtual Account",
                                                "https://i2.wp.com/febi.uinsaid.ac.id/wp-content/uploads/2020/11/Logo-BRI-Bank-Rakyat-Indonesia-PNG-Terbaru.png?ssl=1"),
                                          ])
                                        ]))
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(() => _customTileExpanded = expanded);
                              },
                            ),
                            ExpansionTile(
                              initiallyExpanded: true,
                              title: const Text('Convenience Store',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              subtitle: const Text(
                                  'All Convenience Store Available',
                                  style: TextStyle(fontSize: 11)),
                              trailing: Icon(
                                _customTileExpanded2
                                    ? Icons.arrow_drop_up_rounded
                                    : Icons.arrow_drop_down,
                              ),
                              children: [
                                SizedBox(
                                    height: 282,
                                    child: ListView(
                                        padding: EdgeInsets.only(top: 0),
                                        shrinkWrap: true,
                                        physics:
                                            const AlwaysScrollableScrollPhysics(), // new
                                        controller: _scrollController,
                                        children: <Widget>[
                                          Column(children: [
                                            RoomAvailable(
                                                "BCA",
                                                "BCA Virtual Account",
                                                "https://www.freepnglogos.com/uploads/logo-bca-png/bank-bca-bank-central-asia-logo-vector-cdr-download-3.png"),
                                            RoomAvailable(
                                                "BRI",
                                                "BRI Virtual Account",
                                                "https://i2.wp.com/febi.uinsaid.ac.id/wp-content/uploads/2020/11/Logo-BRI-Bank-Rakyat-Indonesia-PNG-Terbaru.png?ssl=1"),
                                            RoomAvailable(
                                                "BCA",
                                                "BCA Virtual Account",
                                                "https://www.freepnglogos.com/uploads/logo-bca-png/bank-bca-bank-central-asia-logo-vector-cdr-download-3.png"),
                                            RoomAvailable(
                                                "BRI",
                                                "BRI Virtual Account",
                                                "https://i2.wp.com/febi.uinsaid.ac.id/wp-content/uploads/2020/11/Logo-BRI-Bank-Rakyat-Indonesia-PNG-Terbaru.png?ssl=1"),
                                          ])
                                        ]))
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(() => _customTileExpanded2 = expanded);
                              },
                            ),
                          ]),
                        ),
                        Center(
                          child: Text("It's rainy here 2"),
                        ),
                      ],
                    ),
                  )
                ],
              ))),
    ]));
  }
}
