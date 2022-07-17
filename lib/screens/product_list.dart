import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/screens/product_add.dart';
import '../models/product.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProductListState();
  }
}

class _ProductListState extends State {
  var dbHelper = DbHelper();
  List<Product>? products;
  int productCount = 0;

  @override
  void initState() {
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Listesi"),
      ),
      body: buildProductList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          gotoProductAdd();
        },
        child: Icon(Icons.add),
        tooltip: "Yeni ürün ekle",
      ),
    );
  }

  ListView buildProductList() {
    return ListView.builder(
        itemCount: productCount,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.cyan,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black12,
                child: Text("P"),
              ),

             title: Text(products![index].name ?? ""),
              subtitle: Text(products![index].description ?? ""),
              onTap: () {},
            ),
          );
        });
  }

  void gotoProductAdd() async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ProductAdd()));
  //  if (result != null) {
 //     if (result) {
        getProducts();
  //    }
  //  }
  }

  void getProducts() {
    var productsFuture = dbHelper.getProducts();
    productsFuture.then((value) {
      productCount=value.length;
      var s = value;
      products = [];
      for (var element in s) {
        Map<String, dynamic> ma = jsonDecode(element);
        products?.add(Product.fromObject(ma));
      }
    });
  }
}
