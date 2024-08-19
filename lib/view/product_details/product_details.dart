import 'package:dentist_shop/constants/text_styles.dart';
import 'package:dentist_shop/models/product_model.dart';
import 'package:dentist_shop/utils.dart';
import 'package:dentist_shop/widgets/build_widgets.dart';
import 'package:dentist_shop/widgets/product_image.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = MediaQuery.of(context).size.width >= 640;

    final int saleValue =
        Utils.calculateSaleValue(product.value, product.discount);
    final bool hasDiscount = product.discount != null;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Produto"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SizedBox(
              width: isWideScreen ? 400 : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: SizedBox(
                    width: 200,
                    child: ProductImage(
                      imageUrl: product.image,
                    ),
                  )),
                  const SizedBox(height: 16),
                  Text(
                    product.title,
                    style: AppTextStyles.title,
                  ),
                  BuildWidgets.discountWidget(product.discount),
                  if (hasDiscount)
                    Text(
                      Utils.getMoney(product.value),
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough),
                    ),
                  Text(
                    Utils.getMoney(saleValue),
                    style: AppTextStyles.title,
                  ),
                  BuildWidgets.installmentWidget(saleValue),
                  Text(
                    product.status.name.toUpperCase(),
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
