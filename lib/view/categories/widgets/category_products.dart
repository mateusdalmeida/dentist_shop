import 'package:dentist_shop/data/products_data.dart';
import 'package:dentist_shop/models/product_model.dart';
import 'package:dentist_shop/widgets/products_list.dart';
import 'package:flutter/material.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({
    super.key,
    required this.category,
  });

  final ProductCategoriesEnum category;

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> items =
        products.where((el) => el.category == category).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ProductsList(products: items),
    );
  }
}
