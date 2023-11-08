import 'package:flutter/cupertino.dart';
import 'package:task_d_anurag_1786/helper/api_helper.dart';

class ProductProvider extends ChangeNotifier {
  List productList = [];

  addtoProduct() {
    productList.add(APIHelper.apiHelper.getData());
  }
}
