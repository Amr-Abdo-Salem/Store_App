class CategoryItemModel {
  final int id;
  final String title;
  // final double price;
  final String dsecription;
  final String category;
  final String image;
  final RatingCategoryModel ratingCategoryModel;

  CategoryItemModel({
    required this.id,
    required this.title,
    // required this.price,
    required this.dsecription,
    required this.category,
    required this.image,
    required this.ratingCategoryModel,
  });

  factory CategoryItemModel.fromJson(CategoryData) {
    return CategoryItemModel(
      id: CategoryData['id'],
      title: CategoryData['title'],
      // price: double.parse(CategoryData['price']),
      dsecription: CategoryData['price'],
      category: CategoryData['category'],
      image: CategoryData['image'],
      ratingCategoryModel: RatingCategoryModel.fromJson(
        CategoryData['rating'],
      ),
    );
  }
}

class RatingCategoryModel {
  final double rate;
  final int count;

  RatingCategoryModel({
    required this.rate,
    required this.count,
  });

  factory RatingCategoryModel.fromJson(RatingData) {
    return RatingCategoryModel(
      rate: double.parse(RatingData['rate']),
      count: RatingData['count'],
    );
  }
}
