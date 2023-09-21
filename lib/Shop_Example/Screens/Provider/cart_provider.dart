import 'package:flutter/material.dart';

import '../usermodel/model.dart';

List<Products> meat = [
  Products(name: "Chicken", price: 120, image: "assets/shop_images/chikhen1.jpeg",),
  Products(name: "Mutton", price: 350, image: "assets/shop_images/mutton.jpeg"),
  Products(name: "Beef", price: 550, image: "assets/shop_images/beef.jpeg",),
  Products(name: "Pork", price: 620, image: "assets/shop_images/pork.jpeg",),
  Products(name: "Duck", price: 400, image: "assets/shop_images/duck.jpeg",),
];

List<Products> fish = [
  Products(name: "Tuna", price: 120, image: "assets/shop_images/tuna.jpeg"),
  Products(name: "Prawns", price: 100, image: "assets/shop_images/prawns.jpeg"),
  Products(name: "Salmon", price: 500, image: "assets/shop_images/salmon.jpeg"),
  Products(name: "Lobster", price: 800, image: "assets/shop_images/lobster.png"),
];

List<Products> marinated = [
  Products(name: "Chicken", price: 350, image: "assets/shop_images/marinated_chickhen.jpeg",),
  Products(name: "Fish", price: 260, image: "assets/shop_images/marinated_fish.jpeg",),
  Products(name: "Beef", price: 580, image: "assets/shop_images/marinated_beef.jpeg",),
  Products(name: "Mutton", price: 800, image: "assets/shop_images/marinated_mutton.jpeg",),
];

List<Products> readytocook = [
  Products(name: "Fried Chicken", price: 370, image: "assets/shop_images/friedchicken.jpeg",),
  Products(name: "Mock Meat", price: 210, image: "assets/shop_images/mockmeat.jpeg",),
  Products(name: "Roast Pork", price: 430, image: "assets/shop_images/rost_pork.jpeg",),
  Products(name: "Soya Tikka", price: 120, image: "assets/shop_images/soyatikka.jpeg",),
 ];

class CartProvider extends ChangeNotifier {


  var meatt = meat;

  List<Products> get meathome => meatt;

  var fishh = fish;

  List<Products> get fish1 => fishh;

  var marinated1 = marinated;

  List<Products> get marinatedhome => marinated1;

  var readytocookk = readytocook;

  List<Products> get readytocookhome => readytocookk;


  final List<Products> cart = [];

  List<Products> get cartall => cart;

  void addToCart(Products data) {
    int index = cart.indexWhere((element) => element == data);
    if (index != -1 ) {
      cart[index].count =cart[index].count +1;
    }else {
      cart.add(data);
    }
    notifyListeners();
  }

  void removeFromCart(Products data) {
    int index = cart.indexWhere((element) => element == data);
    if (index != -1) {
      if (cart[index].count > 1) {
        cart[index].count--;
      } else {
        cart.removeAt(index);
      }
      notifyListeners();
    }
  }

}