import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getxtest/config/colorUtils.dart';

class CircleTextButton extends StatelessWidget {
  double width, height;
  double buttonRadius;
  String teks;
  Icon icons;
  Color colours;
  Color textcolours;

  CircleTextButton(this.width, this.height, this.buttonRadius, this.teks,
      this.icons, this.colours, this.textcolours);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(color: textcolours),
            color: colours,
            borderRadius: BorderRadius.circular(buttonRadius)),
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            icons,
            SizedBox(width: 5),
            Text(teks, style: TextStyle(color: textcolours, fontSize: 12))
          ])
        ])));
  }
}
