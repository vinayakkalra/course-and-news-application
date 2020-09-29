
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
void main() => runApp(HomeScreenWidget());

class HomeScreenWidget extends StatelessWidget {
  HomeScreenWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: _screenSize.height * 0.2,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.portrait),
                        title: Text('Hi Nishant'),
                        subtitle: Text('Learn About Cryptocurrency and Stock Markets'),
                        ),                
                      ],
                    ),
                  ),
                ),
              const Divider(
                color: Colors.black,
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 0,
              ),
              Container(
                height: _screenSize.height * 0.25,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                          'assets/logo/finstreet_logo.png',
                          height: 115,
                          width: 400,
                          fit: BoxFit.cover
                          ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Text(
                              "Click here to use the coupon",
                              style: TextStyle(
                                color: Colors.red
                                ),
                              ),
                            Icon(Icons.navigate_next)
                            ],
                          )                
                        )
                      ],
                    ),
                  ),
              ),
              const Divider(
                  color: Colors.black,
                  height: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 0,
                ),
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
              // Container(
              //   height: _screenSize.height * 0.25,
              //   child: GridView.count(
              //     // scrollDirection: Axis.horizontal,
              //     crossAxisCount: 2 ,
              //     children: List.generate(4,(index){
              //       return Container(
              //         child: Card(
              //           color: Colors.grey[350],
              //           shadowColor: Colors.redAccent,
              //           child: Column(
              //             mainAxisSize: MainAxisSize.min,
              //             children: <Widget>[
              //               Image.asset(
              //                   'assets/logo/finstreet_logo.png',
              //                   height: _screenSize.height * 0.1,
              //                   width: 125,
              //                   fit: BoxFit.cover
              //                   ),
              //               Padding(
              //                 padding: EdgeInsets.all(10.0),
              //                 child: Row(
              //                   children: [
              //                     Text(
              //                       "Click here",
              //                       style: TextStyle(
              //                         color: Colors.red
              //                       ),
              //                     ),
              //                   ],
              //                 )                
              //               )
              //             ],
              //           ),
              //       ),
              //       );
              //     }),
              //   ),
              // )
            ],
          ),
    );
  }
}
