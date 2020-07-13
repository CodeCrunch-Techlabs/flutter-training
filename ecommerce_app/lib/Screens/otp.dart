import 'package:ecommerceapp/Screens/AddCart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Enterotp extends StatefulWidget {

  final int otp;

  Enterotp(this.otp);

  @override
  _EnterotpState createState() => _EnterotpState(this.otp);
}

class _EnterotpState extends State<Enterotp> {

  final int otp;

  _EnterotpState(this.otp);

  final _enterotp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                        labelText:  'ENTER OTP',
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
                    controller: _enterotp,
                  ),
                  SizedBox(height: 20.0,),
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
                            if(otp ==  int.parse(_enterotp.text)){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddCartPage()));
                            }
                            else{
                              showDialog(context: context, child:
                              new AlertDialog(
                                title: new Text("You have entered wrong OTP!"),
                                content: new Text("Please check again!"),
                              )
                              );
                            }
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
