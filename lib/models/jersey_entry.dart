// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  String model;
  String pk;
  Fields fields;

  Product({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String jerseyName;
  DateTime time;
  String description;
  int price;
  int quantity;

  Fields({
    required this.user,
    required this.jerseyName,
    required this.time,
    required this.description,
    required this.price,
    required this.quantity,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        jerseyName: json["jersey_name"],
        time: DateTime.parse(json["time"]),
        description: json["description"],
        price: json["price"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "jersey_name": jerseyName,
        "time":
            "${time.year.toString().padLeft(4, '0')}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}",
        "description": description,
        "price": price,
        "quantity": quantity,
      };
}
