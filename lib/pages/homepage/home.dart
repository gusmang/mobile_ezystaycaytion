import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getxtest/config/auth.dart';
import 'package:getxtest/config/colorUtils.dart';
import 'package:getxtest/controllers/cart/list.dart';
import 'package:getxtest/pages/auth/login.dart';
import 'package:getxtest/pages/cart/list.dart';
import 'package:getxtest/pages/chat/list.dart';
import 'package:getxtest/pages/component/widget/badge.dart';
import 'package:getxtest/pages/component/widget/badgenocircle.dart';
import 'package:getxtest/pages/component/widget/imageList/imageGrid.dart';
import 'package:getxtest/pages/component/widget/imageList/imagePopUp.dart';
import 'package:getxtest/pages/homepage/screens/activities.dart';
import 'package:getxtest/pages/homepage/screens/adventures.dart';
import 'package:getxtest/pages/homepage/screens/food.dart';
import 'package:getxtest/pages/homepage/screens/transport.dart';
import 'package:getxtest/pages/homepage/screens/utama.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:getxtest/config/auth.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyHomePage();
}

class MyHomePage extends State<MainPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  final FirebaseAuth _auth = FirebaseAuth.instance..authStateChanges();
  CartController cartsControllers = Get.put(CartController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (context) {
            double screenWidth = MediaQuery.of(context).size.width;
            double screenHeight = MediaQuery.of(context).size.height;
            return SimpleDialog(
                contentPadding: const EdgeInsets.all(10),
                children: <Widget>[
                  Center(
                      child: Column(children: [
                    Container(
                        width: 250,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text(
                            "Travelling Mudah , Hemat dan Aman dengan  Aplikasi Bali Cash ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold))),
                    ImagePopUp(
                        "https://balicash.money/wp-content/themes/balicash_v1/image/popup-freetopup.png"),
                    Container(
                        width: screenWidth,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(10),
                              backgroundColor: const Color.fromARGB(
                                  255, 19, 183, 195), // Background color
                            ),
                            onPressed: () {
                              navigator?.push(MaterialPageRoute(
                                  builder: (_) => MainPage()));
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.download),
                                  Text(" Download Sekarang")
                                ])))
                  ]))
                ]);
          });
    });
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    CartController dataController = Get.put(CartController());

    // setState(() {
    //   showDialog(
    //       context: context,
    //       builder: (context) {
    //         return SimpleDialog(children: <Widget>[
    //           Center(child: Container(child: Text('foo')))
    //         ]);
    //       });
    // });

    return DefaultTabController(
        initialIndex: 0, //optional, starts from 0, select the tab by default
        length: 5,
        child: Scaffold(
            key: scaffoldKey,
            drawer: Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: AppColors().primary),
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Container(
                              height: 50,
                              width: 80,
                              margin: const EdgeInsets.only(
                                top: 5,
                              ),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    "https://asahospitality.co.id/public/welcome/1675309362voxilqfwrhkyugndztepabscmj.png",
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              )),
                          const SizedBox(height: 5),
                          AnimatedTextKit(
                            animatedTexts: [
                              ColorizeAnimatedText(
                                'AsaHospitality Villa',
                                textStyle: GoogleFonts.lato(fontSize: 19),
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
                          const SizedBox(height: 2),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.email,
                                    size: 11, color: Colors.white70),
                                const SizedBox(width: 5),
                                Text('info@asahospitality.co.id',
                                    style: GoogleFonts.lato(
                                        fontSize: 10, color: Colors.white70)),
                                const SizedBox(width: 5),
                                const Icon(Icons.phone,
                                    size: 11, color: Colors.white70),
                                const SizedBox(width: 5),
                                Text('+6281936384166',
                                    style: GoogleFonts.lato(
                                        fontSize: 10, color: Colors.white70))
                              ]),
                          const SizedBox(height: 5),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.facebook,
                                    size: 24, color: Colors.white70),
                                SizedBox(width: 10),
                                Icon(Icons.g_mobiledata,
                                    size: 24, color: Colors.white70),
                                SizedBox(width: 10),
                                Icon(Icons.android,
                                    size: 24, color: Colors.white70),
                                SizedBox(width: 10),
                                Icon(Icons.whatsapp,
                                    size: 24, color: Colors.white70),
                                SizedBox(width: 10),
                              ])
                        ])),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                    ),
                    title: const Text('Page 1'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.train,
                    ),
                    title: const Text('Page 2'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: Row(children: [
                Container(
                    width: screenWidth - 85,
                    child: Row(children: [
                      InkWell(
                          onTap: () {
                            scaffoldKey.currentState?.openDrawer();
                          },
                          child: Icon(
                            Icons.menu,
                            color: AppColors().primary,
                            size: 21,
                          )),
                      const SizedBox(width: 10),
                      Container(
                          height: 35,
                          width: 35,
                          margin: const EdgeInsets.only(
                            top: 5,
                          ),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: NetworkImage(
                                _auth.currentUser != null
                                    ? _auth.currentUser!.photoURL.toString()
                                    : "",
                              ),
                              fit: BoxFit.cover,
                            ),
                          )),
                      const SizedBox(width: 10),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                alignment: Alignment.topLeft,
                                width: screenWidth - 180,
                                child: Text("Welcome to Kamar 146,",
                                    style: GoogleFonts.lato(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors().primary))),
                            Container(
                                alignment: Alignment.topLeft,
                                width: screenWidth - 180,
                                child: Text(
                                    _auth.currentUser == null
                                        ? "Gusmang Asmara"
                                        : _auth.currentUser!.displayName
                                            .toString(),
                                    style: GoogleFonts.lato(
                                        fontSize: 11, color: Colors.black54))),
                          ])
                    ])),
                Stack(children: <Widget>[
                  Container(
                      alignment: Alignment.topRight,
                      width: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(width: 4),
                          GestureDetector(
                              onTap: () {
                                navigator?.pushReplacement(MaterialPageRoute(
                                    builder: (_) => ChatContainers()));
                              },
                              child: BadgeWidget(
                                  12,
                                  12,
                                  "14",
                                  const Icon(Icons.chat,
                                      size: 21, color: Colors.black))),
                          const SizedBox(width: 4),
                          GestureDetector(
                              onTap: () async {
                                navigator?.pushReplacement(MaterialPageRoute(
                                    builder: (_) => CartItemsList()));
                                // await _googleSignIn.disconnect();
                                // await FirebaseAuth.instance.signOut();

                                // final FirebaseAuth auth = FirebaseAuth.instance
                                //   ..authStateChanges();

                                // if (auth.currentUser == null) {
                                //   navigator?.pushReplacement(MaterialPageRoute(
                                //       builder: (_) => LoginAuth()));
                                // }
                              },
                              child: Obx(() => BadgeWidget(
                                  12,
                                  12,
                                  cartsControllers.lengthData.value.toString(),
                                  const Icon(Icons.shopping_cart,
                                      size: 21, color: Colors.black)))),
                        ],
                      ))
                ])
              ]),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              bottomOpacity: 0.0,
              elevation: 0.0,
            ),
            bottomNavigationBar: const Material(
                color: Color.fromARGB(255, 19, 183, 195),
                child: TabBar(tabs: [
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(
                      height: 60,
                      text: "Foods",
                      icon: Icon(Icons.fastfood, size: 32)),
                  Tab(icon: Icon(Icons.directions_walk)),
                  Tab(icon: Icon(Icons.directions_bike))
                ])),
            body: TabBarView(children: [
              HomeUtama(),
              HomeTransportScreen(),
              HomeFoodScreen(),
              ActivitiesFoodScreen(),
              AdventurerFoodScreen(),
            ])));
  }
}
