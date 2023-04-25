import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtest/pages/pagetiga.dart';

class PageDua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Dua Dart")),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(children: [
          ElevatedButton(onPressed: () {}, child: Text("<- Back to Page 1")),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                navigator?.push(MaterialPageRoute(builder: (_) => PageTiga()));
              },
              child: Text("Navigate to Page 3"))
        ])
      ])),
    );
  }
}
