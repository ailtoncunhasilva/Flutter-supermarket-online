import 'package:flutter/material.dart';
import 'package:supermercado_ac/models/cart_manager.dart';
import 'package:supermercado_ac/models/product.dart';
import 'package:supermercado_ac/models/user_manager.dart';
import 'package:supermercado_ac/screens/photo_product_screen.dart';
import 'package:supermercado_ac/widgets/card_customized.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FoodTile extends StatelessWidget {
  final Product product;

  FoodTile(this.product);

  final RoundedRectangleBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(6),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PhotoProduct(product)),
        );
      },
      child: Row(
        children: [
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width * 0.8,
            child: CardCustomized(product.image.toString(), product.name,
                product.description, product.price),
          ),
          Expanded(
            child: Container(
              height: 80,
              child: Card(
                elevation: 6,
                //color: Colors.purple[600],
               margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                shape: shape,
                child: Container(
                  decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.purple[200], Colors.purple[800]],
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                  child: FlatButton(
                    splashColor: Colors.white,
                    onPressed: () {
                      if (context.read<UserManager>().isLoggedIn) {

                        context.read<CartManager>().addToCart(product);//Add product to cart

                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 2),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.shopping_cart),
                                Expanded(
                                  child: Text(
                                    'Produto adicionado ao carrinho com sucesso',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.redAccent,
                            duration: Duration(seconds: 2),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.error_outline),
                                Text(
                                  'Faça login para incluir produtos no carrinho',
                                  //textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                    child: Icon(
                      Icons.add_shopping_cart,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
