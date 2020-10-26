import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:course_and_news/store/my_store.dart';

import 'basket/basketScreen.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Product Detail Screen"),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BasketScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.shopping_cart),
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          alignment: Alignment.center,
                          child: Text(
                            store.baskets.length.toString(),
                          ),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
        body: CustomScrollView(slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      //image
                      FadeInImage.assetNetwork(
                        height: 300,
                        width: 400,
                        fit: BoxFit.cover,
                        placeholder: 'assets\logo\finstreet_logo.png',
                        image: store.activeProduct.image,
                      ),
                      // Name of the event or Course
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(store.activeProduct.name),
                      ),
                      // Price
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(store.activeProduct.price.toString()),
                      ),
                      SizedBox(height: 20),
                      RaisedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Add to Cart"),
                            Icon(Icons.shopping_cart)
                          ],
                        ),
                        onPressed: () {
                          store.addProduct(store.activeProduct);
                        },
                      ),
                      Container(child: Text("Product Detail will be there"))
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ]));
  }
}
