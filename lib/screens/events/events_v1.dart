import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(EventsScreenWidget());

class EventsScreenWidget extends StatelessWidget {
  EventsScreenWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 30.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(40.00),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.search),
                    // SizedBox(width: 16.0),
                    Text(
                      "Search for any event",
                      style: TextStyle(fontSize: 18, color: Color(0xFFA0A5BD)),
                    )
                  ],
                ),
              );
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Events",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(color: Colors.blueAccent),
                  )
                ],
              );
            },
            childCount: 1,
          ),
        ),
        SliverPadding(padding: EdgeInsets.symmetric(vertical: 10.0)),
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
      ],
    ); // );
  }
}
