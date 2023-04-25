import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';
import 'package:getxtest/pages/homepage/home.dart';

class FloatBackButton extends StatelessWidget {
  double width, height, top, left;
  String teks;
  Icon icons;

  FloatBackButton(
      this.width, this.height, this.teks, this.icons, this.top, this.left);
  @override
  Widget build(BuildContext context) {
    return Positioned(
        // To take AppBar Size only
        top: top,
        left: left,
        child: GestureDetector(
            onTap: () {
              navigator?.pushReplacement(
                  MaterialPageRoute(builder: (_) => MainPage()));
            },
            child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      icons,
                    ])))));
  }
}
