import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CircleButton extends StatelessWidget {
  double width, height;
  double buttonRadius;
  Icon icons;

  CircleButton(this.width, this.height, this.buttonRadius, this.icons);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 19, 183, 195),
            borderRadius: BorderRadius.circular(buttonRadius)),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [icons])));
  }
}
