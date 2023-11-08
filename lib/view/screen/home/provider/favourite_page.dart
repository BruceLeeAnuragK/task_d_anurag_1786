import 'package:flutter/material.dart';
import 'package:task_d_anurag_1786/helper/api_helper.dart';
import 'package:task_d_anurag_1786/view/screen/home/model/product_model.dart';

class FaouriteProvider extends ChangeNotifier {
  List cartProduct = [];
  bool added = false;
  addToFavourite({required Product product}) {
    added = true;

    cartProduct.add(product);

    notifyListeners();
  }
   List allProduct = [];

   addtoList({required })
   {
     allProduct = APIHelper.apiHelper.Products;
   }
  removeFromFavourite({required Product product}) {
    added = false;

    cartProduct.remove(product);

    notifyListeners();
  }
}
