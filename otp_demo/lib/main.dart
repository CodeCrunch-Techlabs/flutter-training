import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

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

class _MyHomePageState extends State<MyHomePage> {
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

  final firestoreInstance = Firestore.instance;

  void _onPressed(name, email, mobile, otp) {
    firestoreInstance
        .collection("users")
        .add({"Name": name, "Email": email, "Mobile": mobile, "OTP": otp}).then(
            (value) {
      print(value.documentID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _mobile,
                  decoration: InputDecoration(
                    labelText: 'Mobile No',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Addotp(_otp)),
                      );
                        _otpgenerator();
                        _onPressed(_name.text, _email.text, _mobile.text, _otp);
                      sendSms(_mobile.text, _otp);
                      _name.text = "";
                      _email.text = "";
                      _mobile.text = "";
                    },
                    child: Text('Get OTP'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Addotp extends StatefulWidget {
  final int otp;

  Addotp(this.otp);

  @override
  _AddotpState createState() => _AddotpState(this.otp);
}

class _AddotpState extends State<Addotp> {
  final int otp;

  _AddotpState(this.otp);

  final _enterotp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: _enterotp,
              decoration: InputDecoration(
                labelText: 'Enter OTP',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                child: Text('Submit'),
                onPressed: () {
                    if(otp ==  int.parse(_enterotp.text)){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome!!!"),
      ),
    );
  }
}

