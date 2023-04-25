import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';
import 'package:getxtest/config/colorUtils.dart';
import 'package:getxtest/pages/component/screen_activities/list.dart';
import 'package:getxtest/pages/component/screen_foodhome/list.dart';
import 'package:getxtest/pages/component/sliderhome/activities_sliders.dart';
import 'package:getxtest/pages/page4.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivitiesFoodScreen extends StatelessWidget {
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
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Row(children: [
                Container(
                    width: 60,
                    height: 60,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        color: Color.fromARGB(255, 19, 183, 195),
                        borderRadius: BorderRadius.circular(40)),
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Icon(Icons.directions_walk,
                              size: 32, color: Colors.white),
                        ]))),
                SizedBox(width: 20),
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Find Activities',
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
          SizedBox(height: 10),
          ActivitiesSliders(),
          SizedBox(height: 10),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(children: [
                Container(
                    child: const Text("Activites Event",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                        alignment: Alignment.bottomRight,
                        width: screenWidth - 147,
                        child: const Text("See All  >",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 12)))),
              ])),
          ActivitiesScreenHome(),
        ],
      ),
    );
  }
}
