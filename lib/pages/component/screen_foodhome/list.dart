import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getxtest/controllers/api/foods.dart';
import 'package:getxtest/controllers/images.dart';
import 'package:getxtest/pages/component/screen_foodhome/list_items_2.dart';
import 'package:getxtest/pages/page4.dart';

class FoodScreenHome extends StatelessWidget {
  final foodlists = Get.put(ImagesFood());

  // @override
  // void initState() {
  //   super.initState();

  //   dataController.getFoodsApi(0);
  // }

  FoodsController dataController = Get.put(FoodsController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = 400;
    final double itemWidth = size.width / 1.75;

    return Obx(() => FutureBuilder<dynamic>(
        future: dataController.getFoodsApi(true, 1, 0), // <-- your future
        builder: (context, snapshot) {
          return GridView.builder(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //     maxCrossAxisExtent: 200,
              //     childAspectRatio: 3 / 2,
              //     crossAxisSpacing: 20,
              //     mainAxisSpacing: 20),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: itemWidth / itemHeight,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0),
              itemCount: dataController.lengthData.value,
              itemBuilder: (BuildContext ctx, index) {
                return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListItems(
                      dataController.foodModel[index],
                      dataController.foodModel[index].id.toString(),
                      dataController.foodModel[index].foto_produk.toString(),
                      0,
                      dataController.foodModel[index].name.toString(),
                      dataController.foodModel[index].kategori_name.toString(),
                      dataController.foodModel[index].price.toString(),
                    ));
              });
        }));
  }
}
