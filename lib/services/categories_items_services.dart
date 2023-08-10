import 'package:store_app/helper/public_methods.dart';
import 'package:store_app/models/gategory_item_model.dart';

class CategoryItemService {
  Future<List<CategoryItemModel>> GetCategoryItem({
    required String categoryName,
  }) async {
    // ignore: missing_required_param
    List<dynamic> data = await GetMethods().getResponse(
      uRl: 'https://fakestoreapi.com/products/category/$categoryName',
    );
    List<CategoryItemModel> categoryItemList = [];
    for (int i = 0; i < data.length; i++) {
      categoryItemList.add(
        CategoryItemModel.fromJson(
          data[i],
        ),
      );
    }
    return categoryItemList;
  }
}
