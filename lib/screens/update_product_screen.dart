import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/get_all_products_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/widget_button.dart';
import 'package:store_app/widgets/widget_textfield.dart';

// ignore: must_be_immutable
class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({super.key});
  static String id = 'Update Screen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, productDescription, productImage, productPrice;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                TextFeildWidget(
                  hintText: 'Update Product Name',
                  lableText: 'Product Name ',
                  onChange: (data) {
                    productName = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFeildWidget(
                  hintText: 'Update Product Description',
                  lableText: 'Product Description ',
                  onChange: (data) {
                    productDescription = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFeildWidget(
                  textInputType: TextInputType.number,
                  hintText: 'Update Product Price',
                  lableText: 'Product Price ',
                  onChange: (data) {
                    productPrice = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFeildWidget(
                  hintText: 'Update Product Image',
                  lableText: 'Product Image ',
                  onChange: (data) {
                    productImage = data;
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                ButtonWidget(
                  buttonText: 'Update',
                  onTab: () async {
                    setState(() {
                      isLoading = true;
                    });

                    try {
                      await UpdateProductService().updateProduct(
                        id: product.id,
                        title:
                            productName == null ? product.title : productName!,
                        // price:
                        //     productPrice == null ? product.price : productPrice!,
                        description: productDescription == null
                            ? product.description
                            : productDescription!,
                        image: productImage == null
                            ? product.image
                            : productImage!,
                        category: product.category,
                      );
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
