import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widget/custom_text_feild.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  static String id = "update product";

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  late TextEditingController productName,
      desc,
      image,
      price = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    productName = TextEditingController();
    desc = TextEditingController();
    image = TextEditingController();
    price = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)?.settings.arguments as ProductModel;
    productName.text = productModel.title.toString();
    desc.text = productModel.description.toString();
    image.text = productModel.image.toString();
    price.text = productModel.price.toString();
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Update Product"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormFiled(
                  onChanged: (data) {
                    productName.text = data;
                    log(productName.text.toString());
                  },
                  controller: productName,
                  hintText: "Product Name",
                ),
                CustomTextFormFiled(
                  isNumber: true,
                  controller: price,
                  onChanged: (data) {
                    price.text = data;
                  },
                  hintText: "Product Price",
                ),
                CustomTextFormFiled(
                  onChanged: (data) {
                    desc.text = data;
                  },
                  controller: desc,
                  hintText: "Product Description",
                ),
                CustomTextFormFiled(
                  onChanged: (data) {
                    image.text = data;
                  },
                  controller: image,
                  hintText: "Product Image",
                ),
                const SizedBox(
                  height: 50,
                ),
                OutlinedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 90))),
                  onPressed: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProductService(productModel);
                      Navigator.of(context).pop();

                      print("success");
                    } catch (e) {
                      print(e);
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text("Update Product"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProductService(ProductModel productModel) async {
    await UpdateProduct().updateProduct(
        id: productModel.id.toString(),
        title: productName.text.isEmpty
            ? productModel.title.toString()
            : productName.text,
        price: price.text.isEmpty ? productModel.price.toString() : price.text,
        desc:
            desc.text.isEmpty ? productModel.description.toString() : desc.text,
        image: image.text.isEmpty ? productModel.image.toString() : image.text,
        category: productModel.category.toString());
  }
}
