import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:getxtest/controllers/api/foods.dart';
import 'package:getxtest/controllers/counters.dart';
import 'package:getxtest/controllers/images.dart';
import 'package:getxtest/pages/component/widget/imageList/imageGrid.dart';
import 'package:getxtest/pages/foods/detail.dart';
import 'package:getxtest/pages/page4.dart';
import 'package:getxtest/config/colorUtils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(_ListItems());
}

class _ListItems extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListItems();
}

class ListItems extends State<_ListItems> {
  final counterC = Get.put(Counter());

  final foodlists = Get.put(ImagesFood());

  FoodsController dataController = Get.put(FoodsController());

  get name => null;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (dataController.isDataLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        // _scrollDown();
        return SingleChildScrollView(
            physics: ScrollPhysics(),
            //  areverse: true,
            child: Column(children: <Widget>[
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  reverse: true,
                  key: const PageStorageKey("any_text_here"),
                  itemCount: dataController.lengthData.value,
                  itemBuilder: (context, index) {
                    return dataController != null
                        ? GestureDetector(
                            onTap: () {
                              navigator?.push(MaterialPageRoute(
                                  builder: (_) => DetailFoodsNew()));
                            },
                            child: Column(children: [
                              ImageGrid(dataController
                                  .foodModel[index].foto_produk
                                  .toString()),
                              Container(
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(
                                    bottom: 5,
                                  ),
                                  child: Text(
                                      dataController.foodModel[index].name
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'OoohBaby',
                                          fontWeight: FontWeight.bold))),
                              Container(
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  child: Row(children: [
                                    Icon(Icons.dining,
                                        size: 18, color: AppColors().primary),
                                    const SizedBox(width: 5),
                                    Text(
                                        dataController
                                            .foodModel[index].kategori_name
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic))
                                  ])),
                              Container(
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(
                                    bottom: 5,
                                  ),
                                  child: Text(
                                      dataController.foodModel[index].price
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600))),
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
                                      color: AppColors().primary,
                                    ),
                                    Text("1.2k Review",
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: AppColors().primary,
                                            fontWeight: FontWeight.w600)),
                                    const SizedBox(width: 5),
                                    Icon(
                                      Icons.timer_sharp,
                                      size: 14,
                                      color: AppColors().primary,
                                    ),
                                    const Text(" 5 Min",
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Color.fromARGB(
                                                255, 19, 183, 195),
                                            fontWeight: FontWeight.w600))
                                  ]),
                                  Container(
                                      margin: const EdgeInsets.only(
                                        top: 20,
                                      ),
                                      alignment: Alignment.bottomRight,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            const Icon(
                                                Icons.heart_broken_rounded),
                                            const SizedBox(width: 5),
                                            GestureDetector(
                                                onTap: () {},
                                                child: Obx(() => Container(
                                                    child: const Icon(
                                                        Icons.shopping_cart,
                                                        color: Colors.black))))
                                          ]))
                                ]),
                              )
                            ]))
                        : Container();
                  })
            ]));
      }
    });
  }
}
