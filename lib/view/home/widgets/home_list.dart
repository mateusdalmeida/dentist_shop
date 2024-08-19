import 'package:dentist_shop/constants/colors.dart';
import 'package:dentist_shop/constants/text_styles.dart';
import 'package:dentist_shop/data/products_data.dart';
import 'package:dentist_shop/models/product_model.dart';
import 'package:dentist_shop/utils.dart';
import 'package:dentist_shop/widgets/products_list.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<ProductModel>> groupedItems =
        _groupItemsByDate(products);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: TextField(
          decoration: InputDecoration(
            hintStyle: AppTextStyles.subinfo,
            isDense: true,
            hintText: "Buscar",
            fillColor: Colors.white,
            filled: true,
            suffixIcon: const Icon(
              Icons.search_outlined,
              color: AppColors.primaryColor,
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8)),
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/search');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 0, top: 12, left: 12),
              child: Text(
                "Últimos anúncios",
                style: AppTextStyles.title,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: groupedItems.length,
              itemBuilder: (context, index) {
                final String date = groupedItems.keys.elementAt(index);
                final List<ProductModel> productsByDate = groupedItems[date]!;

                return _buildDateSection(date, productsByDate);
              },
            ),
          ],
        ),
      ),
    );
  }

  Map<String, List<ProductModel>> _groupItemsByDate(List<ProductModel> items) {
    items.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return groupBy(
        items, (item) => item.createdAt.toIso8601String().substring(0, 10));
  }

  Widget _buildDateSection(String date, List<ProductModel> productsByDate) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              Text(Utils.getRelativeDate(date), style: AppTextStyles.subinfo),
        ),
        const Divider(),
        ProductsList(
          products: productsByDate,
          nerverScroll: true,
        ),
        const Divider(),
      ],
    );
  }
}
