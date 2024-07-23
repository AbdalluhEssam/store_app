import 'dart:developer';

import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProducts {
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> data = await Api().get(url: "https://fakestoreapi.com/products");

    List<ProductModel> productList = [];
    productList.addAll(data.map((e) => ProductModel.fromJson(e)));

    log(productList.first.title.toString());

    return productList;
  }
}
