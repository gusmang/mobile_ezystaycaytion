import 'dart:convert';
import 'package:get/get.dart';

List<FoodList> foodsFromJson(Map<String, dynamic> json) =>
    List<FoodList>.from(json["data"].map((x) => FoodList.fromJson(x)));

String foodsToJson(List<FoodList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodList {
  FoodList(int list, String messages,
      {this.id,
      this.name,
      this.foto_produk,
      this.small_desc,
      this.kategori,
      this.kategori_name,
      this.countries,
      this.price,
      this.descriptions,
      this.discount});

  int? id;
  String? name;
  String? foto_produk;
  String? small_desc;
  String? kategori;
  String? kategori_name;
  String? countries;
  String? price;
  String? descriptions;
  int? discount;
  int? id_villa;

  var isFavorite = false.obs;

  FoodList.setData(FoodList list) {
    this.id = list.id;
    this.name = list.name;
    this.foto_produk = list.foto_produk;
    this.small_desc = list.small_desc;
    this.kategori = list.kategori;
    this.kategori_name = list.kategori_name;
    this.countries = list.kategori_name;
    this.price = list.price;
    this.descriptions = list.descriptions;
    this.discount = list.discount;
    this.id_villa = list.id_villa;
  }

  factory FoodList.fromJson(Map<String, dynamic> json) => FoodList(1, "",
      id: json['id'],
      name: json['name'],
      foto_produk: json['foto_produk'],
      small_desc: json['small_desc'],
      kategori_name: json['kategori_name'],
      price: json['price'],
      descriptions: json['descriptions'],
      discount: json['discount']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "foto_produk": foto_produk,
        "small_desc": small_desc,
        "kategori_name": kategori_name,
        "price": price,
        "descriptions": descriptions,
        "discount": discount,
      };
}

class Info {
  int? id;
  String? name;
  String? foto_produk;
  String? small_desc;
  String? kategori_name;
  String? price;
  String? descriptions;
  String? discount;

  Info(this.id, this.name, this.foto_produk, this.small_desc,
      this.kategori_name, this.price, this.descriptions, this.discount);
}
