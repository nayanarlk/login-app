import 'package:flutter/material.dart';
import 'package:login_app/Login.dart';
import 'package:login_app/Settings.dart'; 

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _title = 'Please Login!';
  Widget _screen;
  Login _login;
  Settings _settings;
  bool _authenticated;
  _MyAppState() {
    _login = new Login(onSubmit: (){onSubmit();},);
    _settings = new Settings();
    _screen = _login;
    _authenticated = false;
  }

  void onSubmit() {
    print("Login with Username: " + _login.username + "& Password: " + _login.password);
  }

  void _goHome() {
    print("Go Home");
    setState((){
      if(_authenticated == true) {
        _screen = _settings;
      } else {
        _screen = _login;
      }
    });
  }

  void _logOut() {
    print("Log Out");
    _setAuthenticated(false);
  }

  void _setAuthenticated(bool auth) {
    setState((){
      if(auth == true) {
        _screen = _settings;
        _title = "welcome";
      } else {
        _screen = _login;
        _title = "Please Login";
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Login Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.home),
              onPressed: (){_goHome();},
            ),

            new IconButton(
              icon: new Icon(Icons.exit_to_app),
              onPressed: (){_logOut();},
            ),
          ],
        ),

        body: _screen,
      ),
    );
  }
}