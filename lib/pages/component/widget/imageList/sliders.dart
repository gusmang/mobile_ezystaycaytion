import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getxtest/config/colorUtils.dart';
import 'package:getxtest/pages/component/widget/imageList/imageSliders.dart';

class SlidersImages extends StatelessWidget {
  String imageUrl = "";

  SlidersImages(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(children: <Widget>[
      Positioned(child: ImageSliders(imageUrl)),
      Positioned(
          bottom: 0,
          left: 0,
          child: Container(
              width: screenWidth / 1.25,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black54,
              ),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                    width: screenWidth / 1.25,
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 3),
                    child: Row(children: [
                      AnimatedTextKit(animatedTexts: [
                        ColorizeAnimatedText(
                          'Balinese BreakFast 001',
                          textAlign: TextAlign.right,
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          colors: [
                            Colors.white,
                            Color.fromARGB(255, 251, 245, 190),
                            Color.fromARGB(255, 249, 240, 165),
                            Color.fromARGB(255, 249, 240, 125),
                          ],
                        )
                      ], isRepeatingAnimation: true, repeatForever: true),
                      const SizedBox(width: 2),
                      Icon(Icons.star, size: 12, color: AppColors().primary),
                      Icon(Icons.star, size: 12, color: AppColors().primary),
                      Icon(Icons.star, size: 12, color: AppColors().primary),
                      Icon(Icons.star, size: 12, color: AppColors().primary),
                      Icon(Icons.star_half,
                          size: 12, color: AppColors().primary)
                    ])),
                Container(
                    width: screenWidth / 1.25,
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Text(
                        "Rice , Lawar , Sate Babi , Krupuk Babi , Sambal Matah ",
                        style:
                            TextStyle(color: Colors.grey[200], fontSize: 10))),
              ]))),
    ]);
  }
}
