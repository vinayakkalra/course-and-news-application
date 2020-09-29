
import 'package:flutter/material.dart';
import 'contactUsScreen.dart';
import 'privacyPolicyScreen.dart';
import 'termsOfUseScreen.dart';
void main() => runApp(SettingScreenWidget());

class SettingScreenWidget extends StatelessWidget {
  SettingScreenWidget({Key key}) : super(key: key);

  Widget _buildDivider(){
    return Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade300,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final _screenSize = MediaQuery.of(context).size;
    return Container(
      child:
        Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
          // margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 300.0),
          // color: Colors.purple,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.translate,
                  color: Colors.orange,
                  ),
                title: Text("Change Language"),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){},
                ),
              _buildDivider(),
              ListTile(
                leading: Icon(Icons.error_outline,
                  color: Colors.orange,
                  ),
                title: Text("Terms of Use"),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context)=> TermsOfUseScreen()),);
                },
                ),
              _buildDivider(),
              ListTile(
                leading: Icon(Icons.info,
                  color: Colors.orange,
                  ),
                title: Text("Privacy Policy"),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  PrivacyPolicyScreen()),);
                },
                ),
              _buildDivider(),
              ListTile(
                leading: Icon(Icons.mail_outline,
                  color: Colors.orange,
                  ),
                title: Text("Contact Us"),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  ContactUsScreen()),);
                },
                ),
              _buildDivider(),
              ListTile(
                leading: Icon(Icons.star_border,
                  color: Colors.orange,
                  ),
                title: Text("Rate Us"),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){},
                ),
              _buildDivider(),
            ],
          )      
        )
    );
  }
}
