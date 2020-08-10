// import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

import 'package:studentdesk/screens/home.dart';

class GoogleLogin extends StatefulWidget {
  @override
  _GoogleLoginState createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  bool _isLoggedIn = false;

  Map userProfile;
  final facebookLogin = FacebookLogin();

  _loginWithFB() async {
    final result = await facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=$token');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(JSON.jsonDecode(graphResponse.body));
        setState(() {
          userProfile = profile;
          _isLoggedIn = true;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => _isLoggedIn = false);
        break;
      case FacebookLoginStatus.error:
        setState(() => _isLoggedIn = false);
        break;
    }
  }

  _fblogout() {
    facebookLogin.logOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err) {
      print(err);
    }
  }

  // _logout() {
  //   _googleSignIn.signOut();
  //   setState(() {
  //     _isLoggedIn = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              "assets/bg.jpg",
            ),
            fit: BoxFit.cover,
          )),
          child: Center(
            // child: _isLoggedIn
            //     ? Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: <Widget>[
            //           Image.network(
            //             _googleSignIn.currentUser.photoUrl,
            //             height: 50.0,
            //             width: 50.0,
            //           ),
            //           Text(_googleSignIn.currentUser.displayName),
            //           OutlineButton(
            //             child: Text("Logout"),
            //             onPressed: () {
            //               _logout();
            //             },
            //           )
            //         ],
            //       )
            //     : Center(
            //         child: OutlineButton(
            //           child: Text("Login with Google",style: TextStyle(color: Colors.white),),
            //           onPressed: () {
            //             _login();
            //           },
            //         ),
            //       ),

            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "WELCOME TO",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent[200]),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Image(
                    image: AssetImage("assets/logo.png"),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        color: Colors.blueAccent[200],
                        onPressed: () {
                          _loginWithFB().whenComplete(() {
                           Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Home(userProfile),
                            ),
                          );
                          });
                          
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) {
                          //     return Home(userProfile : userProfile);
                          //   }),
                          // );
                        },
                        child: Row(
                          children: [
                            Image(
                                image: AssetImage("assets/face.png"),
                                height: 35.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Login with Facebook',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        color: Colors.white,
                        onPressed: () {
                          _login();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Home(userProfile),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Image(
                                image: AssetImage("assets/g.png"),
                                height: 35.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Sign in with Google',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
