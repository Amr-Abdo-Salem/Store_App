import 'package:store_app/helper/public_methods.dart';

class GetAllCategoryService {
  Future<List<dynamic>> getCategorty() async {
    // ignore: missing_required_param
    List<dynamic> data = await GetMethods().getResponse(
      uRl: 'https://fakestoreapi.com/products/categories',
    );

    return data;
  }
}
