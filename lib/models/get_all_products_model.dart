class ProductModel {
  final int id;
  final String title;
  // final dynamic price;
  final String description;
  final String category;
  final String image;
  final RatingModle ratingModle;
  ProductModel({
    required this.id,
    required this.title,
    // required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratingModle,
  });

  factory ProductModel.fromJson(ProductData) {
    return ProductModel(
      id: ProductData['id'],
      title: ProductData['title'],
      // price: double.parse(
      //   ProductData['price'],
      // ),
      description: ProductData['description'],
      category: ProductData['category'],
      image: ProductData['image'],
      ratingModle: RatingModle.fromJson(
        ProductData['rating'],
      ),
    );
  }
}

class RatingModle {
  // final dynamic rate;
  final int count;
  RatingModle({
    // required this.rate,
    required this.count,
  });
  factory RatingModle.fromJson(RateData) {
    return RatingModle(
      // rate: double.parse(RateData['rate']),
      count: RateData['count'],
    );
  }
}
