import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supermercado_ac/models/cartproduct.dart';
import 'package:supermercado_ac/models/product.dart';
import 'package:supermercado_ac/models/user.dart';
import 'package:supermercado_ac/models/user_manager.dart';

class CartManager {
  List<CartProduct> itemsCart = [];

  User user;

  void updateUser(UserManager userManager) {
    user = userManager.user;
    itemsCart.clear();

    if (user != null) {
      _loadCartItems();
    }
  }

  Future<void> _loadCartItems() async {
    final QuerySnapshot cartSnap = await user.cartReference.getDocuments();

    itemsCart =
        cartSnap.documents.map((d) => CartProduct.fromDocument(d)).toList();
  }

  void addToCart(Product product) {
    try {
      final e = itemsCart.firstWhere((p) => p.stackable(product));
      e.quantity++;
    } catch (e) {
      final cartProduct = CartProduct.fromProduct(product);
      itemsCart.add(cartProduct);
      user.cartReference.add(cartProduct.toCartItemMap());
    }
  }
}
