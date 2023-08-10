import 'package:store_app/helper/public_methods.dart';
import 'package:store_app/models/get_all_products_model.dart';

class GetAllProducts {
  Future<List<ProductModel>> getProucts() async {
    // ignore: missing_required_param
    List<dynamic> data = await GetMethods().getResponse(
      uRl: 'https://fakestoreapi.com/products',
    );
    List<ProductModel> ProductsList = [];
    for (int i = 0; i < data.length; i++) {
      ProductsList.add(
        ProductModel.fromJson(
          data[i],
        ),
      );
    }
    return ProductsList;
  }
}
