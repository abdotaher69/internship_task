import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import '../models/product.dart';
import '../services/cart_service.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  int get itemCount => CartService.getTotalItemCount(_cartItems);

  double get totalAmount => CartService.calculateTotal(_cartItems);

  bool get isEmpty => _cartItems.isEmpty;

  Future<void> loadCart() async {
    _cartItems = await CartService.loadCart();
    notifyListeners();
  }

  Future<void> addToCart(Product product) async {
    final existingItem = CartService.findCartItem(_cartItems, product);
    
    if (existingItem != null) {
      existingItem.quantity++;
    } else {
      _cartItems.add(CartItem(product: product));
    }
    
    await CartService.saveCart(_cartItems);
    notifyListeners();
  }

  Future<void> removeFromCart(Product product) async {
    _cartItems.removeWhere((item) => item.product.id == product.id);
    await CartService.saveCart(_cartItems);
    notifyListeners();
  }

  Future<void> updateQuantity(Product product, int quantity) async {
    if (quantity <= 0) {
      await removeFromCart(product);
      return;
    }

    final existingItem = CartService.findCartItem(_cartItems, product);
    if (existingItem != null) {
      existingItem.quantity = quantity;
      await CartService.saveCart(_cartItems);
      notifyListeners();
    }
  }

  Future<void> clearCart() async {
    _cartItems.clear();
    await CartService.clearCart();
    notifyListeners();
  }

  bool isInCart(Product product) {
    return CartService.findCartItem(_cartItems, product) != null;
  }

  int getQuantity(Product product) {
    final item = CartService.findCartItem(_cartItems, product);
    return item?.quantity ?? 0;
  }
}

