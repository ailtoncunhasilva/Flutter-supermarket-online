import 'package:cloud_firestore/cloud_firestore.dart';

class Store{

  Store.fromDocument(DocumentSnapshot storeDocument){
    id = storeDocument.documentID;
    subtitle = storeDocument['subtitle'] as String;
    name = storeDocument['name'] as String;
    image = storeDocument['image'] as String;
    image1 = storeDocument['image1'] as String;
  }

  String id;
  String subtitle;
  String name;
  String image;
  String image1;

}