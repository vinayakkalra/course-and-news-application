
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'screens/home/home.dart';
import 'screens/home/home_v1.dart';
import 'screens/events/events_v1.dart';
import 'screens/profile/profile.dart';
import 'screens/live_QA/liveQA.dart';
import 'screens/settings/settings.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'FinStreet';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreenWidget(),
    EventsScreenWidget(),
    ProfileScreenWidget(),
    LiveQAScreenWidget(),
    SettingScreenWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => {}//Navigator.pushNamed(context, '/checkout'),
          )
        ],      
        title: Row(
          children: [
            Image.asset(
              'assets/logo/finstreet_logo.png',
              height: 115,
              fit: BoxFit.cover
              ),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(200, 0, 0, 0),
              //   child: Icon(
              //     Icons.shopping_cart,
              //     color: Colors.black,
              //     size: 25,
              //     ),
              // )
            
        ],)
        
          // child:Text('FinST\u20B9EET'),
        // ),        
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      // Container(
        // child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      bottomNavigationBar:
      new Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.grey[850],
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.red,
            textTheme: Theme
                .of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.white))), // sets the inactive color of the `BottomNavigationBar`
        child: 
          new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event),
                title: Text('Events'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event_available),
                title: Text('Live Q&A'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.orange,
            // selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
        ),
  ),
    );
  }
}
