import 'package:flutter/material.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update_product.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // useMaterial3: false,

        scaffoldBackgroundColor: Colors.white
      ),
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdateProductPage.id: (context) =>  const UpdateProductPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
