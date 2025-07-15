import '../models/product.dart';

class ProductService {
  static List<Product> getAllProducts() {
    return [
      // Fruits
      Product(
        id: '1',
        name: 'Fresh Bananas',
        price: 2.99,
        image: 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=300',
        category: 'Fruits',
      ),
      Product(
        id: '2',
        name: 'Red Apples',
        price: 3.49,
        image: 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=300',
        category: 'Fruits',
      ),
      Product(
        id: '3',
        name: 'Fresh Oranges',
        price: 4.99,
        image: 'https://images.unsplash.com/photo-1547514701-42782101795e?w=300',
        category: 'Fruits',
      ),
      Product(
        id: '4',
        name: 'Strawberries',
        price: 5.99,
        image: 'https://images.unsplash.com/photo-1464965911861-746a04b4bca6?w=300',
        category: 'Fruits',
      ),
      Product(
        id: '5',
        name: 'Grapes',
        price: 6.49,
        image: 'https://images.unsplash.com/photo-1537640538966-79f369143f8f?w=300',
        category: 'Fruits',
      ),

      // Vegetables
      Product(
        id: '6',
        name: 'Fresh Carrots',
        price: 1.99,
        image: 'https://images.unsplash.com/photo-1445282768818-728615cc910a?w=300',
        category: 'Vegetables',
      ),
      Product(
        id: '7',
        name: 'Broccoli',
        price: 2.49,
        image: 'https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?w=300',
        category: 'Vegetables',
      ),
      Product(
        id: '8',
        name: 'Bell Peppers',
        price: 3.99,
        image: 'https://images.unsplash.com/photo-1563565375-f3fdfdbefa83?w=300',
        category: 'Vegetables',
      ),
      Product(
        id: '9',
        name: 'Spinach',
        price: 2.99,
        image: 'https://images.unsplash.com/photo-1576045057995-568f588f82fb?w=300',
        category: 'Vegetables',
      ),

      // Dairy
      Product(
        id: '10',
        name: 'Fresh Milk',
        price: 3.99,
        image: 'https://images.unsplash.com/photo-1550583724-b2692b85b150?w=300',
        category: 'Dairy',
      ),
      Product(
        id: '11',
        name: 'Cheese',
        price: 5.49,
        image: 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=300',
        category: 'Dairy',
      ),
      Product(
        id: '12',
        name: 'Greek Yogurt',
        price: 4.99,
        image: 'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=300',
        category: 'Dairy',
      ),

      // Bakery
      Product(
        id: '13',
        name: 'Fresh Bread',
        price: 2.49,
        image: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=300',
        category: 'Bakery',
      ),
      Product(
        id: '14',
        name: 'Croissants',
        price: 3.99,
        image: 'https://images.unsplash.com/photo-1555507036-ab794f4afe5e?w=300',
        category: 'Bakery',
      ),
      Product(
        id: '15',
        name: 'Bagels',
        price: 4.49,
        image: 'https://images.unsplash.com/photo-1551024506-0bccd828d307?w=300',
        category: 'Bakery',
      ),
    ];
  }

  static List<Product> getProductsByCategory(String category) {
    return getAllProducts().where((product) => product.category == category).toList();
  }

  static List<String> getCategories() {
    return ['Fruits', 'Vegetables', 'Dairy', 'Bakery'];
  }

  static List<Product> getFeaturedProducts() {
    return getAllProducts().take(6).toList();
  }

  static List<Product> searchProducts(String query) {
    return getAllProducts()
        .where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

