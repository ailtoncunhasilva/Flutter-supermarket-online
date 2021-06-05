import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supermercado_ac/common/custom_icon_button.dart';
import 'package:supermercado_ac/models/cartproduct.dart';

class CartTile extends StatelessWidget {
  CartTile(this.cartProduct);

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: cartProduct,
      child: Card(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartProduct.product.name,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          cartProduct.product.description,
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                      ),
                      Text(
                        'R\$ ${cartProduct.product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          //fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Anton',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 1.5,
                  ),
                ),
                child: Consumer<CartProduct>(
                  builder: (_, cartProduct, __) {
                    return //Card(
                        Column(
                      children: [
                        SizedBox(
                          width: 40,
                          child: CustomIconButton(
                            iconData: Icons.add,
                            color: Colors.white,
                            onTap: cartProduct.increment,
                          ),
                        ),
                        Text(
                          '${cartProduct.quantity}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: CustomIconButton(
                            iconData: cartProduct.quantity < 2 ? Icons.delete : Icons.remove,
                            color: cartProduct.quantity > 1
                                ? Colors.white
                                : Colors.red[600],
                            onTap: cartProduct.quantity >= 0
                                ? cartProduct.decrement
                                : null,
                          ),
                        ),
                      ],
                    );
                    //);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
