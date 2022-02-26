import 'package:flutter/material.dart';

class ProductItemModel {
  String name;
  int qty;
  double price;
  String image;
  double rating;
  List<Color> color;

  ProductItemModel(
      {required this.name,
      required this.price,
      required this.color,
      required this.image,
      this.qty = 0,
      this.rating = 0});
}
