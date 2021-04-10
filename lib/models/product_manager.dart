import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supermercado_ac/models/product.dart';
import 'package:supermercado_ac/models/store.dart';

class ProductManager extends ChangeNotifier {
  ProductManager() {
    storeProducts();
  }

  Store store;

  final Firestore firestore = Firestore.instance;

  List<Product> allProducts = [];

  Future<void> storeProducts() async {
    final QuerySnapshot snapProduct = await firestore
        .collection('stores')
        .document()
        .collection('products')
        .getDocuments();

    allProducts =
        snapProduct.documents.map((e) => Product.fromDocument(e)).toList();

    notifyListeners();
  }
}
