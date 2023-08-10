import 'package:store_app/helper/public_methods.dart';
import 'package:store_app/models/get_all_products_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({
    int? id,
    required String title,
    // required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    // ignore: missing_required_param
    Map<String, dynamic> updateData = await GetMethods().putResponse(
      uRl: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        // 'price': price,
        'description': description,
        'image': image,
        'category': description,
      },
    );
    return ProductModel.fromJson(updateData);
  }
}
