import 'package:beauty_therapy_app/screens/loginscreen.dart';
import 'package:beauty_therapy_app/screens/profile.dart';
import 'package:flutter/material.dart';
 

class Signup extends StatelessWidget {
  final bool login;
  final Function press;
  const Signup({
    this.login = false,
    this.press,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "images/signup_top.png",
                  width: size.width * 0.15,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  "images/main_bottom.png",
                  width: size.width * 0.25,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SIGNUP",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Image.asset(
                    "images/s.jpg",
                    height: size.height * 0.35,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.amberAccent[100],
                        borderRadius: BorderRadius.circular(29)),
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          hintText: "Enter Email",
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.amberAccent[100],
                        borderRadius: BorderRadius.circular(29)),
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          hintText: "Password",
                          suffixIcon: Icon(
                            Icons.visibility,
                            color: Colors.black,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        color: Colors.amberAccent[400],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Profile();
                            }),
                          );
                        },
                        child: Text(
                          "SIGNUP",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        login
                            ? "Don't have an account ? "
                            : "Already have an account ? ",
                      ),
                      // SizedBox(
                      //   height: size.height * 0.1,
                      // ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Login(),
                            ),
                          );
                        },
                        child: Text(
                          login ? "Sign Up" : "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.amberAccent),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    width: size.width * 0.8,
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.amberAccent,
                            height: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "OR",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.amberAccent,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.amberAccent,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "images/t.png",
                          width: 20,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.amberAccent,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "images/f.png",
                          width: 20,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.amberAccent,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "images/g.png",
                          width: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
