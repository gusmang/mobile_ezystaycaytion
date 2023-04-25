import 'dart:convert';
import 'package:get/get.dart';

List<RoomChatList> chatFromJson(Map<String, dynamic> json) =>
    List<RoomChatList>.from(json["data"].map((x) => RoomChatList.fromJson(x)));

String chatToJson(List<RoomChatList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RoomChatList {
  RoomChatList(int list, String messages,
      {this.id,
      this.id_villa,
      this.nama_room,
      this.id_petugas,
      this.id_member,
      this.from_status,
      this.chat_messages,
      this.message_status});

  int? id;
  String? id_villa;
  String? nama_room;
  String? id_petugas;
  String? id_member;
  String? from_status;
  String? chat_messages;
  String? message_status;

  var isFavorite = false.obs;

  RoomChatList.setData(list) {
    this.id = 1;
    this.id_villa = "1";
    this.nama_room = "Kamar no.1 ";
    this.id_petugas = "1";
    this.id_member = "19";
    this.from_status = "1";
    this.chat_messages = "tes";
    this.message_status = "d";
  }

  factory RoomChatList.fromJson(Map<String, dynamic> json) =>
      RoomChatList(1, "",
          id: json['id'],
          id_villa: json['id_villa'],
          nama_room: json['nama_room'],
          id_petugas: json['id_petugas'],
          id_member: json['id_member'],
          from_status: json['from_status'],
          chat_messages: json['chat_messages'],
          message_status: json['message_status']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_villa": id_villa,
        "nama_room": nama_room,
        "id_petugas": id_petugas,
        "id_member": id_member,
        "from_status": from_status,
        "chat_messages": chat_messages,
        "message_status": message_status,
      };
}

class Info {
  int? id;
  String? id_villa;
  String? nama_room;
  String? id_petugas;
  String? id_member;
  String? from_status;
  String? chat_messages;
  String? message_status;

  Info(this.id, this.nama_room, this.id_petugas, this.id_member,
      this.from_status, this.chat_messages, this.message_status);
}
