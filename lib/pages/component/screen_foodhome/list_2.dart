import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getxtest/controllers/images.dart';
import 'package:getxtest/pages/component/screen_foodhome/list_items_2.dart';
import 'package:getxtest/pages/page4.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(_FoodScreenHome());
}

class _FoodScreenHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FoodScreenHome();
}

class FoodScreenHome extends State<_FoodScreenHome> {
  final foodlists = Get.put(ImagesFood());
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
      children: <Widget>[],
    );
  }
}
