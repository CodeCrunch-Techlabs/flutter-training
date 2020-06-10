import 'package:demo_google_login/utils/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(  
        title: Text("Home Page"),
      ),
      body: SingleChildScrollView(
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Home Page",),
            RaisedButton(
              child: Text("Logout"),
              onPressed: (){
                AuthProvider().logout();
              },
            )
          ],
        ),
      ),
    );
  }
}