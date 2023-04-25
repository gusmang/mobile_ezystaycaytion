import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailFoodController extends GetxController {
  Rx<String> emailEditionController = TextEditingController().text.obs;

  Rx<TextEditingController> QtyController = TextEditingController().obs;

  void setValueQty() => {
        QtyController.value.text =
            (int.parse(QtyController.value.text) + 1).toString()
      };

  void setValueDecreaseQty() => {
        QtyController.value.text = QtyController.value.text != "1"
            ? (int.parse(QtyController.value.text) - 1).toString()
            : "1"
      };
}
