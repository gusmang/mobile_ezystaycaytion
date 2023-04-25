import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/instance_manager.dart';
import 'package:getxtest/controllers/images.dart';
import 'package:getxtest/pages/component/widget/imageList/imageGrid.dart';

class ListItemsTransport extends StatelessWidget {
  var yourData;
  var transName;
  var hargaTrans;

  ListItemsTransport(this.yourData, this.transName, this.hargaTrans);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ImageGrid(yourData),
      Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(
            bottom: 20,
          ),
          child: Text(transName,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'OoohBaby',
                  fontWeight: FontWeight.bold))),
      Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(
            bottom: 5,
          ),
          child: Row(children: [
            Text(hargaTrans,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(width: 5),
            Text("/ day", style: TextStyle(fontSize: 12))
          ])),
      Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(
          bottom: 5,
        ),
        child: Column(children: [
          Row(children: [
            Icon(
              Icons.star,
              size: 14,
              color: Colors.green[500],
            ),
            Text("1.2k Review",
                style: TextStyle(
                    fontSize: 11,
                    color: Colors.green[500],
                    fontWeight: FontWeight.w600)),
            SizedBox(width: 5),
            Icon(
              Icons.timer_sharp,
              size: 14,
              color: Colors.green[500],
            ),
            Text(" 5 Min",
                style: TextStyle(
                    fontSize: 11,
                    color: Colors.green[500],
                    fontWeight: FontWeight.w600))
          ]),
          Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              alignment: Alignment.bottomRight,
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Icon(Icons.heart_broken_rounded),
                SizedBox(width: 5),
                Icon(Icons.shopping_cart)
              ]))
        ]),
      )
    ]);
  }
}
