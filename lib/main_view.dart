// This is going to be the main view
// It will have 3 tabs. Trending, Feed (the default), and Explore

import 'package:flutter/material.dart';
import 'main.dart';
import 'loginscreen.dart';
import 'trending_view.dart';
import 'package:SocialApp/Explore.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MainTabView();
//    return new MaterialApp(
//      home: new MainTabView(),
//      routes: <String, WidgetBuilder>{
//        "/LoginPage": (BuildContext context) => new MyLoginPage(),
//        // "/MainPage" : (BuildContext context) => new MainTabView(),
//      },);
  }
}

class MainTabView extends StatefulWidget {
  @override
  _MainTabViewState createState() => new _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // in the video _controller.dispose comes before super.dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "VoicedOut",
          style: new TextStyle(fontFamily: "Montserrat"),
        ),
        backgroundColor: Colors.blue,
        bottom: new TabBar(controller: _controller, tabs: [
          new Tab(
            icon: new Icon(Icons.home),
          ),
          new Tab(
            icon: new Icon(Icons.trending_up),
          ),
          new Tab(
            icon: new Icon(Icons.explore),
          )
        ]),
      ),
      body: new TabBarView(controller: _controller, children: [
        // Pages go here
        new FeedPage(),
        new PageViewTrending(),
        new PageViewExplore(),
      ]),
    );
  }
}

class FeedPage extends StatelessWidget {
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
                "This is the home feed page, put stuff like new friends' posts, updates, etc.",
                style: MyFont.montserrat,
              ),
            ),
            new Divider(),
            new IconButton(iconSize: 100.0,
                icon: new Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
