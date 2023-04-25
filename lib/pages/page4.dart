import 'package:flutter/material.dart';

class PageDua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Dua Dart")),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(onPressed: () {}, child: Text("<- Back to Page 1")),
        ElevatedButton(onPressed: () {}, child: Text("Navigate to Page 5"))
      ])),
    );
  }
}
