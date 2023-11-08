import 'package:dio/dio.dart';

import '../view/screen/home/model/product_model.dart';

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();
  String api = "https://dummyjson.com/products?limit=100";

  Dio dio = Dio();
  List<Product> Products =[];
  Future<List<Product>?> getData() async {
    Response response = await dio.get(api);

    if (response.statusCode == 200) {
      List allData = response.data['products'];
      List<Product> allProducts =
          allData.map((e) => Product.fromMap(data: e)).toList();
      Products = allProducts;
      return Products;
    }
  }
}
