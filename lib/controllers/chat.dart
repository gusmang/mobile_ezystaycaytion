import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chat extends GetxController {
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

  // Rx<ScrollController> _controller = ScrollController().obs;

  // setBottomView () => {
  //   _controller.animateTo(
  //   _controller.position.maxScrollExtent,
  //   duration: Duration(seconds: 2),
  //   curve: Curves.fastOutSlowIn,
  // );
  // }
}
