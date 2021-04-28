import 'package:flutter/material.dart';
import 'package:supermercado_ac/models/cartproduct.dart';

class CartTile extends StatelessWidget {

  CartTile(this.cartProduct);

  final CartProduct cartProduct;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              child: Image.network(cartProduct.product.image),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(cartProduct.product.name),
                    Text(cartProduct.product.description),
                    Text('R\$ ${cartProduct.product.price.toStringAsFixed(2)}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}