import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtest/controllers/counters.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  final counterC = Get.put(Counter());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Obx(
            () => Text(
              style: TextStyle(
                fontSize: 35,
              ),
              "Angka -> ${counterC.counter}",
            ),
          ),
        ),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            onPressed: () => {},
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(
            width: 10,
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () => {},
            tooltip: 'Increment',
            child: const Icon(Icons.exposure_minus_1_sharp),
          )
        ]) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
