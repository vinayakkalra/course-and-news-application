// home.dart v1 file

import 'package:flutter/material.dart';

void main() => runApp(HomeScreenWidget());

/// This Widget is the main application widget.
// class HomeScreen extends StatelessWidget {
//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: HomeScreenWidget(),
//       ),
//     );
//   }
// }

/// This is the stateless widget that the main application instantiates.
class HomeScreenWidget extends StatelessWidget {
  HomeScreenWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
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
        const Divider(
              color: Colors.black,
              height: 20,
              thickness: 1,
              indent: 20,
              endIndent: 0,
            ),
        Card(
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
        ]
    )
    );
  }
}
