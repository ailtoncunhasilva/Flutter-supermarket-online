import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supermercado_ac/compoments/product_list_tile.dart';
import 'package:supermercado_ac/models/product_manager.dart';
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
      body: Consumer<ProductManager>(builder: (_, productManager, __) {
        return ListView.builder(
          padding: const EdgeInsets.all(4),
          itemCount: productManager.allProducts.length,
          itemBuilder: (_, index){
            return ProductListTile(productManager.allProducts[index]);
          },
        );
      }),
    );
  }
}
