import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Media {
  late BuildContext contexts;

  Future<double> getMediaWidth(BuildContext context) async {
    return MediaQuery.of(context).size.width;
  }

  Future<double> getMediaHeight(BuildContext context) async {
    return MediaQuery.of(context).size.height;
  }

  //getMediaWidth(BuildContext context){MediaQuery.of(context).size.width};
  //getMediaHeight(BuildContext context) => {MediaQuery.of(context).size.height};
}
