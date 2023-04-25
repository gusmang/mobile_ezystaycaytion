import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getxtest/controllers/member/memberListController.dart';
import 'package:getxtest/models/roomChat.dart';
import 'package:getxtest/service/chat/chatServices.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  List<String> list = [
    'Silakan Chat Saya untuk Keperluan Pemesanan Custom Anda Melalui Aplikasi' +
        '.. Kami akan melayani anda sepenuh hati .. Terima Kasih',
    'Terima kasih Admin .. Saya ingin memesans Breakfast Dengan Tema Western ',
    'Silakan Chat Saya untuk Keperluan Pemesanan Custom Anda Melalui Aplikasi' +
        '.. Kami akan melayani anda sepenuh hati .. Terima Kasih',
    'Terima kasih Admin .. Saya ingin memesans Breakfast Dengan Tema Western ',
    'Silakan Chat Saya untuk Keperluan Pemesanan Custom Anda Melalui Aplikasi' +
        '.. Kami akan melayani anda sepenuh hati .. Terima Kasih',
    'Terima kasih Admin .. Saya ingin memesans Breakfast Dengan Tema Western ',
    'Silakan Chat Saya untuk Keperluan Pemesanan Custom Anda Melalui Aplikasi' +
        '.. Kami akan melayani anda sepenuh hati .. Terima Kasih',
    'Terima kasih Admin .. Saya ingin memesans Breakfast Dengan Tema Western ',
    'Silakan Chat Saya untuk Keperluan Pemesanan Custom Anda Melalui Aplikasi' +
        '.. Kami akan melayani anda sepenuh hati .. Terima Kasih',
    'Terima kasih Admin .. Saya ingin memesans Breakfast Dengan Tema Western ',
    'Silakan Chat Saya untuk Keperluan Pemesanan Custom Anda Melalui Aplikasi' +
        '.. Kami akan melayani anda sepenuh hati .. Terima Kasih',
    'Terima kasih Admin .. Saya ingin memesans Breakfast Dengan Tema Western ',
  ].obs;

  getChatValues() => list;
  setChatValues(var values) => list.add(values);

  //RoomChat? roomModel;
  var isDataLoading = false.obs;
  final ScrollController scrollController = ScrollController();
  final offset = 0.0.obs;
  @override
  void onReady() {
    // scrollController.addListener(() {
    //   offset.value = scrollController.offset;
    // });
  }

  var roomModel = <RoomChatList>[].obs;

  var lengthData = 0.obs;

  @override
  void onInit() {
    //getRoomApi();
    // scrollController.addListener(() {
    //   offset.value = scrollController.offset;
    // });
    super.onInit();
  }

  MemberListController memberListController = Get.put(MemberListController());

  getRoomApi() async {
    try {
      //isDataLoading(true);
      // http.Response response = await http.get(Uri.tryParse(
      //     'https://mini-inventory.balikencana-dev.com/room/chatroom/1')!);
      // if (response.statusCode == 200) {
      //   var result = RoomChat.fromJson(response.body);

      //   if (result != null) {
      //     roomModel.value = result;
      //   }

      var chatlist = await RemoteServices.fetchProducts(19);
      lengthData.value = chatlist!.length;

      // Fluttertoast.showToast(
      //     msg: "id = " + memberListController.user_id.value.toString(),
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);

      //print(chatlist);

      roomModel.value = chatlist!;
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      //isDataLoading(false);
    }
  }

  getRoomApinoRefresh() async {
    try {
      var chatlist = await RemoteServices.fetchProducts(19);
      lengthData.value = chatlist!.length;

      print(chatlist);

      roomModel.value = chatlist!;
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {}
  }

  setChatValuesJml(var len) {
    lengthData.value = len;
  }

  pushChatValues(var len) async {
    roomModel.value.add(RoomChatList.setData([]));

    print(roomModel.last.chat_messages);

    // Fluttertoast.showToast(
    //     msg: roomModel.length.toString(),
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
  }

  // Rx<ScrollController> _controller = ScrollController().obs;

  // setBottomView () => {
  //   _controller.animateTo(
  //   _controller.position.maxScrollExtent,
  //   duration: Duration(seconds: 2),
  //   curve: Curves.fastOutSlowIn,
  // );
  // }
}
