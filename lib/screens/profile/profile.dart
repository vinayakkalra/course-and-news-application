
import 'package:flutter/material.dart';
import 'courseScreen.dart';
import 'liveQAScreen.dart';
import 'downloads.dart';
import 'supportScreen.dart';

void main() => runApp(ProfileScreenWidget());

class ProfileScreenWidget extends StatelessWidget {
  ProfileScreenWidget({Key key}) : super(key: key);

  //  _navigateToScreen(context, screenObject){
  //    Navigator.push(
  //      context,
  //      MaterialPageRoute(
  //        builder: 
  //         (context)=>screenObject
  //       ),
  //     );
    // }

  @override
  Widget build(BuildContext context) {
    // final _screenSize = MediaQuery.of(context).size;
    return Container(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey[850]
              ),
              accountName: Text("Nishant Miglani"),
              accountEmail: Text("username@domain.com"),
              currentAccountPicture: 
                Icon(
                  Icons.account_circle,
                  size: 50.0,
                  // color: Colors.yellow[300],
                  ),
            ),
            Container(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                    margin: EdgeInsets.all(10.0),
                    child:ListTile(
                    leading: Icon(Icons.featured_video,
                      color: Colors.orange,
                      ),
                    title: Text("Courses"),
                    subtitle: Text("Find all your subscribed courses"),
                    onTap: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context)=> CoursesScreen()),);
                    },
                    // onTap: _navigateToScreen(context, CoursesScreen())
                    ),
                  ),
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                    margin: EdgeInsets.all(10.0),
                    child: ListTile(
                    leading: Icon(Icons.question_answer,
                      color: Colors.orange,
                      ),
                    title: Text("Live Q&A"),
                    subtitle: Text("Find all your Live Q&A sessions"),
                    onTap: (){
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context)=> LiveQAScreen()),);
                    },
                    // onTap: _navigateToScreen(context, LiveQAScreen())
                    ),
                  ),
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                    margin: EdgeInsets.all(10.0),
                    child: 
                    ListTile(
                      leading: Icon(Icons.cloud_download,
                        color: Colors.orange,
                        ),
                      title: Text("Downloads"),
                      subtitle: Text("Find all your downloaded files"),
                      onTap: (){
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context)=> DownloadScreen()),);
                    },
                      // onTap: _navigateToScreen(context, DownloadScreen())
                      ),
                  ),
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                    margin: EdgeInsets.all(10.0),
                    child: 
                    ListTile(
                      leading: Icon(Icons.thumb_up,
                        color: Colors.orange,
                        ),
                      title: Text("Support"),
                      subtitle: Text("Connect with us for any help"),
                      onTap: (){
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context)=> SupportScreen()),);
                    },
                      // onTap: _navigateToScreen(context, SupportScreen())
                    ),
                  ),
                ],
              ),
            ),
      ],)
    );
  }
}
