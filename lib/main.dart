//import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getxtest/controllers/chat.dart';
import 'package:getxtest/controllers/chat/roomChat.dart';
//import 'package:getxtest/controllers/counters.dart';
import 'package:getxtest/pages/auth/login.dart';

import 'package:getxtest/pages/homepage/home.dart';
//import 'package:getxtest/pages/pagesatu.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
//import 'dart:convert';

import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;

// import 'package:getxtest/pages/firebase/firebase_options.dart';
// import 'package:getxtest/pages/firebase/message.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // await setupFlutterNotifications();
  // showFlutterNotification(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          // TODO add a proper drawable resource to android, for now using
          //      one that already exists in example app.
          icon: 'launch_background',
        ),
      ),
    );
  }
}

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
//late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    await setupFlutterNotifications();
  }

  runApp(_MainScreen());
}

class _MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<_MainScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  String? _token;
  String? initialMessage;
  bool _resolved = false;
  var list = Get.put(Chat());

  ChatController dataController = Get.put(ChatController());

  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      dataController.getRoomApinoRefresh();

      dataController.lengthData.value = dataController.lengthData.value;

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null && !kIsWeb) {
        list.setChatValues(notification.body);
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      dataController.getRoomApinoRefresh();

      dataController.lengthData.value = dataController.lengthData.value;
      // Navigator.pushNamed(
      //   context,
      //   '/message',
      //   arguments: MessageArguments(message, true),
      // );
    });

    super.initState();
    initDynamicLinks();
  }

  Future<void> initDynamicLinks() async {
    FirebaseDynamicLinks.instance.getInitialLink();
    FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

    //final PendingDynamicLinkData? initialLink =
    //  await FirebaseDynamicLinks.instance.getInitialLink();

    dynamicLinks.onLink.listen((dynamicLinkData) async {
      print('Init Firebase');
      final Uri uri = dynamicLinkData.link;

      // final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks
      //     .instance
      //     .getDynamicLink(Uri.parse(dynamicLinkData.link.toString()));

      final PendingDynamicLinkData? initialLink =
          await FirebaseDynamicLinks.instance.getInitialLink();

      if (uri != null) {
        //     //   final queryParams = uri.queryParameters;
        //     //   if (queryParams.length > 0) {
        //     //     String? id = queryParams["id"];

        //print(dynamicLinkData.link.path);
        //print(error.message);
        //final queryParams = uri.queryParameters;
        //String? kamar = queryParams["id"];
        Fluttertoast.showToast(
            msg: dynamicLinkData.link.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }).onError((error) {
      print('onLink error');
      //print(error.message);
    });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return _auth.currentUser == null
        ? GetMaterialApp(home: LoginAuth())
        : GetMaterialApp(home: MainPage());
  }
}
