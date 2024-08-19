import 'package:dentist_shop/constants/colors.dart';
import 'package:dentist_shop/constants/text_styles.dart';
import 'package:dentist_shop/controllers/search_notifier.dart';
import 'package:dentist_shop/widgets/products_list.dart';
import 'package:flutter/material.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchNotifier searchNotifier = SearchNotifier();
    final searchEditingController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.primaryColor,
        title: TextField(
          autofocus: true,
          controller: searchEditingController,
          onChanged: (value) {
            searchNotifier.search(value);
          },
          decoration: InputDecoration(
            hintStyle: AppTextStyles.subinfo,
            isDense: true,
            hintText: "Buscar",
            fillColor: Colors.white,
            filled: true,
            suffixIcon: ListenableBuilder(
              listenable: searchNotifier,
              builder: (BuildContext context, Widget? child) {
                if (searchNotifier.isClean) {
                  return const Icon(
                    Icons.search_outlined,
                    color: AppColors.primaryColor,
                  );
                } else {
                  return IconButton(
                    icon: const Icon(
                      Icons.clear,
                      color: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      searchEditingController.clear();
                      searchNotifier.search('');
                    },
                  );
                }
              },
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: ListenableBuilder(
                  listenable: searchNotifier,
                  builder: (context, child) {
                    String text = "";

                    if (searchNotifier.totalProducts == 1) {
                      text = "1 produto encontrado";
                    } else {
                      text =
                          "${searchNotifier.totalProducts} produtos encontrados";
                    }

                    if (searchNotifier.isClean) {
                      text = "Pesquisas recentes";
                    } else if (searchNotifier.filteredProducts.isEmpty) {
                      text = "";
                    }

                    return Text(
                      text,
                      style: AppTextStyles.title,
                    );
                  }),
            ),
            ListenableBuilder(
              listenable: searchNotifier,
              builder: (context, child) {
                if (searchNotifier.isClean) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: searchNotifier.searchHistory.length,
                    itemBuilder: (context, index) {
                      final searchTerm = searchNotifier.searchHistory[index];

                      return ListTile(
                        title: Text(searchTerm),
                        leading: const Icon(Icons.history),
                        onTap: () {
                          searchEditingController.text = searchTerm;
                          searchNotifier.search(searchTerm);
                        },
                      );
                    },
                  );
                } else {
                  return ProductsList(
                    nerverScroll: true,
                    products: searchNotifier.filteredProducts,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
