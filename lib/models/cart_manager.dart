import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:supermercado_ac/models/cartproduct.dart';
import 'package:supermercado_ac/models/product.dart';
import 'package:supermercado_ac/models/user.dart';
import 'package:supermercado_ac/models/user_manager.dart';

class CartManager extends ChangeNotifier{
  List<CartProduct> itemsCart = [];

  User user;

  num productsPrice = 0.0;

  void updateUser(UserManager userManager) {
    user = userManager.user;
    itemsCart.clear();

    if (user != null) {
      _loadCartItems();
    }
  }

  Future<void> _loadCartItems() async {
    final QuerySnapshot cartSnap = await user.cartReference.getDocuments();

    itemsCart = cartSnap.documents
        .map((d) => CartProduct.fromDocument(d)..addListener(_onItemUpdated))
        .toList();
  }

  void addToCart(Product product) {
    try {
      final e = itemsCart.firstWhere((p) => p.stackable(product));
      e.increment();
    } catch (e) {
      final cartProduct = CartProduct.fromProduct(product);
      cartProduct.addListener(_onItemUpdated);
      itemsCart.add(cartProduct);
      user.cartReference.add(cartProduct.toCartItemMap())
          .then((doc) => cartProduct.id == doc.documentID);
      _onItemUpdated();    
    }

    notifyListeners();
  }

  void removeOfCart(CartProduct cartProduct){
    itemsCart.removeWhere((p) => p.id == cartProduct.id);
    user.cartReference.document(cartProduct.id).delete();
    cartProduct.removeListener(_onItemUpdated);

    notifyListeners();
  }

  void _onItemUpdated() {
    productsPrice = 0.0;
    //Function to call the function to increment item on firebase
    for (int i = 0; i < itemsCart.length; i++) {
      final cartProduct = itemsCart[i];  

      if(cartProduct.quantity == 0){
        removeOfCart(cartProduct);
        i--;
        continue;
      }

      productsPrice += cartProduct.totalPrice;

      _updateCartProduct(cartProduct);
    }

    notifyListeners();
  }

  void _updateCartProduct(CartProduct cartProduct) {//Function to increment item on firebase
    if(cartProduct.id != null)
    user.cartReference
        .document(cartProduct.id)
        .updateData(cartProduct.toCartItemMap());
  }
}
