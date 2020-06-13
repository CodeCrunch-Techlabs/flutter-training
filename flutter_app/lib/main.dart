import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

void main() {
  runApp(MaterialApp(
    title: 'Facebook',
    home: MyMainPage(),
  ));
}

class MyMainPage extends StatefulWidget {
  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLogged = false;

  FirebaseUser myUser;

  Future<FirebaseUser> _loginWithFacebook() async{

     var facebookLogin = new FacebookLogin();
     var result = await facebookLogin.logIn(['email']);
     debugPrint(result.status.toString());
     AuthCredential authCredential = FacebookAuthProvider.getCredential(accessToken: result.accessToken.token);

     if(result.status == FacebookLoginStatus.loggedIn){
       final FirebaseUser user = (await _auth.signInWithCredential(authCredential)).user;
       return user;
     }

     return null;
  }

  void _logout() async{
    await _auth.signOut().then((response){
      setState(() {
        isLogged = false;
      });
    });
  }

  void _logIn(){
    _loginWithFacebook().then((response){
        if(response != null){
          myUser = response;
          setState(() {
            isLogged = true;
          });
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook Login Demo"),
      ),
      body: Center(
        child: isLogged ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: " + myUser.displayName),
            RaisedButton(
              child: Text("Log Out"),
              onPressed: _logout,
            )
          ],
        ) : FacebookSignInButton(
          onPressed: _logIn,
        ),
      ),
    );
  }
}
