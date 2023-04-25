import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getxtest/config/colorUtils.dart';
import 'package:getxtest/pages/component/widget/imageList/imageSliders.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class Sliders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: 200,
      padding: EdgeInsets.only(left: 10),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Stack(children: <Widget>[
            Positioned(
                child: Container(
              width: screenWidth / 1.25,
              height: 200,
              margin: const EdgeInsets.only(
                right: 5,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://www.water-sports-bali.com/wp-content/uploads/2018/08/10-Halal-Breakfast-Places-In-Bali-Facebook.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            )),
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
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: screenWidth / 1.25,
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 7, bottom: 3),
                              child: Row(children: [
                                AnimatedTextKit(
                                    animatedTexts: [
                                      ColorizeAnimatedText(
                                        'Balinese BreakFast 001',
                                        textAlign: TextAlign.right,
                                        textStyle: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                        colors: [
                                          Colors.white,
                                          Color.fromARGB(255, 251, 245, 190),
                                          Color.fromARGB(255, 249, 238, 140),
                                          Color.fromARGB(255, 247, 236, 91),
                                        ],
                                      )
                                    ],
                                    isRepeatingAnimation: true,
                                    repeatForever: true),
                                const SizedBox(width: 5),
                                Icon(Icons.star,
                                    size: 12, color: AppColors().primary),
                                Icon(Icons.star,
                                    size: 12, color: AppColors().primary),
                                Icon(Icons.star,
                                    size: 12, color: AppColors().primary),
                                Icon(Icons.star,
                                    size: 12, color: AppColors().primary),
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
                                  style: TextStyle(
                                      color: Colors.grey[200], fontSize: 10))),
                        ]))),
          ]),
          Stack(children: <Widget>[
            Positioned(
                child: Container(
              width: screenWidth / 1.25,
              height: 200,
              margin: const EdgeInsets.only(
                right: 5,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://www.lingobest.com/free-online-english-course/wp-content/uploads/2020/12/Blog-Banners-Bruna-2.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            )),
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
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: screenWidth / 1.25,
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10, bottom: 3),
                              child: Row(children: [
                                AnimatedTextKit(
                                    animatedTexts: [
                                      ColorizeAnimatedText(
                                        'American BreakFast 001',
                                        textAlign: TextAlign.right,
                                        textStyle: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                        colors: [
                                          Colors.white,
                                          Color.fromARGB(255, 251, 245, 190),
                                          Color.fromARGB(255, 249, 238, 140),
                                          Color.fromARGB(255, 247, 236, 91),
                                        ],
                                      )
                                    ],
                                    isRepeatingAnimation: true,
                                    repeatForever: true),
                                const SizedBox(width: 2),
                                Icon(Icons.star,
                                    size: 12, color: AppColors().primary),
                                Icon(Icons.star,
                                    size: 12, color: AppColors().primary),
                                Icon(Icons.star,
                                    size: 12, color: AppColors().primary),
                                Icon(Icons.star,
                                    size: 12, color: AppColors().primary),
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
                                  style: TextStyle(
                                      color: Colors.grey[200], fontSize: 10))),
                        ]))),
          ]),
          Stack(children: <Widget>[
            Positioned(
                child: Container(
              width: screenWidth / 1.25,
              height: 200,
              margin: const EdgeInsets.only(
                right: 5,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://assets.epicurious.com/photos/57d6d4ecc026b8825f89012a/master/w_1000,h_674,c_limit/traditional-japanese-breakfast.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            )),
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
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: screenWidth / 1.25,
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10, bottom: 3),
                              child: Row(children: [
                                AnimatedTextKit(
                                    animatedTexts: [
                                      ColorizeAnimatedText(
                                        'Japanese BreakFast 001',
                                        textAlign: TextAlign.right,
                                        textStyle: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                        colors: [
                                          Colors.white,
                                          Color.fromARGB(255, 251, 245, 190),
                                          Color.fromARGB(255, 249, 238, 140),
                                          Color.fromARGB(255, 247, 236, 91),
                                        ],
                                      )
                                    ],
                                    isRepeatingAnimation: true,
                                    repeatForever: true),
                                const SizedBox(width: 2),
                                Icon(Icons.star,
                                    size: 12, color: AppColors().primary),
                                Icon(Icons.star,
                                    size: 12, color: AppColors().primary),
                                Icon(Icons.star,
                                    size: 12, color: AppColors().primary),
                                Icon(Icons.star,
                                    size: 12, color: AppColors().primary),
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
                                  style: TextStyle(
                                      color: Colors.grey[200], fontSize: 10))),
                        ]))),
          ])
        ],
      ),
    );
  }
}
