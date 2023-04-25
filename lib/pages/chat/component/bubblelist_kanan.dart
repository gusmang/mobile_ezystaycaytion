import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BubblieChatKanan extends StatelessWidget {
  var textChat;

  BubblieChatKanan(this.textChat);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          width: screenWidth,
          padding: EdgeInsets.all(10),
          alignment: Alignment.topRight,
          child: Container(
              constraints: BoxConstraints(maxWidth: screenWidth - 100),
              padding: EdgeInsets.all(10),
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 19, 183, 195),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(10.0)),
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
                  child:
                      Text(textChat, style: TextStyle(color: Colors.white)))))
    ]);
  }
}
