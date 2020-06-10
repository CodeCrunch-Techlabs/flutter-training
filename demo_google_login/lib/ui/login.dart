import 'package:demo_google_login/utils/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.0,
            ),
            Text(
              "LOGIN FORM",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: Text("Login with Google"),
              onPressed: () async {
                bool res = await AuthProvider().loginWithGoogle();
                if(!res)
                  print("Error login");
              },
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Enter Email",
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter Password",
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text(
                "Login",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () async {
                if (_emailController.text.isEmpty ||
                    _passwordController.text.isEmpty) {
                  print("Email and Password cannot be Empty");
                  return;
                }
                bool res = await AuthProvider().signInWithEmail(
                    _emailController.text, _passwordController.text);
                if (!res) {
                  print("Login Failed");
                }
              },
            )
          ],
        ),
      )),
    );
  }
}
