import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BadgeWidget extends StatelessWidget {
  double width, height;
  String teks;
  Icon icons;

  BadgeWidget(this.width, this.height, this.teks, this.icons);
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
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 19, 183, 195),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text(teks, style: const TextStyle(fontSize: 8))
                  ]))))
    ]);
  }
}
