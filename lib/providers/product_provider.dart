import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Product> _filteredProducts = [];
  String _selectedCategory = 'All';
  String _searchQuery = '';
  bool _isLoading = false;

  List<Product> get products => _filteredProducts;
  List<Product> get allProducts => _products;
  String get selectedCategory => _selectedCategory;
  String get searchQuery => _searchQuery;
  bool get isLoading => _isLoading;

  List<String> get categories => ['All', ...ProductService.getCategories()];

  List<Product> get featuredProducts => ProductService.getFeaturedProducts();

  void loadProducts() {
    _isLoading = true;
    notifyListeners();

    _products = ProductService.getAllProducts();
    _applyFilters();

    _isLoading = false;
    notifyListeners();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    _applyFilters();
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    _applyFilters();
    notifyListeners();
  }

  void _applyFilters() {
    List<Product> filtered = _products;

    // Apply category filter
    if (_selectedCategory != 'All') {
      filtered = filtered.where((product) => product.category == _selectedCategory).toList();
    }

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      filtered = filtered
          .where((product) => product.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }

    _filteredProducts = filtered;
  }

  List<Product> getProductsByCategory(String category) {
    return ProductService.getProductsByCategory(category);
  }
}

