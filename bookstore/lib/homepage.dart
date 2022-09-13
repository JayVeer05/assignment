import 'dart:convert';

import 'package:bookstore/models/products.dart';
import 'package:bookstore/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bookstore/widget/item_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var product_json =
        await rootBundle.loadString("assets/files/products.json");
    var decord_json = jsonDecode(product_json);
    var productData = decord_json["products"];

    BookModel.items =
        List.from(productData).map((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WELCOME TO BOOKSTORE",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
          itemBuilder: (context, index) {
            final item = BookModel.items?[index];
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: GridTile(
                header: Container(
                  child: Text(
                    item!.name,
                    style: TextStyle(color: Colors.white),
                  ),
                  width: 100.0,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.blue),
                ),
                child: Image.network(item.image),
                footer: Text(item.price.toString()),
              ),
            );
          },
          itemCount: BookModel.items!.length,
        ),
      ),
      backgroundColor: Colors.purple.shade100,
      drawer: MyDrawer(),
    );
  }
}
