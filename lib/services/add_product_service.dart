import 'package:store_app/helper/public_methods.dart';
import 'package:store_app/models/get_all_products_model.dart';

class AddProductService {
  Future<ProductModel> addProduct({
    required String title,
    // required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await GetMethods()
        // ignore: missing_required_param
        .postResponse(uRl: 'https://fakestoreapi.com/products', body: {
      'title': title,
      // 'price': price,
      'description': description,
      'image': image,
      'category': category,
    });

    return ProductModel.fromJson(data);
  }
}
