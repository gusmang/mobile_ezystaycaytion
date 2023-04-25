import 'dart:convert';
import 'dart:ffi';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:getxtest/config/auth.dart';
import 'package:getxtest/models/foods/foodsList.dart';
import 'package:getxtest/models/foods/foodsListDetail.dart';
import 'package:getxtest/models/roomChat.dart';
import 'package:http/http.dart' as http;

class FoodServices {
  static var client = http.Client();

  static Future<List<FoodList>?> fetchProducts(index, offset, cat) async {
    http.Response response = await http.get(Uri.tryParse(
        '${AuthUsers().devUrl}/listfoods/${index}?page=${offset}&cat=' + cat)!);
    if (response.statusCode == 200) {
      var jsonString = json.decode(response.body);

      return foodsFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }

  static Future<List<FoodListDetail>?> getDetailProducts(index) async {
    http.Response response = await http
        .get(Uri.tryParse('${AuthUsers().devUrl}/detailfoods/$index')!);
    if (response.statusCode == 200) {
      var jsonString = json.decode(response.body);

      return foodsDetailFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }

  static Future<List<SubImages>?> getSubImages(img) async {
    var jsonString = json.decode(img);

    return subImagesFromJson(jsonString);
  }
}
