import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> users = [];
  final List<Map<String, dynamic>> cart = [];
  final List<Map<String, dynamic>> wishlist = [];

  void addUser(Map<String, dynamic> user){
    users.add(user);

    notifyListeners();
  }


  void addCart(Map<String, dynamic> product){
    cart.add(product);

    notifyListeners();
  }

  void removeCart(Map<String, dynamic> product){
    cart.remove(product);

    notifyListeners();
  }
  void addWishlist(Map<String, dynamic> product){
    wishlist.add(product);

    notifyListeners();
  }
  void removeWishlist(Map<String, dynamic> product){
    wishlist.remove(product);

    notifyListeners();
  }



}