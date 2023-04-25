import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BadgeWidgetBottomBar extends StatelessWidget {
  double width, height;
  String teks;
  Icon icons;

  BadgeWidgetBottomBar(this.width, this.height, this.teks, this.icons);
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned(
          // To take AppBar Size only
          top: 0,
          right: 0,
          child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [icons]))))
    ]);
  }
}
