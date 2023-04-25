import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getxtest/config/auth.dart';
import 'package:getxtest/config/colorUtils.dart';
import 'package:getxtest/controllers/auth.dart';
import 'package:getxtest/pages/component/input/passwordField.dart';
import 'package:getxtest/pages/homepage/home.dart';
import 'package:getxtest/pages/homepage/screens/utama.dart';
import 'package:getxtest/pages/increment_page.dart';
import 'package:getxtest/pages/page4.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(MaterialApp(home: LoginAuth()));

class LoginAuth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LoginStates();
}

class LoginStates extends State<LoginAuth> {
  GoogleSignInAccount? _currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  final LoginController controller = Get.put(LoginController());

  void _sendPostRequest(
      String name, String email, String token, String googletoken) async {
    final response = await _getConnect.post(
      'https://mini-inventory.balikencana-dev.com/members/add',
      {'email': email, 'token': token, 'nama': name, 'google_token': "tes"},
    );
  }

  Future<void> _handleSignIn(token) async {
    try {
      //await _googleSignIn.signIn();
      //AuthUsers().SetcurrentUserslogin = _currentUser;
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final authResult = await _auth.signInWithCredential(credential);

      final User? user = authResult.user;

      _sendPostRequest(_currentUser!.displayName.toString(),
          _currentUser!.email.toString(), token, _currentUser!.id.toString());

      assert(user!.isAnonymous);
      assert(await user!.getIdToken() != null);
      final User? currentUser = _auth.currentUser;
      assert(user!.uid == currentUser!.uid);

      //Get.to(MainPage()); // navigate to your wanted page
      return;
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((event) {
      //AuthUsers().SetcurrentUserslogin = event;
      //_auth = event;
      // _handleSignIn();
      setState(() {
        _currentUser = event;
      });
    });

    _googleSignIn.signInSilently();

    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (_currentUser != null) {
        // Fluttertoast.showToast(
        //     msg: "Tidak Kosong ",
        //     toastLength: Toast.LENGTH_LONG,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
        navigator!
            .pushReplacement(MaterialPageRoute(builder: (_) => MainPage()));
      } else {
        // Fluttertoast.showToast(
        //     msg: "Kosong 22",
        //     toastLength: Toast.LENGTH_LONG,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
      }
    });
    super.initState();
    debugPrint("tesss");
  }

  final _getConnect = GetConnect();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: AppColors().primary,
        body: Container(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              Column(children: [
                Container(
                    width: screenWidth / 1.2,
                    child: Column(children: [
                      Image(
                          width: screenWidth / 1.8,
                          image: const AssetImage('assets/chickens.png')),
                      const SizedBox(height: 10),
                      Center(
                        child: Column(children: const [
                          Text(
                            "Welcome Backs",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OoohBaby',
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Please login with your username and password",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: 'Enter Username',
                            ),
                          ),
                          SizedBox(height: 20),
                          PasswordField(),
                        ]),
                      ),
                      SizedBox(height: 10),
                      Container(
                          alignment: Alignment.topRight,
                          child: Text("Forgot Password",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 12))),
                      SizedBox(height: 30),
                      SizedBox(
                          width: screenWidth / 1.2,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20),
                                backgroundColor:
                                    Colors.black, // Background color
                              ),
                              onPressed: () {
                                navigator?.push(MaterialPageRoute(
                                    builder: (_) => MainPage()));
                              },
                              child: const Text("Login"))),
                      const SizedBox(height: 10),
                      Text("OR"),
                      const SizedBox(height: 10),
                      SizedBox(
                          width: screenWidth / 1.2,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(20),
                                backgroundColor:
                                    Colors.red[800], // Background color
                              ),
                              onPressed: () async {
                                String? token =
                                    await FirebaseMessaging.instance.getToken();
                                _handleSignIn(token);
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.adb, size: 24),
                                    SizedBox(width: 10),
                                    Text("Sign In With Google")
                                  ])))
                    ]))
              ])
            ]))));
  }
}
