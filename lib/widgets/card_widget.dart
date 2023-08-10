import 'package:flutter/material.dart';
import 'package:store_app/models/get_all_products_model.dart';
import 'package:store_app/screens/update_product_screen.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({
    super.key,
    required this.productModel,
  });
  ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          UpdateProductScreen.id,
          arguments: productModel,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            elevation: 10,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 50,
                    spreadRadius: 20,
                    color: Colors.white.withOpacity(0.1),
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.title.substring(0, 7),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$225',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -80,
            left: 70,
            child: Image.network(
              productModel.image,
              height: 120,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
