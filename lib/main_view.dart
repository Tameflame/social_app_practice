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
//    return new MainTabView();
    return new MaterialApp(
      title: "Azam's Social App",
      home: new PageToLandOn(),
      routes: <String, WidgetBuilder>{
        "/LoginPage": (BuildContext context) => new LoginPageConstructor(),
        "/MainPage": (BuildContext context) => new MainTabView(),
      },
    );
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
    _controller = new TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    // in the video _controller.dispose comes before super.dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This piece of logic checks if user has state
    // Honestly this piece of code doesn't belong here.
    // Maybe have another class which handles the logic, and let this class just
    // contain MainTabView widgetbuilder
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "VoicedOut",
          style: new TextStyle(fontFamily: "Montserrat"),
        ),
        backgroundColor: Colors.blue,
        bottom: new TabBar(controller: _controller, tabs: [
          new Tab(
            icon: new Icon(Icons.whatshot),
          ),
          new Tab(
            icon: new Icon(Icons.home),
          ),
          // I probably want to replace this with a notifications tab
          // Also, there are several notification icones, I shouold have
          // a notifications Icon handler
          new Tab(
            icon: new Icon(Icons.explore),
          )
        ]),
      ),
      body: new TabBarView(controller: _controller, children: [
        // Pages go here
        new PageViewTrending(),
        new FeedPage(),
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
            new IconButton(
                iconSize: 100.0,
                icon: new Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/LoginPage");
                }),
          ],
        ),
      ),
    );
  }
}

class PageToLandOn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !UserState.usertoken ? new MyLoginPage() : new MainTabView();
  }
}
