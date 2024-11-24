import 'package:cloud_firestore/cloud_firestore.dart';

class ItemMedicine {
  String id;
  String title;
  String? image;
  double price;
  String? subtitle;
  String? Abb;
  int quantity;

  ItemMedicine({
    required this.title,
    required this.image,
    required this.id,
    this.price = 0.0,
    required this.subtitle,
    required this.Abb,
    this.quantity = 1,
  });

  factory ItemMedicine.fromJson(
          QueryDocumentSnapshot<Map<String, dynamic>> json) =>
      ItemMedicine(
        id: json.id,
        title: json.data()["title"],
        image: json.data()["image"],
        price: double.tryParse(json.data()["price"].toString()) ?? 0.0,
        subtitle: json.data()["subtitle"],
        Abb: json.data()["Abb"],
        quantity: int.tryParse(json.data()["quantity"].toString()) ?? 0,
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "image": image,
      "price": price,
      "Abb": Abb,
      "quantity": "quantity",
    };
  }
}
