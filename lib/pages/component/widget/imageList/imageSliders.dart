import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class ImageSliders extends StatelessWidget {
  String imageUrl = "";

  ImageSliders(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return CachedNetworkImage(
      imageUrl: this.imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: screenWidth / 1.25,
        height: 200,
        margin: const EdgeInsets.only(
          right: 5,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
      ),
      placeholder: (context, url) => Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(width: 80, height: 80, child: CircularProgressIndicator())
      ])),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
