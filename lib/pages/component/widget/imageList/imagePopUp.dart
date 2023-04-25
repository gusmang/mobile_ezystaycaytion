import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class ImagePopUp extends StatelessWidget {
  String images;

  ImagePopUp(this.images, {super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return CachedNetworkImage(
      imageUrl: this.images,
      imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
          width: screenWidth,
          height: 180,
          margin: const EdgeInsets.only(bottom: 10)),
      placeholder: (context, url) => Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(width: 50, height: 50, child: CircularProgressIndicator())
      ])),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
