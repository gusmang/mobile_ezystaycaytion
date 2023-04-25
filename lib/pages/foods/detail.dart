import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getxtest/pages/foods/component/isi.dart';

class DetailFoodsNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [FoodsContainer()])
      ],
    ));
  }
}
