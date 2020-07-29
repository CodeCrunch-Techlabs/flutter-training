import 'package:flutter/material.dart';
import 'package:studentdesk/Logic/firebase.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Bookbg.jpg"),
              fit: BoxFit.cover,
              alignment: FractionalOffset.center,
            ),
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      signInWithGoogle().whenComplete(() {
                        print("Success");
                      });
                    },
                    child: Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.green,
                        elevation: 7.0,
                        shadowColor: Colors.greenAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: ImageIcon(
                                  AssetImage('assets/images/google.png')),
                              heightFactor: 20.0,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Center(
                              child: Text(
                                'Login with Google',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Jost"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      signInWithFacebook().whenComplete(() {
                        print("facebook Success");
                      });
                    },
                    child: Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.green,
                        elevation: 7.0,
                        shadowColor: Colors.greenAccent,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: ImageIcon(
                                    AssetImage('assets/images/facebook.png')),
                                heightFactor: 20.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Center(
                                child: Text(
                                  'Login with Facebook',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Jost"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
