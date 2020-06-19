import 'package:ecommerceapp/Screens/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ecommerceapp/Screens/Home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipPath(
              child: Container(
                padding: EdgeInsets.all(100),
                color: Theme.of(context).primaryColor,
                child: Text("Sign Up", style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).secondaryHeaderColor,
                    fontWeight: FontWeight.bold
                ),),
              ),
              clipper: CustomClipPath(),
            ),
            Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),//form
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText:  'EMAIL',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).primaryColor,)
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)
                        )
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextField(
                    decoration: InputDecoration(
                      labelText:  'PASSWORD',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).primaryColor,)
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 10.0,),
                  TextField(
                    decoration: InputDecoration(
                      labelText:  'NICK NAME',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Theme.of(context).primaryColor,)
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 40.0,),
                  Center(
                    child: Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Theme.of(context).primaryColor,
                        elevation: 7.0,
                        shadowColor: Theme.of(context).primaryColor,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
                          },
                          child: Center(
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                ],
              ),
            ),
            SizedBox(height:5.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an account ?",
                ),
                SizedBox(width: 5.0,),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text("Sign In here",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),),
                )
              ],
            ),
            SizedBox(height: 15,)
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius=10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width/4, size.height
        - 40, size.width/2, size.height-20);
    path.quadraticBezierTo(3/4*size.width, size.height,
        size.width, size.height-60);
    path.lineTo(size.width, 0);

    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
