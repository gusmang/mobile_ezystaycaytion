import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getxtest/controllers/images.dart';
import 'package:getxtest/pages/component/screen_foodhome/list_items.dart';
import 'package:getxtest/pages/component/screen_transport/list_items.dart';
import 'package:getxtest/pages/page4.dart';

class TransportScreenHome extends StatelessWidget {
  final translists = Get.put(ImagesFood());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = 380;
    final double itemWidth = size.width / 1.75;

    return GridView.count(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      childAspectRatio: (itemWidth / itemHeight),
      crossAxisCount: 2,
      physics:
          NeverScrollableScrollPhysics(), // to disable GridView's scrolling
      shrinkWrap: true, // You won't see infinite size error
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListItemsTransport(translists.imagestransport1.value,
                "PT. SingaBaliTransport", "Rp. 300.000")),
        Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListItemsTransport(
                "https://www.toyota.astra.co.id/sites/default/files/2021-09/home%20banner%20alphard%201293x820.jpg",
                "PT. JayaTransport",
                "Rp. 820.000")),
        Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListItemsTransport(
                "https://cdn0-production-images-kly.akamaized.net/xv1spB1Af-_emAyPN21p3WD8QOU=/640x640/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/4114092/original/090962100_1659693620-296098115_616097016487819_5579707988350585024_n.jpg",
                "PT. MegaTransport",
                "Rp. 400.000")),
        Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListItemsTransport(
                "https://www.mobil88.astra.co.id/blog/wp-content/uploads/2021/03/3vjMg6W",
                "PT. DiamondTransport",
                "Rp. 500.000")),
      ],
    );
  }
}
