import 'package:flutter/material.dart';
import 'package:supermercado_ac/models/product.dart';

class ProductListTile extends StatelessWidget {
  final Product product;

  ProductListTile(this.product);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        height: 100,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                height: 70,
                color: Colors.purple,
              ),
              /*CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 80,
                backgroundImage: NetworkImage(store.image),
              ),*/
            ),
            Container(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    product.price.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
