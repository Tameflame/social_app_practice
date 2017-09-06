// Imports
import 'package:flutter/material.dart';


// Login Button
class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => new _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  void _onClicked() {
    setState(() {
      Scaffold.of(context).removeCurrentSnackBar();
      if (DetailsHolder.getUsername().isEmpty ||
          DetailsHolder.getPassword().isEmpty) {
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: new Text("Please enter your details")));
      } else {
        Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text("Username: " +
                DetailsHolder.getUsername() +
                " Password: " +
                DetailsHolder.getPassword(),)));
      }
    });
  }

  static var assetImage = new AssetImage("assets/loginscreen/btn.png");
  static var image = new Image(image: assetImage, height: 50.0, width: 330.0);

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: image.height,
        width: image.width,
        //TODO: Need to change the login button image to one without text, install the Roboto text font, and draw the font on manually
        child: new Container(
          height: image.height,
          width: image.width,
          child: new FlatButton(
            onPressed: _onClicked,
            child: new ConstrainedBox(
              constraints: new BoxConstraints.expand(),
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
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(50.0)),
                      highlightColor: Colors.black45,
                      splashColor: Colors.black45,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

// Username Widget
class UsernameText extends StatefulWidget {
  @override
  _UsernameTextState createState() => new _UsernameTextState();
}

class _UsernameTextState extends State<UsernameText> {
  var _textController = new TextEditingController();

  void _submitText(String text) {
    setState(() {
      // do something
    });
  }

  void _isTouched(String text) {
    setState(() {
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
              padding: const EdgeInsets.only(
                left: 50.0,
              ),
              width: image.width - 50,
              child: new TextField(
                controller: _textController,
                onChanged: _isTouched,
                onSubmitted: _submitText,
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontFamily: "Montserrat"),
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

  void _submitText(String text) {
    setState(() {
      // Do something here.
    });
  }

  void _touched(String text) {
    setState(() {
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

    var textstyle = new TextStyle(
      color: Colors.white,
      fontFamily: "Montserrat",
    );
    var textfield = new TextField(
      controller: _textController,
      onChanged: _touched,
      onSubmitted: _submitText,
      style: textstyle,
      decoration: new InputDecoration(hideDivider: true),
      obscureText: true,
      autocorrect: false,
    );
    var container2 = new Container(
      padding: const EdgeInsets.only(left: 50.0),
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
  static String _username = "";
  static String _password = "";

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
            ),
          ),
        ));
  }
}


// Login Screen View



class MyLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage loginBackgroundAsset =
    new AssetImage("assets/loginscreen/backgroundrock.png");
    return new MaterialApp(
        title: "Azam's Social App",
        home: new Scaffold(
          body: new Container(
              padding: const EdgeInsets.only(top: 23.0),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: loginBackgroundAsset, fit: BoxFit.cover)),
              child: new Stack(
                children: <Widget>[
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
        ));
  }
}
