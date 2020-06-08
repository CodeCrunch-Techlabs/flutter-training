import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_bloc_app/blocs/loginBloc/login_bloc.dart';
import 'package:firebase_bloc_app/blocs/loginBloc/login_event.dart';
import 'package:firebase_bloc_app/blocs/loginBloc/login_state.dart';
import 'package:firebase_bloc_app/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'homepage.dart';

class LoginPageParent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:  (context)=>LoginBloc(),
      child: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  TextEditingController emainController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginBloc loginBloc;
  @override
  Widget build(BuildContext context) {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccessState) {
                  return navigateToHomePage(context, state.user);
                }
              },
              child: BlocBuilder(
                builder: (context, state) {
                  if (state is LoginInitialState) {
                    return buildInitialUi();
                  } else if (state is LoginLoadingState) {
                    return buildLoadingUi();
                  } else if (state is LoginSuccessState) {
                    return Container();
                  } else if (state is LoginFailureState) {
                    return buildFailureUi(state.massege);
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: TextField(
                controller: emainController,
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
                controller: passwordController,
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
                  onPressed: () async {
                    loginBloc.add(
                      LoginButtonPressedEvent(
                          email: emainController.text,
                          password: passwordController.text),
                    );
                  },
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

  Widget buildInitialUi() {
    return Text("Waiting for user Registration");
  }

  Widget buildLoadingUi() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildFailureUi(String message) {
    return Text(
      message,
      style: TextStyle(
        color: Colors.red,
      ),
    );
  }

  void navigateToHomePage(BuildContext context, FirebaseUser user) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return HomePage(user);
    }));
  }

  void navigateToLoginPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return SignUpPageParent();
    }));
  }
}
