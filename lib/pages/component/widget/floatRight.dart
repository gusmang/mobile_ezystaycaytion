import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:getxtest/controllers/images.dart';
import 'package:getxtest/pages/homepage/home.dart';

class FloatRightButton extends StatelessWidget {
  double width, height, top, right;
  String teks;
  Icon icons;

  final foodlists = Get.put(ImagesFood());

  FloatRightButton(
      this.width, this.height, this.teks, this.icons, this.top, this.right);
  @override
  Widget build(BuildContext context) {
    return Positioned(
        // To take AppBar Size only
        top: top,
        right: right,
        child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40)),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  icons,
                ]))));
  }
}
