import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {


  // Widget _buildDivider(){
  //   return Container(
  //     width: double.infinity,
  //     height: 1.0,
  //     color: Colors.grey.shade300,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My courses"),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
          ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child:Text("Your courses will be here",
              style: TextStyle(
                color: Colors.orangeAccent,
                fontSize: 20.0
              ),
            )
          ),          
        ],
        ),
    );
  }
}