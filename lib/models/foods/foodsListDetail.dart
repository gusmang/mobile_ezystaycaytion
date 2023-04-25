import 'dart:convert';
import 'package:get/get.dart';

List<FoodListDetail> foodsDetailFromJson(Map<String, dynamic> json) =>
    List<FoodListDetail>.from(
        json["data"].map((x) => FoodListDetail.fromJson(x)));

String foodsDetailToJson(List<FoodListDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<SubImages> subImagesFromJson(List<dynamic> json) =>
    List<SubImages>.from(json.map((x) => SubImages.fromJson(x)));

class FoodListDetail {
  FoodListDetail(int list, String messages,
      {this.id,
      this.name,
      this.foto_produk,
      this.small_desc,
      this.kategori,
      this.kategori_name,
      this.countries,
      this.price,
      this.descriptions,
      this.discount,
      this.sub_images});

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
  String? sub_images;

  var isFavorite = false.obs;

  FoodListDetail.setData(list) {
    this.id = 1;
    this.name = "1";
    this.foto_produk = "Kamar no.1 ";
    this.small_desc = "1";
    this.kategori_name = "20";
    this.price = "tes";
    this.descriptions = "tes";
    this.discount = 0;
  }

  factory FoodListDetail.fromJson(Map<String, dynamic> json) =>
      FoodListDetail(1, "",
          id: json['id'],
          name: json['name'],
          foto_produk: json['foto_produk'],
          small_desc: json['small_desc'],
          kategori_name: json['kategori_name'],
          price: json['price'],
          descriptions: json['descriptions'],
          discount: json['discount'],
          sub_images: json['food_subs_img']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "foto_produk": foto_produk,
        "small_desc": small_desc,
        "kategori_name": kategori_name,
        "price": price,
        "descriptions": descriptions,
        "discount": discount,
        "sub_images": sub_images
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

class SubImages {
  //this will handel nested object
  int? id;
  String? foods;

  SubImages({required this.id, required this.foods});

  factory SubImages.fromJson(Map<String, dynamic> json) {
    return SubImages(id: json['id'], foods: json['foods']);
  }
}
