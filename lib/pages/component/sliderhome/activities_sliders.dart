import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ActivitiesSliders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: 350,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 20,
            ),
            width: screenWidth / 1.7,
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black12,
              image: const DecorationImage(
                image: NetworkImage(
                  "https://asahospitality.co.id/public/restaurant/main/sub/1674277708shdkxnuczfratbovyqgimeljwp.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(children: <Widget>[
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      width: screenWidth / 1.7,
                      height: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black38,
                      ),
                      child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Column(children: [
                              Container(
                                  margin: EdgeInsets.only(bottom: 15),
                                  child: const Icon(Icons.food_bank,
                                      size: 48, color: Colors.white70)),
                              Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  child: const Text("Raia Restaurant",
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white70,
                                          fontFamily: 'OoohBaby',
                                          fontWeight: FontWeight.bold))),
                              Container(
                                  child: const Text(
                                      "Balinese and Western Foods",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold)))
                            ])
                          ]))))
            ]),
          ),
          Container(
              margin: const EdgeInsets.only(
                left: 20,
              ),
              width: screenWidth / 1.7,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://www.theprivateworld.com/wp-content/uploads/2015/10/hotel-tugu-bali.jpeg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(children: <Widget>[
                Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                        width: screenWidth / 1.7,
                        height: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black38,
                        ),
                        child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Column(children: [
                                Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    child: const Icon(Icons.king_bed,
                                        size: 48, color: Colors.white70)),
                                Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: const Text("Raia Weddings",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.white70,
                                            fontFamily: 'OoohBaby',
                                            fontWeight: FontWeight.bold))),
                                Container(
                                    child: const Text(
                                        "Balinese Traditional and Western",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.bold)))
                              ])
                            ]))))
              ])),
          Container(
              margin: const EdgeInsets.only(
                left: 20,
              ),
              width: screenWidth / 1.7,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://asahospitality.co.id/public/spa/main/1674554439qoscphrkbfdjvmnyzgxaluweit.jpeg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(children: <Widget>[
                Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                        width: screenWidth / 1.7,
                        height: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black38,
                        ),
                        child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Column(children: [
                                Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    child: const Icon(Icons.spa,
                                        size: 48, color: Colors.white70)),
                                Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: const Text("Raia Spa",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.white70,
                                            fontFamily: 'OoohBaby',
                                            fontWeight: FontWeight.bold))),
                                Container(
                                    child: const Text(
                                        "Balinese Traditional Treatment",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.bold)))
                              ])
                            ]))))
              ]))
        ],
      ),
    );
  }
}
