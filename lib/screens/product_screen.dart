import 'package:flutter/material.dart';
import 'package:supermercado_ac/models/store.dart';

class ProductScreen extends StatelessWidget {
  final Store store;

  ProductScreen(this.store);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(store.name),
        centerTitle: true,
      ),
    );
  }
}
