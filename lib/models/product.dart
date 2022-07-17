// ignore_for_file: prefer_collection_literals

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';

class Product {
  int? id;
  String? name;
  String? description;
  int? unitPrice;

  Product(
      this.name,
      this.description,
      this.unitPrice
      );

  Product.withId(this.id, this.name, this.description, this.unitPrice);

  Map<String, dynamic> toMap()  {
    final Map<String,dynamic>data =Map<String,dynamic>();
    if (id != null) data['id']=id;
    data['name']=name;
    data['description']=description;
    data['unitPrice']=unitPrice;
    return data;
/*    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'unitPrice': unitPrice,
    };*/
  }

 // String toJson() => json.encode(toMap());

  Product.fromObject(Map<String, dynamic> data)  {
    id =data['id'];
    name = data['name'];
    description = data['description'];
    unitPrice =data['unitPrice'];
  }
}

