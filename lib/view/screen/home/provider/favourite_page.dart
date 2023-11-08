import 'package:flutter/material.dart';
import 'package:task_d_anurag_1786/helper/api_helper.dart';
import 'package:task_d_anurag_1786/view/screen/home/model/product_model.dart';

class FaouriteProvider extends ChangeNotifier {
  List favProduct = [];
  bool added = false;

  addToFavourite({required Product product}) {
    added = true;

    favProduct.add(product);

    notifyListeners();
  }

  removeFromFavourite({required Product product}) {
    added = false;

    favProduct.remove(product);

    notifyListeners();
  }
}
