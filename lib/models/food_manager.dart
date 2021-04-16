import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:supermercado_ac/models/product.dart';

class FoodManager extends ChangeNotifier {
  FoodManager() {
    allFoodList();
  }

  final Firestore firestore = Firestore.instance;

  List<Product> foodList = [];

  String _search = '';

  String get search => _search;

  set search(String value) {
    _search = value;
    notifyListeners();
  }

  List<Product> get filteredFoodProducts {
    final List<Product> filteredFoodProducts = [];

    if (search.isEmpty) {
      filteredFoodProducts.addAll(foodList);
    } else {
      filteredFoodProducts.addAll(foodList
          .where((f) => f.name.toLowerCase().contains(search.toLowerCase())));
    }

    return filteredFoodProducts;
  }

  Future<void> allFoodList() async {
    final QuerySnapshot foodQuery =
        await firestore.collection('Alimentos normais').getDocuments();

    foodList = foodQuery.documents.map((e) => Product.fromDocument(e)).toList();

    notifyListeners();
  }
}
