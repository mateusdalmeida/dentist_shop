import 'package:dentist_shop/models/product_model.dart';
import 'package:dentist_shop/view/categories/widgets/categories_list.dart';
import 'package:dentist_shop/view/categories/widgets/category_products.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        Widget page;

        final arguments = settings.arguments as Map<String, dynamic>?;

        switch (settings.name) {
          case '/products':
            final ProductCategoriesEnum category = arguments?['category'];
            page = CategoryProducts(category: category);
            break;
          default:
            page = const CategoriesList();
        }
        return MaterialPageRoute(
          builder: (_) => page,
        );
      },
    );
  }
}
