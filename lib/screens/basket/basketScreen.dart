import 'package:course_and_news/store/my_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Basket"),
          actions: [
            Stack(
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
                )
          ],
        ),
        body: ListView.builder(
            itemCount: store.baskets.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                  children: [
                    FadeInImage.assetNetwork(
                      height: 150,
                      width: 150,
                      fit: BoxFit.contain,
                      placeholder: 'assets\logo\finstreet_logo.png',
                      image: store.baskets[index].image,
                    ),
                    Text(store.baskets[index].name),
                    Text(store.baskets[index].price.toString()),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey)),
                      child: RaisedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("Remove"), Icon(Icons.shopping_cart)],
                        ),
                        onPressed: () {
                          store.removeProduct(store.baskets[index]);
                        },
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
