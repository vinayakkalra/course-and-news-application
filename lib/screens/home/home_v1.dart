import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(HomeScreenWidget());

class HomeScreenWidget extends StatelessWidget {
  HomeScreenWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              return Container(
                  padding: EdgeInsets.all(20.0),
                  height: index.isEven ? 200 : 240,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.blueAccent,
                      image: DecorationImage(
                          image: AssetImage('assets/logo/finstreet_logo.png'),
                          fit: BoxFit.fill)),
                  child: Column(children: [
                    Text("Event ${index + 1}"),
                    Text("No of Sections ${(index + 1) * 5}"),
                  ]));
            },
            childCount: 4,
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
                    ]
                    )
                    ),
              );
            },
            childCount: 4,
          ),
        ),
      ],
    );
  }
}
