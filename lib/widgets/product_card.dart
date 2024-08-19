import 'package:dentist_shop/constants/text_styles.dart';
import 'package:dentist_shop/models/product_model.dart';
import 'package:dentist_shop/utils.dart';
import 'package:dentist_shop/view/product_details/product_details.dart';
import 'package:dentist_shop/widgets/build_widgets.dart';
import 'package:dentist_shop/widgets/product_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final int saleValue =
        Utils.calculateSaleValue(product.value, product.discount);
    final bool hasDiscount = product.discount != null;

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetails(product: product)));
      },
      child: Ink(
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 120,
              child: ProductImage(imageUrl: product.image),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildWidgets.discountWidget(product.discount),
                  Text(
                    product.title,
                    style: AppTextStyles.title,
                  ),
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
          ],
        ),
      ),
    );
  }
}
