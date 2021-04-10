import 'package:cloud_firestore/cloud_firestore.dart';

class Product{

  Product.fromDocument(DocumentSnapshot document){
    id = document.documentID;
    name = document['name'] as String;
    description = document['description'] as String;
    image = document['image'];
    price  = document['price'] + 0.0;
    quantity = document['quantity'];

  }

  String id;
  String storeID;
  String name;
  String description;
  String image;
  double price;
  int quantity;

}