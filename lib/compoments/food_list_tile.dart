import 'package:flutter/material.dart';
import 'package:supermercado_ac/models/product.dart';
import 'package:supermercado_ac/screens/photo_product_screen.dart';
import 'package:supermercado_ac/widgets/card_customized.dart';

class FoodTile extends StatelessWidget {
  final Product product;

  FoodTile(this.product);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PhotoProduct(product)),
        );
      },
      child: CardCustomized(product.image.toString(), product.name,
          product.description, product.price),
    );
  }
}
