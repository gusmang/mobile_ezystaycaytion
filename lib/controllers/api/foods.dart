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

class FoodsController extends GetxController {
  //RoomChat? roomModel;
  var isDataLoading = false.obs;
  final ScrollController scrollController = ScrollController();
  final offset = 0.0.obs;
  @override
  void onReady() {}

  var foodModel = <FoodList>[].obs;
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
    getCategoriesApi();
    pagingOffset.value = 1;

    super.onInit();
  }

  getFoodsApi(isFetch, index, pagingOffset) async {
    try {
      if (isFetch == true) {
        isDataLoading(true);
        pagingOffset.value = 1;
      }
      var foodlist = await FoodServices.fetchProducts(
          index, pagingOffset, selectedCategories.value.toString());

      // Fluttertoast.showToast(
      //     msg: "Total page " + totalPages.toString(),
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);

      if (isFetch == true) {
        lengthData.value = foodlist!.length;
        foodModel.value = <FoodList>[].obs;
      } else {
        lengthData.value += foodlist!.length;
        lengthData.value < 4
            ? isLastPage.value = true
            : isLastPage.value = false;
      }

      incVal++;

      for (var an = 0; an < lengthData.value; an++) {
        foodModel.value.add(FoodList.setData(foodlist[an]));
      }

      var inc = 0;
      // List<FoodList>.from(
      //     foodlist.map((x) => {foodModel.value.add(FoodList.setData(x))}));

      //isDataLoading(false);
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      if (isFetch == true) {
        isDataLoading(false);
      }
      // Fluttertoast.showToast(
      //     msg: "This is Center Short Toast ",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
      //isDataLoading(false);
    }
  }

  getCategoriesApi() async {
    isDataLoading(true);
    try {
      var catlist = await CategoryServices.fetchProducts(1);
      CatlengthData.value = catlist!.length;

      categoryModel.value = catlist!;
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }

  setChatValuesJml(var len) {
    lengthData.value = len;
  }

  setPagingOffset() {
    pagingOffset.value += 1;
  }

  setIndexFoods(var index) {
    indexProduct.value = index;
  }

  pushChatValues(FoodList list) async {
    foodModel.value.add(FoodList.setData(list));
  }

  setFoodsCatApi(var val) async {
    selectedCategories.value = val;
  }
}
