import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supermercado_ac/models/product.dart';

class CartProduct{
  
  CartProduct.fromProduct(this.product){
    productId =  product.id;
    quantity = 1;
  }

  CartProduct.fromDocument(DocumentSnapshot document){
    productId = document.data['pid'] as String;
    quantity = document.data['quantity'] as int;

    firestore.document('Alimentos normais/$productId').get().then(
      (doc) => product = Product.fromDocument(doc)
      );

  }

  final Firestore firestore = Firestore.instance;

  String productId;
  int quantity;

  Product product;

  Map<String, dynamic> toCartItemMap(){
    return {
      'pid': productId,
      'quantity': quantity,
    };
  }

  bool stackable(Product product){
      return product.id == productId;
  }
}