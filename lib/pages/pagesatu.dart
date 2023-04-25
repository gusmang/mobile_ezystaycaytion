import 'package:flutter/material.dart';
import 'package:getxtest/pages/pagedua.dart';
import 'package:get/get.dart';

class PageSatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Satu Dart")),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: () {
              navigator?.push(MaterialPageRoute(builder: (_) => PageDua()));
            },
            child: Text("Navigate to Page 2"))
      ])),
    );
  }
}
