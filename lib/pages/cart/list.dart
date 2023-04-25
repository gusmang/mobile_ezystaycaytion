import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getxtest/controllers/cart/list.dart';
import 'package:getxtest/controllers/images.dart';
import 'package:getxtest/pages/cart/component/listItems.dart';
import 'package:getxtest/pages/homepage/home.dart';
import 'package:get/get.dart';

class CartItemsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final foodlists = Get.put(ImagesFood());

    CartController cartsControllers = Get.put(CartController());

    return Scaffold(
        body: Column(
      children: [
        Container(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
            child: Row(children: [
              Container(
                  width: 40,
                  height: 40,
                  child: GestureDetector(
                      onTap: () {
                        navigator?.pushReplacement(
                            MaterialPageRoute(builder: (_) => MainPage()));
                      },
                      child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40)),
                          child: Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                const Icon(Icons.arrow_back),
                              ]))))),
              Container(
                  width: screenWidth - 100,
                  height: 40,
                  child: Container(
                      alignment: Alignment.center,
                      child: const Text("Cart Items",
                          style: TextStyle(fontSize: 18)))),
            ])),
        Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Row(children: [
              Container(
                  alignment: Alignment.topLeft,
                  child: const Text("Upcoming Changes",
                      style: TextStyle(fontSize: 15))),
              Container(
                  width: screenWidth - 160,
                  alignment: Alignment.topRight,
                  child: const Text("Clear All",
                      style: TextStyle(fontSize: 12, color: Colors.red))),
            ])),
        Container(
          width: screenWidth,
          height: screenHeight - 160,
          margin: const EdgeInsets.only(
            top: 20,
          ),
          child: Obx(() => ListView.builder(
              itemCount: cartsControllers.lengthData.value,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return ListItemsComponent(
                    cartsControllers.foodModel[index], index);
              })),
        ),
      ],
    ));
  }
}
