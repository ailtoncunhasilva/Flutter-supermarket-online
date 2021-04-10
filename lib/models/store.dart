import 'package:cloud_firestore/cloud_firestore.dart';

class Store{

  Store.fromDocument(DocumentSnapshot storeDocument){
    id = storeDocument.documentID;
    doc = storeDocument.documentID;
    subtitle = storeDocument['subtitle'] as String;
    name = storeDocument['name'] as String;
    image = storeDocument['image'] as String;
    image1 = storeDocument['image1'] as String;
    information1 = storeDocument['information1'] as String;
    information2 = storeDocument['information2'] as String;
  }

  String id;
  String doc;
  String subtitle;
  String name;
  String image;
  String image1;
  String information1;
  String information2;

}