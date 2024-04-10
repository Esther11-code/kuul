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
  void addWhishlist(Map<String, dynamic> product){
    wishlist.add(product);

    notifyListeners();
  }
  void removeWhishlist(Map<String, dynamic> product){
    wishlist.remove(product);

    notifyListeners();
  }



}