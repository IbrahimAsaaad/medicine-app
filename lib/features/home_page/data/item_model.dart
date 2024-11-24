import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/helpers/category_type.dart';

class ItemModel {
  String? id;
  String? nameDart;
  String? image;
  String? desc;
  CategoryType type;

  ItemModel({
    required this.nameDart,
    required this.image,
    required this.id,
    required this.desc,
    this.type = CategoryType.unKnown,
  });

  factory ItemModel.fromJson(
          QueryDocumentSnapshot<Map<String, dynamic>> json) =>
      ItemModel(
        id: json.id,
        nameDart: json.data()["name"],
        image: json.data()["image"],
        desc: json.data()["decs"],
        type: CategoryType.fromNullableInt(int.tryParse(json.data()['type'].toString())),
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": nameDart,
      "image": image,
      "decs": desc,
      "type": type.value,
    };
  }
}
