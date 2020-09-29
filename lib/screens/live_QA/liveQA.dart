
import 'dart:async';

import 'package:flutter/material.dart';


import 'package:course_and_news/utils/timeLeft.dart';
void main() => runApp(LiveQAScreenWidget());

class LiveQAScreenWidget extends StatefulWidget {
  @override
  _LiveQAScreenWidget createState() => _LiveQAScreenWidget();
}

class _LiveQAScreenWidget extends State<LiveQAScreenWidget>{
  String _timeUtil ;
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTime();
  }

  void _startTime(){
    _timer = Timer.periodic(Duration(seconds: 1), (timer){
      setState(() {
        _timeUtil = TimeLeft().timeLeft(DateTime(2020,9, 13, 23));
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
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
                  _timeUtil ?? "Already finished",
                  style: TextStyle(
                    color: Colors.red
                    ),
                  ),
                ],
              ),
          ),
        ]
      ));
      }

}