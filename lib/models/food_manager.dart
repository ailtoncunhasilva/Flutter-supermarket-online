import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:supermercado_ac/models/product.dart';

class FoodManager extends ChangeNotifier {
  FoodManager() {
    allFoodList();
  }

  final Firestore firestore = Firestore.instance;

  List<Product> foodList = [];

  Future<void> allFoodList() async {
    final QuerySnapshot foodQuery =
        await firestore.collection('Alimentos normais').getDocuments();

    foodList = foodQuery.documents.map((e) => Product.fromDocument(e)).toList();

    notifyListeners();   
  }
}
