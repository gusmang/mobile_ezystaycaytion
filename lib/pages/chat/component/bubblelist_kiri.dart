import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BubblieChatKiri extends StatelessWidget {
  var textChat;

  BubblieChatKiri(this.textChat);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          width: screenWidth,
          padding: EdgeInsets.all(10),
          alignment: Alignment.topLeft,
          child: Container(
              constraints: BoxConstraints(maxWidth: screenWidth - 100),
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text(textChat.toString())))),
    ]);
  }
}
