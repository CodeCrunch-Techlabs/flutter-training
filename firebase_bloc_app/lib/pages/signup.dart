import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_bloc_app/blocs/regBloc/reg_bloc.dart';
import 'package:firebase_bloc_app/blocs/regBloc/reg_event.dart';
import 'package:firebase_bloc_app/blocs/regBloc/reg_state.dart';
import 'package:firebase_bloc_app/pages/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'homepage.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserRegBloc userRegBloc;
  @override
  Widget build(BuildContext context) {
    userRegBloc = BlocProvider.of<UserRegBloc>(context);
    return BlocProvider(
      create: (context) => UserRegBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("SignUp"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocListener<UserRegBloc, UserRegState>(
                listener: (context, state) {
                  if (state is UserRegSuccessfull) {
                    navigateToHomePage(context, state.user);
                  }
                },
                child: BlocBuilder<UserRegBloc, UserRegState>(
                  builder: (context, state) {
                    if (state is UserRegInitial) {
                      return buildInitialUi();
                    } else if (state is UserLoadingState) {
                      return buildLoadingUi();
                    } else if (state is UserRegSuccessfull) {
                      return Container();
                    } else if (state is UserRegFailure) {
                      return buildFailureUi(state.massege);
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: TextField(
                  controller: emailController,
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
                      userRegBloc.add(
                        SignupButtonPressedEvent(
                            email: emailController.text,
                            password: passwordController.text),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text("Login Now"),
                    onPressed: () async {},
                  )
                ],
              )
            ],
          ),
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
      return LoginPage();
    }));
  }
}
