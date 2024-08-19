import 'package:dentist_shop/constants/colors.dart';
import 'package:dentist_shop/models/product_model.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categorias"),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemCount: ProductCategoriesEnum.values.length,
          separatorBuilder: (context, index) => const Divider(indent: 18),
          itemBuilder: (context, index) {
            ProductCategoriesEnum value = ProductCategoriesEnum.values[index];

            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/products',
                  arguments: {'category': value},
                );
              },
              child: Ink(
                color: Colors.white,
                padding: const EdgeInsets.all(18),
                child: Text(
                  value.title,
                  style: const TextStyle(
                      fontSize: 18, color: AppColors.primaryColor),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
