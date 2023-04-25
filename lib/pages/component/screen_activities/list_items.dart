import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/instance_manager.dart';
import 'package:getxtest/config/colorUtils.dart';
import 'package:getxtest/controllers/images.dart';
import 'package:getxtest/pages/component/widget/imageList/imageGrid.dart';

class ListItemsActivities extends StatelessWidget {
  var yourData;
  var transName;
  var categories;
  var hargaTrans;

  ListItemsActivities(
      this.yourData, this.transName, this.categories, this.hargaTrans);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ImageGrid(yourData),
      Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(
            bottom: 5,
          ),
          child: Text(transName,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'OoohBaby',
                  fontWeight: FontWeight.bold))),
      Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(
            bottom: 20,
          ),
          child: Text(categories, style: TextStyle(fontSize: 12))),
      Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(
          bottom: 5,
        ),
        child: Column(children: [
          Row(children: [
            Icon(
              Icons.date_range,
              size: 14,
              color: AppColors().primary,
            ),
            Text(" 23 September 2022",
                style: TextStyle(
                    fontSize: 11,
                    color: AppColors().primary,
                    fontWeight: FontWeight.w600))
          ]),
        ]),
      )
    ]);
  }
}
