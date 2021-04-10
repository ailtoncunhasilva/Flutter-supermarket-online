import 'package:flutter/material.dart';
import 'package:supermercado_ac/models/product.dart';

class PhotoProduct extends StatelessWidget {
  final Product product;

  PhotoProduct(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //elevation: 6,
        title: Text(product.name),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(product.image),
          ),
        ),
      ),
    );
  }
}
