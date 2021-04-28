import 'package:flutter/material.dart';
import 'package:supermercado_ac/screens/cart/cart_screen.dart';

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 6,
      backgroundColor: Colors.purple[300],
      onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CartScreen())
        );
      },
      child: Icon(Icons.shopping_cart),
    );
  }
}