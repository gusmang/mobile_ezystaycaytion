import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getxtest/controllers/api/foods.dart';
import 'package:getxtest/models/foods/foodsList.dart';
import 'package:getxtest/models/foods/foodsListDetail.dart';
import 'package:getxtest/service/chat/chatServices.dart';
import 'package:getxtest/service/foods/foodServices.dart';
import 'package:http/http.dart' as http;

class FoodsDetailController extends GetxController {
  //RoomChat? roomModel;
  var isDataLoading = false.obs;
  final ScrollController scrollController = ScrollController();
  final offset = 0.0.obs;

  @override
  void onReady() {}

  var foodModel = <FoodListDetail>[].obs;
  var subImages = <SubImages>[].obs;

  var lengthData = 0.obs;
  var indexProduct = "0".obs;

  var imagesSlides = <String>[].obs;

  getSelectedImages(int index) => imagesSlides.elementAt(index);
  setSelectedImages(int index, var values) => imagesSlides[index] = values;

  var counters = 0.obs;

  void setIncrement() => {
        counters.value < subImages.length
            ? counters.value += 1
            : counters.value = 0
      };
  void setDecrement() =>
      {counters.value > 0 ? counters.value -= 1 : counters.value = 0};

  @override
  void onInit() {
    imagesSlides = <String>[].obs;
    super.onInit();
  }

  getDetailProducts() async {
    isDataLoading(true);
    try {
      FoodsController datacontroller = Get.put(FoodsController());
      var foodlist =
          await FoodServices.getDetailProducts(datacontroller.indexProduct);
      var indexProduct = datacontroller.indexProduct;

      var subImagesList =
          await FoodServices.getSubImages(foodlist![0].sub_images);

      imagesSlides = <String>[].obs;
      counters = 0.obs;

      //imagesSlides[0] = foodlist![0].foto_produk.toString();
      imagesSlides.add(foodlist![0].foto_produk.toString());

      for (var an = 1; an <= subImagesList!.length; an++) {
        imagesSlides.add(subImagesList[an - 1].foods.toString());
      }

      // Fluttertoast.showToast(
      //     msg: "Product SuccessFully Fetched $indexProduct",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
      subImages.value = subImagesList!;
      foodModel.value = foodlist!;
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
      //isDataLoading(false);
    }
  }

  setChatValuesJml(var len) {
    lengthData.value = len;
  }

  setIndexFoods(var index) {
    indexProduct.value = index;
  }

  pushChatValues(var len) async {
    foodModel.value.add(FoodListDetail.setData([]));
  }
}
