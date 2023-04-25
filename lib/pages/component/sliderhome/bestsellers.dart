import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';
import 'package:getxtest/pages/component/widget/imageList/imageGrid.dart';
import 'package:getxtest/pages/foods/detail.dart';
import 'package:getxtest/pages/page4.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class BestSellers extends StatelessWidget {
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
              navigator
                  ?.push(MaterialPageRoute(builder: (_) => DetailFoodsNew()));
            },
            child: ImageGrid(
                "https://asset.kompas.com/crops/J0ARoySS4ZFviSelgHTMsxHPNv0=/0x0:1000x667/750x500/data/photo/2020/12/17/5fdb3cd0c1525.jpg")),
        //         errorWidget: (context, url, error) => Icon(Icons.error)))),
        ImageGrid(
            "https://upload.wikimedia.org/wikipedia/commons/f/fb/Breakfast%21.jpg?20121217170313"),
        ImageGrid(
            "https://upload.wikimedia.org/wikipedia/commons/0/09/NANAK_lunch_set.jpg"),
        ImageGrid(
            "https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
      ],
    );
  }
}
