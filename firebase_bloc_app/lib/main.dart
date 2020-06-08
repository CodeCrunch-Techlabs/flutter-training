import 'package:firebase_bloc_app/blocs/authbloc/auth_state.dart';
import 'package:firebase_bloc_app/pages/homepage.dart';
import 'package:firebase_bloc_app/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_bloc_app/blocs/authbloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => AuthBloc(),
        child: App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthenticatedState) {
        return SplashScreen();
      } else if (state is AuthenticatedState) {
        return HomePage(state.user);
      } else if (state is UnAuthenticatedState) {
        return SignUpPage();
      }
    });
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Welcome",
        style: TextStyle(
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
