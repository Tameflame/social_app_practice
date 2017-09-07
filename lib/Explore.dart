// Explore Page

import 'package:flutter/material.dart';
import 'main.dart';

class PageViewExplore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Explore new topics on this page!", style: MyFont.montserrat,),
          new Divider(),
          new Icon(
            Icons.explore,
            size: 150.0,
            color: Colors.blue,
          ),
        ],
      )),
    );
  }
}
