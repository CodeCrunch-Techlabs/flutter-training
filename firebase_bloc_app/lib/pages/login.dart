import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  hintText: "Email",
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText: "Password",
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("Sign Up"),
                  onPressed: () async {},
                ),
                RaisedButton(
                  child: Text("Login Now"),
                  onPressed: () async {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
