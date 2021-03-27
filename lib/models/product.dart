import 'package:cloud_firestore/cloud_firestore.dart';

class Product{

  Product.fromdocument(DocumentSnapshot document){
    id = document.documentID;
    name = document['name'];
    description = document['description'];
    price  = document['price'];
    quantity = document['quantity'];

  }

  String id;
  String name;
  String description;
  String price;
  int quantity;


}