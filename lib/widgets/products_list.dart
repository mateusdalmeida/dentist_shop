import 'package:dentist_shop/models/product_model.dart';
import 'package:dentist_shop/widgets/not_found.dart';
import 'package:dentist_shop/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  const ProductsList(
      {super.key, required this.products, this.nerverScroll = false});

  final bool nerverScroll;

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const Center(child: NotFound());
    return ListView.separated(
      shrinkWrap: nerverScroll,
      physics: nerverScroll ? const NeverScrollableScrollPhysics() : null,
      itemCount: products.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        ProductModel item = products[index];

        return ProductCard(product: item);
      },
    );
  }
}
