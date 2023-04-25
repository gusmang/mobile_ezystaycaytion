import 'package:flutter/material.dart';

class PageTiga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Tiga Dart")),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(onPressed: () {}, child: Text("<- Back to Page 1")),
        SizedBox(height: 10),
        ElevatedButton(onPressed: () {}, child: Text("Navigate to Page 4"))
      ])),
    );
  }
}
