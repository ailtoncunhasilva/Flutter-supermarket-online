import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:supermercado_ac/models/store.dart';

class StoreManager extends ChangeNotifier{
  StoreManager() {
    _loadAllStore();
  }

  final Firestore firestore = Firestore.instance;

  List<Store> allStores = [];

  Future<void> _loadAllStore() async {
    final QuerySnapshot snapStore =
        await firestore.collection('stores').getDocuments();

    allStores = snapStore.documents.map((d) => Store.fromDocument(d)).toList();

    notifyListeners();
  }
}
