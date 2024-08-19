import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dentist_shop/data/products_data.dart';
import 'package:dentist_shop/models/product_model.dart';

class SearchNotifier extends ChangeNotifier {
  final List<ProductModel> _allProducts = products;
  List<ProductModel> _filteredProducts = [];
  String _searchTerm = '';
  List<String> _searchHistory = [];

  List<ProductModel> get filteredProducts => _filteredProducts;

  int get totalProducts => _filteredProducts.length;

  bool get isClean => _searchTerm.isEmpty;

  List<String> get searchHistory => _searchHistory;

  SearchNotifier() {
    _loadHistory();
  }

  void search(String searchTerm) {
    _searchTerm = searchTerm.toLowerCase();
    _filterProducts();
    _addToHistory(_searchTerm);
  }

  // HISTORICO
  void _addToHistory(String searchTerm) {
    if (searchTerm.length < 5) return;

    if (!_searchHistory.contains(searchTerm)) {
      _searchHistory.insert(0, searchTerm);
    }

    if (_searchHistory.length > 10) {
      _searchHistory.removeLast();
    }

    _saveHistory();
    notifyListeners();
  }

  Future<void> _saveHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('search_history', _searchHistory);
  }

  Future<void> _loadHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _searchHistory = prefs.getStringList('search_history') ?? [];
    notifyListeners();
  }

  void _filterProducts() {
    if (isClean) {
      _filteredProducts = [];
    } else {
      _filteredProducts = _allProducts.where((product) {
        final searchLower = _searchTerm.toLowerCase();
        final titleMatch = product.title.toLowerCase().contains(searchLower);
        final moneyMatch = product.money.toLowerCase().contains(searchLower);
        final categoryMatch =
            product.category.title.toLowerCase().contains(searchLower);

        return titleMatch || moneyMatch || categoryMatch;
      }).toList();
    }

    notifyListeners();
  }
}
