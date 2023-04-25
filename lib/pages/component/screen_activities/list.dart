import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getxtest/controllers/images.dart';
import 'package:getxtest/pages/component/screen_activities/list_items.dart';
import 'package:getxtest/pages/component/screen_foodhome/list_items.dart';
import 'package:getxtest/pages/component/screen_transport/list_items.dart';
import 'package:getxtest/pages/page4.dart';

class ActivitiesScreenHome extends StatelessWidget {
  final translists = Get.put(ImagesFood());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = 310;
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
            child: ListItemsActivities(
                "https://www.brides.com/thmb/rqIgp1m1WQ5OOWuArmpsg1JLmgc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/beach-b64c32c355d24d71af1a709c8bf71183.jpg",
                "Wedding Mr. Ryan ...",
                "Wedding",
                "Rp. 300.000")),
        Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListItemsActivities(
                "https://i.pinimg.com/originals/44/ba/64/44ba643962434eac06f7526fc09bff6a.jpg",
                "Wedding Mr. Jacob",
                "Wedding",
                "Rp. 140.000")),
        Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListItemsActivities(
                "https://www.nowbali.co.id/wp-content/uploads/2022/07/Dining-Experience-Bali-4.jpg",
                "Dinner Special",
                "Restaurant",
                "Rp. 400.000")),
        Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListItemsActivities(
                "https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1295,h_720/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/gnhecxolyxjsedgk9hoa/InVillaSpaandMassagePackages.webp",
                "SPA Massages",
                "Spa",
                "Rp. 0")),
      ],
    );
  }
}
