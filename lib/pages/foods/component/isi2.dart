import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:getxtest/controllers/counters.dart';
import 'package:getxtest/controllers/detailsfood/input.dart';
import 'package:getxtest/controllers/images.dart';
import 'package:getxtest/pages/cart/list.dart';
import 'package:getxtest/pages/component/input/passwordField.dart';
import 'package:getxtest/pages/component/widget/floatBack.dart';
import 'package:getxtest/pages/component/widget/floatRight.dart';

class FoodsContainer extends StatelessWidget {
  final foodlists = Get.put(ImagesFood());
  final DetailFood = Get.put(DetailFoodController());
  final Animates = Get.put(Counter());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height / 2.3;

    foodlists.counters.value = 0;
    DetailFood.QtyController.value.text = "1";

    Animates.setSelectedOpacity(1.0);

    return Obx(() => Stack(children: <Widget>[
          Container(
            width: screenWidth,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
              top: 0,
              left: 0,
              child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: Animates.getSelectedOpacity(),
                  child: Container(
                      width: screenWidth,
                      height: screenHeight,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            foodlists
                                .getSelectedImages(foodlists.counters.value)
                                .toString(),
                          ),
                          fit: BoxFit.cover,
                        ),
                      )))),
          FloatBackButton(
              40,
              40,
              "",
              const Icon(Icons.arrow_back, size: 28, color: Colors.black),
              20,
              10),
          FloatRightButton(40, 40, "",
              const Icon(Icons.share, size: 28, color: Colors.black), 20, 10),
          FloatRightButton(
              40,
              40,
              "",
              const Icon(Icons.heart_broken, size: 28, color: Colors.black),
              20,
              60),
          FloatRightButton(
              40,
              40,
              "",
              const Icon(Icons.shopping_cart, size: 28, color: Colors.black),
              20,
              110),
          Positioned(
              top: 150,
              left: 0,
              child: GestureDetector(
                  onTap: () {
                    foodlists.setDecrement();
                  },
                  child: Container(
                      width: 60,
                      height: 60,
                      color: Colors.black45,
                      child: const Icon(Icons.chevron_left,
                          size: 48, color: Colors.white)))),
          Positioned(
              top: 150,
              right: 0,
              child: GestureDetector(
                  onTap: () {
                    foodlists.setIncrement();
                    Animates.setSelectedOpacity(1.0);
                  },
                  child: Container(
                      width: 60,
                      height: 60,
                      color: Colors.black45,
                      child: const Icon(Icons.chevron_right,
                          size: 48, color: Colors.white)))),
          Positioned(
              // To take AppBar Size only
              top: 300,
              right: 0,
              child: Container(
                  width: screenWidth,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        Container(
                            alignment: Alignment.topLeft,
                            child: const Text("Ikan Bakar Jimbaran",
                                style: TextStyle(
                                    fontSize: 21,
                                    fontFamily: 'OoohBaby',
                                    fontWeight: FontWeight.bold))),
                        const SizedBox(height: 30),
                        Container(
                            alignment: Alignment.topLeft,
                            child: const Text("Rp. 500.000 , -",
                                style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: 'OoohBaby',
                                    fontWeight: FontWeight.bold))),
                        Row(children: [
                          Container(
                              alignment: Alignment.topLeft,
                              child: Row(children: [
                                Icon(
                                  Icons.star,
                                  size: 14,
                                  color: Colors.green[500],
                                ),
                                Text("1.2k Review",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.green[500],
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(height: 5),
                                Icon(
                                  Icons.timer_sharp,
                                  size: 14,
                                  color: Colors.green[500],
                                ),
                                Text(" 5 Min",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.green[500],
                                        fontWeight: FontWeight.w600))
                              ])),
                          Container(
                              width: screenWidth - 150,
                              alignment: Alignment.topRight,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              padding: const EdgeInsets.all(0),
                                              backgroundColor: Colors
                                                  .red, // Background color
                                            ),
                                            onPressed: () {
                                              DetailFood.setValueDecreaseQty();
                                            },
                                            child: const Align(
                                              alignment: Alignment.center,
                                              child: Text("-",
                                                  style:
                                                      TextStyle(fontSize: 21.0),
                                                  textAlign: TextAlign.center),
                                            ))),
                                    SizedBox(
                                        width: 70,
                                        height: 55,
                                        child: Container(
                                            padding: const EdgeInsets.all(10),
                                            child: TextFormField(
                                              enabled: false,
                                              controller: DetailFood
                                                  .QtyController.value,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              textAlign: TextAlign.left,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        12, 15, 0, 0),
                                                hintText: '0',
                                              ),
                                            ))),
                                    SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              padding: const EdgeInsets.all(0),
                                              backgroundColor: Colors
                                                  .green, // Background color
                                            ),
                                            onPressed: () {
                                              DetailFood.setValueQty();
                                            },
                                            child: const Align(
                                              alignment: Alignment.center,
                                              child: Text("+",
                                                  style:
                                                      TextStyle(fontSize: 21.0),
                                                  textAlign: TextAlign.center),
                                            ))),
                                  ]))
                        ]),
                        const SizedBox(height: 35),
                        Container(
                            alignment: Alignment.topLeft,
                            child: const Text("Description",
                                style: TextStyle(
                                    fontSize: 32,
                                    fontFamily: 'OoohBaby',
                                    fontWeight: FontWeight.bold))),
                        const SizedBox(height: 10),
                        Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                                "Jakarta - Ikan bakar bisa jadi menu andalan saat barbeque di malam tahun baru bersama keluarga. Ada resep ikan bakar Jimbaran Bali yang rasanya gurih dan tak bau amis.Ikan bakar juga jadi menu favorit banyak orang saat pesta BBQ di malam tahun baru. Agar makin spesial, kamu bisa mencoba resep ikan bakar khas Jimbaran Bali yang tersohor pedas dan gurih rasanya.Kamu bisa mencontek resep ikan bakar Jimbaran Bali dari chef Wayan Sukranata dari The Westin Resort Nusa Dua, Bali",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black54))),
                        const SizedBox(height: 10),
                      ])))),
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                width: screenWidth,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(children: [
                  SizedBox(
                      width: screenWidth / 3,
                      height: 60,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(20),
                              backgroundColor: Colors.white,
                              side: const BorderSide(
                                  width: 1, // the thickness
                                  color: Colors.green // the color of the border
                                  ) // Background color
                              ),
                          onPressed: () {
                            navigator?.pushReplacement(MaterialPageRoute(
                                builder: (_) => CartItemsList()));
                          },
                          child: const Text("Add To Cart",
                              style: TextStyle(
                                  color: Colors.green, fontSize: 15)))),
                  SizedBox(width: 5),
                  SizedBox(
                      width: screenWidth - ((screenWidth / 3) + 15),
                      height: 60,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(20),
                            backgroundColor: Colors.green, // Background color
                          ),
                          onPressed: () {},
                          child: const Text("Checkout Payment",
                              style: TextStyle(fontSize: 15)))),
                ]),
              )),
        ]));
  }
}
