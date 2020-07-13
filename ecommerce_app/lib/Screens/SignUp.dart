import 'package:ecommerceapp/Screens/otp.dart';
import 'package:ecommerceapp/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _mobile = TextEditingController();


  int _otp = 123456;

  double _otpgenerator() {
    var rnd = new Random();
    var next = rnd.nextDouble() * 1000000;
    while (next < 100000) {
      next *= 10;
    }
    _otp = next.toInt();
  }

  FirebaseBrain firebaseBrain = FirebaseBrain();

  Future<Map<String, dynamic>> sendSms(mobile, otp) async {
    Map<String, String> headers = {
      'authkey': '103299ArFk6zxpf8l5f09945cP1',
      'Content-Type': 'application/json'
    };
    final msg = jsonEncode({
      "mobiles": "$mobile",
      "flow_id": "5f09b81cd6fc053ce17438a4",
      "otp" : "$otp",
      "sender": "SMSIND",
      "unicode": 0
    });

    var response = await http.post(
      'https://api.msg91.com/api/v5/flow/',
      headers: headers,
      body: msg,
    );
    print(response.body);
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipPath(
                  child: Container(
                    padding: EdgeInsets.all(100),
                    color: Theme.of(context).primaryColor,
                    child: Text("Get OTP", style: TextStyle(
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
                            labelText:  'NICK NAME',
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
                        controller: _name,
                      ),
                      SizedBox(height: 20.0,),
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
                          ),
                        ),
                       controller: _email,
                      ),
                      SizedBox(height: 10.0,),
                      TextField(
                        decoration: InputDecoration(
                          labelText:  'MOBILE NO',
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
                        controller: _mobile,
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
                                _otpgenerator();
                                firebaseBrain.createUser(_name.text, _email.text, _mobile.text, _otp);
                                sendSms(_mobile.text, _otp);
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Enterotp(_otp)));
                                _name.text = "";
                                _email.text = "";
                                _mobile.text = "";
                              },
                              child: Center(
                                child: Text(
                                  "Get OTP",
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
