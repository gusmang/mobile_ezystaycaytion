import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:getxtest/models/roomChat.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<RoomChatList>?> fetchProducts(index) async {
    http.Response response = await http.get(Uri.tryParse(
        'https://mini-inventory.balikencana-dev.com/room/chatroom/1/' +
            index.toString())!);
    if (response.statusCode == 200) {
      var jsonString = json.decode(response.body);

      return chatFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
