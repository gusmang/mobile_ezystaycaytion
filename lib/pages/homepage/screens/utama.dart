import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getxtest/config/colorUtils.dart';
import 'package:getxtest/controllers/counters.dart';
import 'package:getxtest/pages/component/sliderhome/best_transport.dart';
import 'package:getxtest/pages/component/sliderhome/bestsellers.dart';
import 'package:getxtest/pages/component/sliderhome/sliders.dart';
import 'package:getxtest/pages/foods/detail.dart';
import 'package:getxtest/pages/page4.dart';
import 'package:getxtest/pages/payment/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeUtama extends StatelessWidget {
  final counterC = Get.put(Counter());
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: ListView(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey.shade300, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                padding: const EdgeInsets.only(
                    left: 10, right: 5, top: 5, bottom: 5),
                child: Row(children: [
                  Container(
                      width: (screenWidth) - 90,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 10.0,
                          color: Colors.black54,
                        ),
                        child: AnimatedTextKit(
                          isRepeatingAnimation: true,
                          repeatForever: true,
                          animatedTexts: [
                            TypewriterAnimatedText(
                                speed: const Duration(milliseconds: 100),
                                'Find Something Interesting ?'),
                            TypewriterAnimatedText(
                                speed: const Duration(milliseconds: 100),
                                'Want to Know Detail of Item or Direct Payment ?'),
                            TypewriterAnimatedText(
                                speed: const Duration(milliseconds: 100),
                                'Click Scan Icon On The Right Side'),
                            TypewriterAnimatedText(
                                speed: const Duration(milliseconds: 100),
                                'Finally , Directed to the Page'),
                          ],
                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                      )),
                  GestureDetector(
                      onTap: () async {
                        PermissionStatus cameraStatus =
                            await Permission.camera.request();

                        if (cameraStatus.isGranted) {
                          //await availableCameras();
                          //await scanner.scan();
                          String? cameraScanResult = await scanner.scan();
                          counterC
                              .setScannedString(cameraScanResult!.split("#"));
                          //Get.to(PaymentPage(), arguments: [cameraScanResult]);
                          navigator?.push(MaterialPageRoute(
                              builder: (_) => const PaymentPage()));
                        }

                        //   Fluttertoast.showToast(
                        //       msg: cameraScanResult.toString(),
                        //       toastLength: Toast.LENGTH_SHORT,
                        //       gravity: ToastGravity.CENTER,
                        //       timeInSecForIosWeb: 1,
                        //       backgroundColor: Colors.red,
                        //       textColor: Colors.white,
                        //       fontSize: 16.0);
                        // }
                        // var status = await Permissions.camera.status;
                        //await scanner.scan();
                        // We didn't ask for permission yet or the permission has been denied before but not permanently.
                      },
                      child: Container(
                          width: 50,
                          alignment: Alignment.topRight,
                          child: const Icon(Icons.qr_code_scanner))),
                ]),
              )),
          const SizedBox(height: 10),
          Sliders(),
          const SizedBox(height: 15),
          Container(
              padding: const EdgeInsets.all(10),
              child: Card(
                color: AppColors().primary,
                child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors().primary,
                          Color.fromARGB(255, 0, 110, 108),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.shopping_bag,
                          color: Colors.white, size: 42),
                      title: AnimatedTextKit(
                        animatedTexts: [
                          ColorizeAnimatedText(
                            'Total Orders',
                            textStyle: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            colors: [
                              Colors.white,
                              Colors.white70,
                              Colors.white54,
                              Colors.white38,
                            ],
                          )
                        ],
                        isRepeatingAnimation: true,
                        repeatForever: true,
                      ),
                      subtitle: Text('Jumlah Item : 2',
                          style: GoogleFonts.lato(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70)),
                      trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedTextKit(animatedTexts: [
                              ColorizeAnimatedText(
                                'IDR',
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
                            const SizedBox(height: 3),
                            const Text("150 K",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ))
                          ]),
                    )),
              )),
          const SizedBox(height: 10),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(children: [
                Container(
                    child: Text("Best Seller",
                        style: GoogleFonts.lato(
                            fontSize: 14, fontWeight: FontWeight.bold))),
                GestureDetector(
                    onTap: () {
                      navigator?.push(
                          MaterialPageRoute(builder: (_) => DetailFoodsNew()));
                    },
                    child: Container(
                        alignment: Alignment.bottomRight,
                        width: screenWidth - 90,
                        child: Text("See All  >",
                            textAlign: TextAlign.right,
                            style: GoogleFonts.lato(fontSize: 11)))),
              ])),
          BestSellers(),
          const SizedBox(height: 10),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(children: [
                Container(
                    child: Text("Best Transport",
                        style: GoogleFonts.lato(
                            fontSize: 14, fontWeight: FontWeight.bold))),
                Container(
                    alignment: Alignment.bottomRight,
                    width: screenWidth - 120,
                    child: Text("See All  >",
                        textAlign: TextAlign.right,
                        style: GoogleFonts.lato(fontSize: 11))),
              ])),
          BestTransport(),
        ],
      ),
    );
  }
}
