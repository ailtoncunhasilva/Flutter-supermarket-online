import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:supermercado_ac/models/product.dart';

class ProductManager extends ChangeNotifier {
  ProductManager() {
    storeProducts();
  }

  final Firestore firestore = Firestore.instance;

  List<Product> products = [];

  Future<void> storeProducts() async {
    final QuerySnapshot productsnapshot = await firestore
        .collection('stores')
        .document()
        .collection('products')
        .getDocuments();

    products =
        productsnapshot.documents.map((e) => Product.fromdocument(e)).toList();

    notifyListeners();
  }
}
