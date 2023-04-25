import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RoomAvailable extends StatelessWidget {
  var roomName;
  var current_user_name;
  var current_photos;

  RoomAvailable(this.roomName, this.current_user_name, this.current_photos,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: Column(children: [
            Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.only(
                  top: 5,
                  right: 10,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      current_photos,
                    ),
                    fit: BoxFit.contain,
                  ),
                ))
          ]),
          title: Text(roomName != "" ? roomName : "No Payment Channel",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black)),
          subtitle:
              Text(current_user_name != "" ? current_user_name : "Available"),
          trailing: Icon(Icons.chevron_right)),
    );
  }
}
