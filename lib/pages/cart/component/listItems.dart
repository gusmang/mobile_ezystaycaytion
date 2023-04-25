import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getxtest/controllers/cart/list.dart';
import 'package:getxtest/controllers/detailsfood/input.dart';
import 'package:getxtest/controllers/images.dart';
import 'package:getxtest/models/foods/foodsList.dart';
import 'package:getxtest/pages/homepage/home.dart';
import 'package:get/get.dart';

class ListItemsComponent extends StatelessWidget {
  FoodList? list;
  var indexValues;

  ListItemsComponent(this.list, this.indexValues, {super.key});

  final foodlists = Get.put(ImagesFood());
  final DetailFood = Get.put(DetailFoodController());

  CartController cartsControllers = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Container(
              child: Row(children: [
            Container(
                width: 130,
                height: 130,
                margin: const EdgeInsets.only(
                  bottom: 10,
                  top: 20,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(
                      list!.foto_produk.toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
                height: 140,
                margin: const EdgeInsets.only(
                  bottom: 10,
                  top: 10,
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: screenWidth - 170,
                          alignment: Alignment.topLeft,
                          child: Text(
                              textAlign: TextAlign.start,
                              list!.name.toString())),
                      Container(
                          width: screenWidth - 170,
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Text(
                              textAlign: TextAlign.start,
                              "${list!.price.toString()} x 1")),
                      Container(
                          width: screenWidth - 170,
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Text(
                              textAlign: TextAlign.start,
                              list!.price.toString(),
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.green))),
                      Container(
                          width: screenWidth - 170,
                          alignment: Alignment.topRight,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(0),
                                          backgroundColor:
                                              Colors.red, // Background color
                                        ),
                                        onPressed: () {
                                          DetailFood.setValueDecreaseQty();
                                        },
                                        child: const Align(
                                          alignment: Alignment.center,
                                          child: Text("-",
                                              style: TextStyle(fontSize: 21.0),
                                              textAlign: TextAlign.center),
                                        ))),
                                SizedBox(
                                    width: 70,
                                    height: 48,
                                    child: Container(
                                        padding: const EdgeInsets.all(10),
                                        child: TextFormField(
                                          enabled: false,
                                          controller:
                                              DetailFood.QtyController.value,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.left,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.fromLTRB(
                                                12, 15, 0, 0),
                                            hintText: '1',
                                          ),
                                        ))),
                                SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(0),
                                          backgroundColor:
                                              Colors.green, // Background color
                                        ),
                                        onPressed: () {
                                          DetailFood.setValueQty();
                                        },
                                        child: const Align(
                                          alignment: Alignment.center,
                                          child: Text("+",
                                              style: TextStyle(fontSize: 21.0),
                                              textAlign: TextAlign.center),
                                        ))),
                              ]))
                    ])),
          ])),
          Container(
              child: SizedBox(
                  width: screenWidth,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(20),
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                              width: 1, // the thickness
                              color: Colors.red // the color of the border
                              ) // Background color
                          ),
                      onPressed: () {
                        cartsControllers.removeCartValues(indexValues);
                      },
                      child: const Text("Remove From Cart",
                          style: TextStyle(color: Colors.red)))))
        ]));
  }
}
