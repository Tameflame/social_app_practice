// This is going to be the main view
// It will have 3 tabs. Trending, Feed (the default), and Explore

import 'package:flutter/material.dart';
import 'main.dart';


class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new MainTabView(),);
  }
}



class MainTabView extends StatefulWidget {
  @override
  _MainTabViewState createState() => new _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("VoicedOut", style: new TextStyle(fontFamily: "Montserrat", fontSize: 100.0),), backgroundColor: Colors.black,),
    );
  }
}
