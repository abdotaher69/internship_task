import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartService {
  static const String _cartKey = 'cart_items';

  static Future<List<CartItem>> loadCart() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartJson = prefs.getString(_cartKey);
      
      if (cartJson == null) {
        return [];
      }

      final List<dynamic> cartList = json.decode(cartJson);
      return cartList.map((item) => CartItem.fromJson(item)).toList();
    } catch (e) {
      print('Error loading cart: $e');
      return [];
    }
  }

  static Future<void> saveCart(List<CartItem> cartItems) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartJson = json.encode(cartItems.map((item) => item.toJson()).toList());
      await prefs.setString(_cartKey, cartJson);
    } catch (e) {
      print('Error saving cart: $e');
    }
  }

  static Future<void> clearCart() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_cartKey);
    } catch (e) {
      print('Error clearing cart: $e');
    }
  }

  static CartItem? findCartItem(List<CartItem> cartItems, Product product) {
    try {
      return cartItems.firstWhere((item) => item.product.id == product.id);
    } catch (e) {
      return null;
    }
  }

  static double calculateTotal(List<CartItem> cartItems) {
    return cartItems.fold(0.0, (total, item) => total + item.totalPrice);
  }

  static int getTotalItemCount(List<CartItem> cartItems) {
    return cartItems.fold(0, (total, item) => total + item.quantity);
  }
}

