// Some widgets
import 'package:flutter/material.dart';

// Login Button
class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => new _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  void _onClicked() {
    setState(() {
      //do something, probably sends login info to firebase for authentication
      Scaffold.of(context).showSnackBar(
          new SnackBar(content: new Text("You pressed the button!")));
    });
  }

//  void _highlightbutton(PointerDownEvent event) {
//    setState(() {
//      image = image2;
//    });
//  }
//
//  void _unhighlightbutton(PointerUpEvent event) {
//    setState(() {
//      image = new Image(
//        image: assetImage,
//        height: 50.0,
//        width: 330.0,
//      );
//    });
//  }

//  Image imagebuilder (path) {
//
//  }
//  static var assetImage2 = new AssetImage("assets/loginscreen/btn_press.png");
  static var assetImage = new AssetImage("assets/loginscreen/btn.png");
  static var image = new Image(image: assetImage, height: 50.0, width: 330.0);
//  static var image2 = new Image(
//    image: assetImage2,
//    height: 50.0,
//    width: 330.0,
//  );

//  bool istouching = false;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: image.height,
      width: image.width,
//        child: new Listener(
//          onPointerUp: (PointerUpEvent event) {
//            setState(() {
//              // image = new Image(image: assetImage, height: 50.0, width: 330.0);
//              istouching = false;
//            });
//          },
//          onPointerDown: (PointerDownEvent event) {
//            setState(() {
//              // image = new Image(image: assetImage2, height: 50.0, width: 330.0,);
//              istouching = true;
//            });
//          },
    //TODO: Need to change the login button image to one without text, install the Roboto text font, and draw the font on manually
      child: new Stack(
        children: <Widget>[
//          image2,
          new Container(
            height: image.height,
            width: image.width,
            child: new FlatButton(
              onPressed: _onClicked,
              child: new ConstrainedBox(
                constraints: new BoxConstraints.expand(),
//                    child: istouching ? image2 : image,
                child: new Stack(
                  children: <Widget>[
                    image,
                    new Material(
                      elevation: 10.0,
                      color: Colors.transparent,
                      child: new InkWell(
                        onTap: () {
                          _onClicked();
                        },
                        highlightColor: Colors.black45,
                        splashColor: Colors.black45,
                        child: new Container(
                          color: Colors.transparent,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Username Widget
class UsernameText extends StatefulWidget {
  @override
  _UsernameTextState createState() => new _UsernameTextState();
}

class _UsernameTextState extends State<UsernameText> {
  var _textController = new TextEditingController();

//  bool _isComposing = false;

  void _submitText(String text) {
    setState(() {
      // do something
    });
  }

  void _isTouched(String text) {
    setState(() {
//      if (!_isComposing) {
//        _textController.clear();
//        _isComposing = true;
//      }
      DetailsHolder.setUsername(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    var _assetImage = new AssetImage("assets/loginscreen/username.png");
    var image = new Image(
      image: _assetImage,
      width: 300.0,
    );
    return new Container(
      width: image.width,
      child: new Stack(
        children: <Widget>[
          image,
          new Container(
              padding: const EdgeInsets.only(left: 50.0, top: 2.5),
              width: image.width - 50,
              child: new TextField(
                controller: _textController,
                onChanged: _isTouched,
                onSubmitted: _submitText,
                style: new TextStyle(color: Colors.white, fontSize: 15.0),
                decoration: new InputDecoration(
                  hideDivider: true,
                ),
              ))
        ],
      ),
    );
  }
}

// Password Widget
class PasswordText extends StatefulWidget {
  @override
  _PasswordTextState createState() => new _PasswordTextState();
}

class _PasswordTextState extends State<PasswordText> {
  var _textController = new TextEditingController();

//  bool _isComposing = false;

  void _submitText(String text) {
    setState(() {
      // Do something here.
    });
  }

  void _touched(String text) {
    setState(() {
//      if (_isComposing == false) {
//        _textController.clear();
//        _isComposing = true;
//      }
      DetailsHolder.setPassword(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    var assetImage = new AssetImage("assets/loginscreen/password.png");
    var image = new Image(
      image: assetImage,
      width: 300.0,
    );
//    return new Container(
//        width: image.width,
//        child: new Stack(
//          children: <Widget>[
//            image,
//            new Container(
//              padding: const EdgeInsets.only(left: 50.0, top: 2.5),
//              width: image.width-50,
//              child: new TextField(
//                controller: _textController,
//                onChanged: _touched,
//                onSubmitted: _submitText,
//                style: new TextStyle(color: Colors.white),
//              ),
//            ),
//          ],
//        ));

    var textstyle =
        new TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    var textfield = new TextField(
      controller: _textController,
      onChanged: _touched,
      onSubmitted: _submitText,
      style: textstyle,
      decoration: new InputDecoration(hideDivider: true),
      obscureText: true,
    );
    var container2 = new Container(
      padding: const EdgeInsets.only(left: 50.0, top: 2.5),
      width: image.width - 50,
      child: textfield,
    );
    var stack = new Stack(
      children: <Widget>[image, container2],
    );
    var container = new Container(
      width: image.width,
      child: stack,
    );
    return container;
  }
}

class DetailsHolder {
  static String _username;
  static String _password;

  static void setUsername(String user) {
    _username = user;
  }

  static void setPassword(String pass) {
    _password = pass;
  }

  static String getUsername() {
    return _username;
  }

  static String getPassword() {
    return _password;
  }

  static void submitDetails() {
    // Submits the details to the authenticator
  }
}

class NewLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
        highlightColor: Colors.blue,
        splashColor: Colors.amberAccent,
        child: new Container(
          width: 100.0,
          height: 100.0,
          decoration: new BoxDecoration(),
          child: new Material(
            elevation: 2.0,
            child: new InkWell(
              onTap: () {},
              highlightColor: Colors.transparent,
              splashColor: Colors.black26,
//              child: new Container(
//                width: 100.0,
//                height: 100.0,
//                color: Colors.transparent,
//              ),
            ),
          ),
//          child: new FlatButton(
//              onPressed: () {
////            Scaffold
////                .of(context)
////                .showSnackBar(new SnackBar(content: new Text("Ho")));
//              },
//              child: new Text("Sign in")),
        ));
  }
}
