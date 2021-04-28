import 'package:supermercado_ac/models/cartproduct.dart';
import 'package:supermercado_ac/models/product.dart';

class CartManager{

  List<CartProduct> itemsCart = [];

  void addToCart(Product product){
    itemsCart.add(CartProduct.fromProduct(product));

  }

}