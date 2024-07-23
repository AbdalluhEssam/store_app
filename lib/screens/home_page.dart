import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products_servies.dart';

import '../widget/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("New Trend"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.cart),
            onPressed: () {},
          )
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: GetAllProducts().getAllProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products found'));
          } else {
            return Padding(
                padding: const EdgeInsets.only(top: 70, left: 16, right: 16),
                child: GridView.builder(
                  clipBehavior: Clip.none,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 80,
                    childAspectRatio: 1.3,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => CustomCard(
                    productModel: snapshot.data![index],
                  ),
                ));
          }
        },
      ),
    );
  }
}
