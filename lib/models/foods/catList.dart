import 'dart:convert';
import 'package:get/get.dart';

List<CatList> catFoodsFromJson(Map<String, dynamic> json) =>
    List<CatList>.from(json["data"].map((x) => CatList.fromJson(x)));

String catFoodsToJson(List<CatList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatList {
  CatList(int list, String messages,
      {this.id, this.name, this.id_villa, this.created_at});

  int? id;
  String? name;
  int? id_villa;
  String? created_at;

  var isFavorite = false.obs;

  CatList.setData(list) {
    this.id = 1;
    this.name = "1";
    this.id_villa = 1;
    this.created_at = "2023-01-01";
  }

  factory CatList.fromJson(Map<String, dynamic> json) => CatList(1, "",
      id: json['id'],
      name: json['name'],
      id_villa: json['id_villa'],
      created_at: json['created_at']);

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "id_villa": id_villa, "created_at": created_at};
}

class Info {
  int? id;
  String? name;
  String? id_villa;
  String? created_at;

  Info(this.id, this.name, this.id_villa, this.created_at);
}
