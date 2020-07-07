import 'package:beauty_therapy_app/pages/home.dart';
import 'package:beauty_therapy_app/screens/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final bool login;
  final Function press;
  const Login({
    this.login = true,
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
                  "images/main_top.png",
                  width: size.width * 0.35,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "images/login_bottom.png",
                  width: size.width * 0.4,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LOGIN",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Image.asset(
                    "images/l.jpg",
                    height: size.height * 0.35,
                    width: size.width * 0.7,
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
                    height: 10,
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
                              return HomePage();
                            }),
                          );
                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        login
                            ? "Don't have an account ? "
                            : "Already have an account ? ",
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Signup(),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
