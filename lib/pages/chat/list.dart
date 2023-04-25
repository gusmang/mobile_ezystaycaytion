import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:getxtest/controllers/chat/roomChat.dart';
import 'package:getxtest/pages/chat/component/bubblelist_kanan.dart';
import 'package:getxtest/pages/chat/component/bubblelist_kiri.dart';
import 'package:getxtest/pages/homepage/home.dart';
//import 'package:getxtest/controllers/chat.dart';

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

  runApp(ChatContainers());
}

class ChatContainers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatContainers();
}

class _ChatContainers extends State<ChatContainers> {
  //const ChatContainers({super.key});

  final _getConnect = GetConnect();

  final myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final ScrollController _scrollController = ScrollController();

// This is what you're looking for!

  Future<void> _scrollDown() async {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
    );
    //_scrollController.animateTo(_scrollController.position.maxScrollExtent);
  }

  ChatController dataController = Get.put(ChatController());

  late Future<dynamic> chatList;

  _onLayoutDone(_) {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void initState() {
    dataController.getRoomApi();
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;

    //   if (notification != null && android != null && !kIsWeb) {
    //     print('A new onMessageOpenedApp event was published pushed Bro!');
    //     flutterLocalNotificationsPlugin.show(
    //       notification.hashCode,
    //       notification.title,
    //       notification.body,
    //       NotificationDetails(
    //         android: AndroidNotificationDetails(
    //           channel.id,
    //           channel.name,
    //           channelDescription: channel.description,
    //           // TODO add a proper drawable resource to android, for now using
    //           //      one that already exists in example app.
    //           icon: 'launch_background',
    //         ),
    //       ),
    //     );
    //     dataController.getRoomApi();

    //     dataController.lengthData.value = dataController.lengthData.value;
    //   }
    // });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print('A new onMessageOpenedApp event was published Bro!');
    //   dataController.getRoomApi();

    //   dataController.lengthData.value = dataController.lengthData.value;
    //   // Navigator.pushNamed(
    //   //   context,
    //   //   '/message',
    //   //   arguments: MessageArguments(message, true),
    //   // );
    // });
    WidgetsBinding.instance.addPostFrameCallback(_onLayoutDone);

    super.initState();
  }

  void _sendPostRequest(String text) async {
    final response = await _getConnect.post(
      'https://mini-inventory.balikencana-dev.com/chat/sendChat',
      {
        "id_villa_room": "1",
        "nama_room": "Kamar No. 1",
        "id_petugas": "1",
        "nama_petugas": "Anton Cahyoo",
        "id_member": "19",
        "chat_messages": text,
        "from_status": "0",
        "message_status": "d",
        'title': "Notifikasi Chat",
        'body': text,
        'token':
            "dfPuPhmGSaSg-3nxZshOph:APA91bErDwmzsGZwCRWCDrC55GjnKt3CN5-xuDM9Aqd8etRTbf1LrpS3c0Ffx5-y39szj9cL7xIyvoULopXAgqDEhgcy76owzcsKceoaR9OemqjsVZsG4ozpetQ7VZrQbDm_xeknO61y"
      },
    );

    FocusManager.instance.primaryFocus?.unfocus();
    _scrollDown();

    dataController.getRoomApinoRefresh();
    //dataController.pushChatValues(dataController.roomModel.length);

    dataController.lengthData.value = dataController.lengthData.value;
    //_scrollDownmax();
  }

  //MemberListController listControllers = Get.put(MemberListController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    //var list = Get.put(Chat());

    return Scaffold(
        appBar: AppBar(
          title: Row(children: [
            GestureDetector(
                onTap: () {
                  navigator?.pushReplacement(
                      MaterialPageRoute(builder: (_) => MainPage()));
                },
                child: const Icon(Icons.chevron_left,
                    size: 28, color: Colors.white)),
            const SizedBox(width: 10),
            const Icon(Icons.account_circle, size: 32, color: Colors.white),
            const SizedBox(width: 10),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  alignment: Alignment.topLeft,
                  width: 200,
                  child: Text("Wayan Avry Kencana",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'OoohBaby',
                          fontWeight: FontWeight.bold))),
              Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(top: 3),
                  width: 200,
                  child: Row(children: const [
                    Icon(Icons.circle,
                        color: Color.fromARGB(255, 113, 241, 117), size: 8),
                    SizedBox(width: 5),
                    Text("Active now",
                        style: TextStyle(color: Colors.white, fontSize: 12))
                  ])),
            ]),
          ]),
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 19, 183, 195),
        ),
        body: Stack(children: <Widget>[
          Container(
              width: screenWidth,
              height: screenHeight - 40,
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(
                top: 20,
                bottom: 60,
              ),
              child: Obx(() {
                if (dataController.isDataLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  // _scrollDown();
                  return SingleChildScrollView(
                      physics: ScrollPhysics(),
                      controller: _scrollController,
                      //  areverse: true,
                      child: Column(children: <Widget>[
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            reverse: true,
                            key: const PageStorageKey("any_text_here"),
                            itemCount: dataController.lengthData.value,
                            itemBuilder: (context, index) {
                              return dataController
                                          .roomModel[index].from_status !=
                                      "0"
                                  ? BubblieChatKiri(dataController
                                      .roomModel[index].chat_messages)
                                  : BubblieChatKanan(dataController
                                      .roomModel[index].chat_messages);
                            })
                      ]));
                }
              })),
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  width: screenWidth,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Container(
                                      width: screenWidth - 80,
                                      height: 40,
                                      child: TextFormField(
                                        controller: myController,
                                        onTap: () {
                                          _scrollDown();
                                        },
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: ' Enter Your Messages ..',
                                        ),
                                      ))),
                              GestureDetector(
                                  onTap: () {
                                    //list.setChatValues("Tes Chats");
                                    _sendPostRequest(
                                        myController.text.toString());

                                    // dataController.pushChatValues(
                                    //     dataController.roomModel.length);

                                    // dataController.lengthData.value =
                                    //     dataController.roomModel.length;
                                    _scrollDown();
                                  },
                                  child: Container(
                                      height: 30,
                                      alignment: Alignment.bottomRight,
                                      width: 30,
                                      child: SizedBox(
                                          width: 30,
                                          child: Container(
                                              child: const Icon(Icons.send))))),
                            ])
                          ]))))
        ]));
  }
}
