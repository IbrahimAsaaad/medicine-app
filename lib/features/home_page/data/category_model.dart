import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String? id;
  String? label;
  String? image;
  String? uid;

  CategoryModel({
    required this.label,
    required this.image,
    required this.id,
    this.uid,
  });

  factory CategoryModel.fromJson(
          QueryDocumentSnapshot<Map<String, dynamic>> json) =>
      CategoryModel(
        id: json.id,
        label: json.data()["label"],
        image: json.data()["image"],
        uid: json.data()["uid"],
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "label": label,
      "image": image,
      "uid": uid,
    };
  }
}
