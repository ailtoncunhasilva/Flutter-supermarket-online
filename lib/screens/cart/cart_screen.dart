import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supermercado_ac/common/price_card.dart';
import 'package:supermercado_ac/models/cart_manager.dart';
import 'package:supermercado_ac/screens/cart/components/cart_tile.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        centerTitle: true,
      ),
      body: Consumer<CartManager>(
        builder: (_, cartManager, __) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      children: cartManager.itemsCart
                          .map((cartProduct) => CartTile(cartProduct))
                          .toList(),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                color: Theme.of(context).primaryColor,
                child: PriceCard(
                  buttonText: 'Continuar para endereço',
                  onPressed: (){},
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
