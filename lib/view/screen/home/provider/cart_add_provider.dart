import 'package:flutter/material.dart';
import 'package:task_d_anurag_1786/view/screen/home/model/product_model.dart';

class CartProvider extends ChangeNotifier {
  List cartProduct = [];
  bool added = false;
  addToCart({required Product product}) {
    added = true;
    cartProduct.add(product);
    notifyListeners();
  }

  removeFromCart({required Product product}) {
    added = true;
    cartProduct.remove(product);
    notifyListeners();
  }
}
