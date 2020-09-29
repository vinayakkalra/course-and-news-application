
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(EventsScreenWidget());

class EventsScreenWidget extends StatelessWidget {
  EventsScreenWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color:Color(0xFFF5F5F7),
              borderRadius : BorderRadius.circular(40.00),
            ),
            child: Row(
              children: [
                Icon(Icons.search),
                SizedBox(width: 16.0),
                Text(
                  "Search for any event",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFA0A5BD)
                    ),
                  )
                ],
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Events",
              style: TextStyle(
                color: Colors.black
                ),
              ),
              Text("See All",
              style: TextStyle(
                color:Colors.black54
              ),)
            ],
          ),
          SizedBox(height:30),
          Expanded(
            child:StaggeredGridView.countBuilder(
              padding: EdgeInsets.all(0.0),
              crossAxisCount: 2,
              itemCount: 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              itemBuilder: (context, index){
                return Container(
                  padding: EdgeInsets.all(20.0),
                  height: index.isEven ? 200:240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.blueAccent,
                    image: DecorationImage(
                      image: AssetImage('assets/logo/finstreet_logo.png'),
                      fit: BoxFit.fill
                    )
                    
                  ),
                  child: Column(
                    children: [
                      Text("Event ${index+1}"),
                      Text("No of Sections ${(index+1)*5}"),
                    ]
                  )
                );
              },
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            ) 
          )
        ],
      );
    // );
  }
}
