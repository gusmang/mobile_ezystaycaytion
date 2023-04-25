import 'package:flutter/material.dart';
import 'package:getxtest/config/colorUtils.dart';
import 'package:getxtest/pages/component/screen_transport/list.dart';
import 'package:getxtest/pages/component/sliderhome/transport_sliders.dart';
import 'package:getxtest/pages/component/widget/button/circletextbutton.dart';

class HomeTransportScreen extends StatelessWidget {
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
              width: screenWidth,
              height: 40,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: Column(children: [
                          CircleTextButton(
                              100,
                              30,
                              60,
                              "Cars",
                              Icon(Icons.car_rental,
                                  size: 18, color: Colors.white),
                              AppColors().primary,
                              Colors.white)
                        ])),
                    Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: Column(children: [
                          CircleTextButton(
                            100,
                            30,
                            60,
                            "Bike",
                            Icon(Icons.motorcycle,
                                size: 18, color: AppColors().primary),
                            Colors.white,
                            AppColors().primary,
                          )
                        ])),
                    Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: Column(children: [
                          CircleTextButton(
                            100,
                            30,
                            60,
                            "Bicycle",
                            Icon(Icons.pedal_bike,
                                size: 18, color: AppColors().primary),
                            Colors.white,
                            AppColors().primary,
                          ),
                        ])),
                    Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: Column(children: [
                          CircleTextButton(
                            100,
                            30,
                            60,
                            "Others",
                            Icon(Icons.electric_bike,
                                size: 18, color: AppColors().primary),
                            Colors.white,
                            AppColors().primary,
                          )
                        ])),
                  ])),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          TransportSliders(),
          SizedBox(height: 10),
          TransportScreenHome(),
        ],
      ),
    );
  }
}
