import 'package:dentist_shop/data/products_data.dart';
import 'package:dentist_shop/models/product_model.dart';
import 'package:dentist_shop/widgets/products_list.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> likes = [];

    List<ProductModel> items =
        products.where((el) => likes.contains(el.id)).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
      ),
      body: ProductsList(products: items),
    );
  }
}
