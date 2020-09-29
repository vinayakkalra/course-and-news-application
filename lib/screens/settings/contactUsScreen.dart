import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {

  void _launchMap({String lat = "29.6856999", String long = "76.9904755"}) async{
    var mapSchema = 'geo:$lat,$long';
    if (await canLaunch(mapSchema)) {
      await launch(mapSchema);
    } else {
      throw 'Could not launch $mapSchema';
    }
  }

  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  Widget _buildDivider(){
    return Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade300,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
          ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Corporate Address"),
                  SizedBox(height: 20,),
                  Text("AAN Solutions Provider Pvt. Ltd."),
                  Text("Home Address, 1st Floor"),
                  Text("Nissing - 132024, INDIA"),
                  IconButton(
                    icon:Icon(Icons.map),
                    onPressed: ()=> _launchMap(lat: "29.6856999", long: "76.9904755"),
                  ),
                  SizedBox(height: 20,),
                ]
              ),
            ),
            _buildDivider(),
            SizedBox(height: 20,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "For Course Queries",
                    // textAlign: TextAlign.left,
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("+91-9988776655"),
                    onTap: ()=>_launchUrl("tel:+919988776655"),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("+91-9988776655"),
                    onTap: ()=>_launchUrl("tel:+919988776655"),
                  ),
                  ListTile(
                    leading: Icon(Icons.mail),
                    title: Text("info@aan.com"),
                    onTap: ()=>_launchUrl("mailto:info@aan.com?subject=Information&body=Could you please help me?"), 
                  ),
                ]
              ),
            ),
            _buildDivider(),
            SizedBox(height: 20,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("For Support Help"),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("+91-9988776655"),
                    onTap: ()=>_launchUrl("tel:+919988776655"),
                  ),
                  ListTile(
                    leading: Icon(Icons.mail),
                    title: Text("info@aan.com"),
                    onTap: ()=>_launchUrl("mailto:info@aan.com?subject=Information&body=Could you please help me?"),
                  ),
                ]
              ),
            ),
            _buildDivider(),            
          ],
        ),
    );
  }
}