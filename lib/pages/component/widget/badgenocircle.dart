import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BadgeNoCircle extends StatelessWidget {
  double width, height;
  String teks;
  Icon icons;

  BadgeNoCircle(this.width, this.height, this.teks, this.icons);
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      icons,
      Positioned(
          // To take AppBar Size only
          top: 0,
          right: 0,
          child: Container(
              width: width,
              height: height,
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text(teks, style: const TextStyle(fontSize: 10))
                  ]))))
    ]);
  }
}
