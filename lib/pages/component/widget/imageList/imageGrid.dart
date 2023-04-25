import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class ImageGrid extends StatelessWidget {
  String images;

  ImageGrid(this.images, {super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: this.images,
      imageBuilder: (context, imageProvider) => Container(
        height: 150,
        margin: const EdgeInsets.only(
          right: 5,
          bottom: 10,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
      ),
      placeholder: (context, url) => SkeletonGridLoader(
        builder: Card(
          color: Colors.transparent,
          child: GridTile(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 10,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Container(
                  width: 70,
                  height: 10,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        items: 1,
        itemsPerRow: 1,
        period: Duration(seconds: 2),
        highlightColor: Colors.lightBlue,
        direction: SkeletonDirection.ltr,
        childAspectRatio: 1,
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
