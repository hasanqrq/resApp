import 'package:flutter/material.dart';
import 'package:resturent_app11/models/productItem.dart';

class Singleton {
  static final Singleton preferance = Singleton();

  List<ProductItemModel> productList = [
    ProductItemModel(
        name: "s3",
        price: 58.00,
        color: [Colors.red, Colors.black],
        image: "4"),
    ProductItemModel(
        name: "watermelon",
        price: 15.00,
        color: [Colors.yellow, Colors.yellow],
        image: "1"),
    ProductItemModel(
        name: "mango",
        price: 52.00,
        color: [Colors.blue, Colors.blue],
        image: "2"),
    ProductItemModel(
        name: "blueburry",
        price: 55.00,
        color: [Colors.pink, Colors.blue],
        image: "3"),
    ProductItemModel(
        name: "avocado",
        price: 55.30,
        color: [Colors.purple, Colors.redAccent],
        image: "4"),
    ProductItemModel(
        name: "grape",
        price: 15.00,
        color: [Colors.redAccent, Colors.purple],
        image: "3"),
    ProductItemModel(
        name: "apple",
        price: 52.00,
        color: [const Color(0xffFBBD7E), const Color(0xffFBBE7E)],
        image: "2"),
    ProductItemModel(
        name: "Strubary",
        price: 85.00,
        color: [Colors.green, Colors.teal],
        image: "4"),
    ProductItemModel(
        name: "s1",
        price: 55.40,
        color: [Colors.teal, Colors.green],
        image: "1"),
    ProductItemModel(
        name: "s2",
        price: 55.00,
        color: [Colors.grey, Colors.green],
        image: "3"),
    ProductItemModel(
        name: "s4",
        price: 65.00,
        color: [Colors.lightBlue, Colors.green],
        image: "3"),
    ProductItemModel(
        name: "s5",
        price: 45.40,
        color: [Colors.indigo, Colors.green],
        image: "2"),
    ProductItemModel(
        name: "s6",
        price: 45.02,
        color: [Colors.deepOrange, Colors.green],
        image: "1"),
  ];
}
