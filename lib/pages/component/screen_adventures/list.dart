import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtest/controllers/images.dart';
import 'package:getxtest/pages/component/screen_activities/list_items.dart';
import 'package:getxtest/pages/component/screen_adventures/list_items.dart';

class AdventuresScreenHome extends StatelessWidget {
  final translists = Get.put(ImagesFood());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = 400;
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
            child: ListItemsAdventures(
                "https://saltinourhair.com/wp-content/uploads/2018/10/things-to-do-ubud-tubing-jungle-1.jpg",
                "River & Tubing Ubud",
                "WaterSport",
                "Rp. 300.000")),
        Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListItemsAdventures(
                "https://www.dontforgettomove.com/wp-content/uploads/2019/05/Ubud-activities.jpg",
                "Ubud Swing",
                "Nature",
                "Rp. 140.000")),
        Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListItemsAdventures(
                "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/3d/34/3e/caption.jpg?w=500&h=400&s=1",
                "ATV Ubud Adventure",
                "Adventure",
                "Rp. 400.000")),
        Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListItemsAdventures(
                "https://www.indonesia.travel/content/dam/indtravelrevamp/en/destinations/revisi-2020/image2.jpg",
                "Holy Water Temple",
                "Nature",
                "Rp. 0")),
      ],
    );
  }
}
