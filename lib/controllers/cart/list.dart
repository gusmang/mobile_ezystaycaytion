import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getxtest/models/foods/catList.dart';
import 'package:getxtest/models/foods/foodsList.dart';
import 'package:getxtest/service/chat/chatServices.dart';
import 'package:getxtest/service/foods/categoriesServices.dart';
import 'package:getxtest/service/foods/foodServices.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  //RoomChat? roomModel;
  var isDataLoading = false.obs;
  final ScrollController scrollController = ScrollController();
  final offset = 0.0.obs;
  @override
  void onReady() {}

  var foodModel = <FoodList>[].obs;
  var foodModelTmp = <FoodList>[].obs;
  var pagingOffset = 1.obs;

  var lengthData = 0.obs;
  var indexProduct = "0".obs;

  var categoryModel = <CatList>[].obs;
  var CatlengthData = 0.obs;

  var isLastPage = false.obs;

  var incVal = 0.obs;
  var selectedCategories = 1.obs;

  @override
  void onInit() {
    pagingOffset.value = 1;

    super.onInit();
  }

  pushCartValues(FoodList list) async {
    foodModel.value.add(FoodList.setData(list));
    foodModelTmp.value.add(FoodList.setData(list));
    lengthData.value = foodModel.length;

    Fluttertoast.showToast(
        msg: "Added To Cart",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  removeCartValues(var index) async {
    var len = foodModel.length;
    foodModel.value = <FoodList>[].obs;
    lengthData.value = 0;

    var isIndex = 0;
    for (var an = 0; an < len; an++) {
      if (an != index) {
        //   Fluttertoast.showToast(
        //       msg: "Added From Cart " + index.toString(),
        //       toastLength: Toast.LENGTH_SHORT,
        //       gravity: ToastGravity.CENTER,
        //       timeInSecForIosWeb: 1,
        //       backgroundColor: Colors.red,
        //       textColor: Colors.white,
        //       fontSize: 16.0);
        lengthData.value = lengthData.value + 1;
        foodModel.value.add(FoodList.setData(foodModelTmp[an]));
        isIndex++;
      }
    }

    foodModelTmp.value = foodModel.value;

    // Fluttertoast.showToast(
    //     msg: "Added From Cart " + foodModel.length.toString(),
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
    //}
  }

  setFoodsCatApi(var val) async {
    selectedCategories.value = val;
  }
}
