import 'package:flutter/material.dart';
import 'mywidgets.dart';

main() {
  runApp(new MyApp2());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        backgroundColor: Colors.black,
//        centerTitle: true,
//        title: new Text("Azam's Social App"),
//      ),
      body: new Container(
           padding: const EdgeInsets.only(top: 23.0),
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: ImageLoginBackground.ast, fit: BoxFit.cover)),
          child: new Stack(
            children: <Widget>[
              //new ImageLoginBackground(),
              new Center(
                  child: new Container(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Divider(
                            height: 24.0,
                          ),
                          new UsernameText(),
                          new Divider(
                            height: 8.0,
                          ),
                          new PasswordText(),
                          new Divider(),
                          new LoginButton(),
                        ],
                      )))
            ],
          )),
    );
  }
}

class ImageLoginBackground extends StatelessWidget {
  static AssetImage ast =
      new AssetImage("assets/loginscreen/backgroundrock.png");
  static Image img = new Image(image: ast);

  @override
  Widget build(BuildContext context) {
    var assetImage = new AssetImage("assets/loginscreen/backgroundrock.png");
    return new Container(
      padding: const EdgeInsets.only(top: 0.0),
      child: new Image(
        image: assetImage,
        width: 600.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ImageLoginSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetImage = new AssetImage("assets/loginscreen/btn.png");
    var image = new Image(
      image: assetImage,
      width: 300.0,
    );
    return new Container(
      // padding: const EdgeInsets.only(top: 50.0),
      child: image,
    );
  }
}

class ImageUsername extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetImage = new AssetImage("assets/loginscreen/username.png");
    var image = new Image(
      image: assetImage,
      width: 300.0,
    );
    return new Container(
      padding: const EdgeInsets.all(10.0),
      child: new Stack(
        children: <Widget>[
          image,
        ],
      ),
    );
  }
}

class ImagePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetImage = new AssetImage("assets/loginscreen/password.png");
    var image = new Image(
      image: assetImage,
      width: 300.0,
    );
    return new Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: new Stack(
        children: <Widget>[
          image,
        ],
      ),
    );
  }
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Azam's Social App",
      home: new MyApp(),
    );
  }
}
