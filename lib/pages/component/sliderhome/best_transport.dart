import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';
import 'package:getxtest/pages/component/widget/imageList/imageGrid.dart';
import 'package:getxtest/pages/page4.dart';

class BestTransport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      crossAxisCount: 2,
      physics:
          const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
      shrinkWrap: true, // You won't see infinite size error
      children: <Widget>[
        GestureDetector(
            onTap: () {
              navigator?.push(MaterialPageRoute(builder: (_) => PageDua()));
            },
            child: ImageGrid(
                "https://www.toyota.astra.co.id/sites/default/files/2021-09/home%20banner%20alphard%201293x820.jpg")),
        ImageGrid(
            "https://cdn0-production-images-kly.akamaized.net/xv1spB1Af-_emAyPN21p3WD8QOU=/640x640/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/4114092/original/090962100_1659693620-296098115_616097016487819_5579707988350585024_n.jpg"),
        ImageGrid(
            "https://www.mobil88.astra.co.id/blog/wp-content/uploads/2021/03/3vjMg6W"),
        ImageGrid(
            "https://cdn0-production-images-kly.akamaized.net/xv1spB1Af-_emAyPN21p3WD8QOU=/640x640/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/4114092/original/090962100_1659693620-296098115_616097016487819_5579707988350585024_n.jpg")
      ],
    );
  }
}
