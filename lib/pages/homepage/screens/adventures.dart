import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';
import 'package:getxtest/config/colorUtils.dart';
import 'package:getxtest/pages/component/screen_activities/list.dart';
import 'package:getxtest/pages/component/screen_adventures/list.dart';
import 'package:getxtest/pages/component/screen_foodhome/list.dart';
import 'package:getxtest/pages/component/sliderhome/activities_sliders.dart';
import 'package:getxtest/pages/component/sliderhome/adventures_sliders.dart';
import 'package:getxtest/pages/component/widget/button/circlebutton.dart';
import 'package:getxtest/pages/page4.dart';
import 'package:google_fonts/google_fonts.dart';

class AdventurerFoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Row(children: [
                Container(
                    width: 60,
                    height: 60,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        color: const Color.fromARGB(255, 19, 183, 195),
                        borderRadius: BorderRadius.circular(40)),
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                          Icon(Icons.directions_bike,
                              size: 32, color: Colors.white),
                        ]))),
                const SizedBox(width: 20),
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Find Experiences',
                      textStyle: GoogleFonts.poppins(
                          fontSize: 24, fontStyle: FontStyle.italic),
                      colors: [
                        AppColors().primary,
                        Color.fromARGB(137, 128, 229, 250),
                        Color.fromARGB(137, 128, 229, 250),
                        Color.fromARGB(137, 128, 229, 250),
                      ],
                    )
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,
                )
              ])),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(children: [
                Container(
                    child: const Text("Travel With Us",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
              ])),
          const SizedBox(height: 10),
          AdventuresSliders(),
          const SizedBox(height: 10),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(children: [
                Container(
                    child: const Text("Where To Go",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                        alignment: Alignment.bottomRight,
                        width: screenWidth - 135,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Icon(Icons.directions),
                              Text(" Map Views",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontSize: 12))
                            ]))),
              ])),
          SizedBox(height: 10),
          Container(
              width: screenWidth,
              height: 110,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: Column(children: [
                          CircleButton(
                              60,
                              60,
                              60,
                              const Icon(Icons.directions_bike,
                                  color: Colors.white)),
                          Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: const Text("Bicyling"))
                        ])),
                    Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: Column(children: [
                          CircleButton(
                              60,
                              60,
                              60,
                              const Icon(Icons.directions_boat,
                                  color: Colors.white)),
                          Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: const Text("WaterSport"))
                        ])),
                    Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: Column(children: [
                          CircleButton(
                              60,
                              60,
                              60,
                              const Icon(Icons.scuba_diving,
                                  color: Colors.white)),
                          Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: const Text("Diving"))
                        ])),
                    Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: Column(children: [
                          CircleButton(
                              60,
                              60,
                              60,
                              const Icon(Icons.directions_car,
                                  color: Colors.white)),
                          Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: const Text("ATV Sport"))
                        ])),
                    Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: Column(children: [
                          CircleButton(
                              60,
                              60,
                              60,
                              const Icon(Icons.directions_run,
                                  color: Colors.white)),
                          Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: const Text("Adventures"))
                        ])),
                    Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Column(children: [
                          CircleButton(
                              60,
                              60,
                              60,
                              const Icon(Icons.directions_train,
                                  color: Colors.white)),
                          Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: const Text("Training"))
                        ])),
                  ])),
          AdventuresScreenHome(),
        ],
      ),
    );
  }
}
