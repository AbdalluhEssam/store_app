import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await Api().get(url: "https://fakestoreapi.com/products/categories");
    List<String> categories = [];

    for (var element in data) {
      categories.add(element);
    }
    return categories;
  }
}
