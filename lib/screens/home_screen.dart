import 'package:flutter/material.dart';
import 'package:store_app/models/get_all_products_model.dart';
import 'package:store_app/services/products_service.dart';
import 'package:store_app/widgets/card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios_new,
        ),
        title: Text(
          'New Trend',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 16.0,
          left: 16,
          top: 100,
        ),
        child: FutureBuilder<List<ProductModel>>(
          future: GetAllProducts().getProucts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> product = snapshot.data!;
              return GridView.builder(
                itemCount: product.length,
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  mainAxisSpacing: 100,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  return CustomCard(
                    productModel: product[index],
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}


//The argument type 'Future<List<ProductModel>>' can't be assigned to the parameter type 'Stream<List<ProductModel>>?'.