// The trending page

import 'main.dart';
import 'package:flutter/material.dart';

class PageViewTrending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: new Text(
                  "Put trending articles and topics here, should be a mix of stuff the user follows and new stuff", style: MyFont.montserrat,),
            ),
            new Icon(
              Icons.trending_up,
              size: 150.0,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
