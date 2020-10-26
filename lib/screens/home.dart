import 'package:course_and_news/store/my_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:course_and_news/screens/ProductDetailScreen.dart';
void main() => runApp(HomeScreenWidget());

class HomeScreenWidget extends StatelessWidget {
  HomeScreenWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);

    // final _screenSize = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.portrait),
                        title: Text('Hi Nishant'),
                        subtitle: Text(
                            'Learn About Cryptocurrency and Stock Markets'),
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset('assets/logo/finstreet_logo.png',
                          height: 115, width: 400, fit: BoxFit.cover),
                      Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Text(
                                "Click here to use the coupon",
                                style: TextStyle(color: Colors.red),
                              ),
                              Icon(Icons.navigate_next)
                            ],
                          ))
                    ],
                  ),
                ),
              );
            },
            childCount: 1,
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  // set activeProduct to the tapped one in store file
                  store.setAtiveProduct(store.products[index]);
                  // go to th detail screen
                  Navigator.push(
                    context,
                    // MaterialPageRoute(builder: (context) => ProductDetailScreen()),
                    MaterialPageRoute(builder: (context) { 
                      // print("Context while tap ${context}");
                      return ProductDetailScreen();
                      }),
                    );
                },
                child: Container(
                    padding: EdgeInsets.all(20.0),
                    height: index.isEven ? 200 : 240,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.blueAccent,
                        image: DecorationImage(
                            // image: AssetImage('assets/logo/finstreet_logo.png'),
                            image:
                                NetworkImage("${store.products[index].image}"),
                            fit: BoxFit.fill)),
                    child: Column(children: [
                      Text("${store.products[index].name}"),
                      Text("${store.products[index].price}"),
                      Text("${store.products[index].id}"),
                    ])),
              );
            },
            childCount: store.products.length,
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
        ),
        SliverPadding(padding: EdgeInsets.symmetric(vertical: 10.0)),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    padding: EdgeInsets.all(20.0),
                    // height: index.isEven ? 200 : 240,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.blueAccent,
                        image: DecorationImage(
                            image: AssetImage('assets/logo/finstreet_logo.png'),
                            fit: BoxFit.fill)),
                    child: Column(children: [
                      Text("Event ${index + 1}"),
                      Text("No of Sections ${(index + 1) * 5}"),
                    ])),
              );
            },
            childCount: 4,
          ),
        ),
      ],
    );
  }
}
