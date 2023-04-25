import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:getxtest/config/auth.dart';
import 'package:getxtest/models/foods/catList.dart';
import 'package:getxtest/models/foods/foodsList.dart';
import 'package:getxtest/models/foods/foodsListDetail.dart';
import 'package:getxtest/models/roomChat.dart';
import 'package:http/http.dart' as http;

class CategoryServices {
  static var client = http.Client();

  static Future<List<CatList>?> fetchProducts(index) async {
    http.Response response =
        await http.get(Uri.tryParse('${AuthUsers().devUrl}/foodsCategory')!);
    if (response.statusCode == 200) {
      var jsonString = json.decode(response.body);

      return catFoodsFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
