import 'package:firebase_bloc_app/blocs/homeBloc/home_bloc.dart';
import 'package:firebase_bloc_app/blocs/homeBloc/home_event.dart';
import 'package:firebase_bloc_app/blocs/homeBloc/home_state.dart';
import 'package:firebase_bloc_app/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class HomePageParent extends StatelessWidget {
  FirebaseUser user;
  HomePageParent({@required this.user});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:  (context)=>HomePageBloc(),
      child: HomePage(user),
    );
  }
}

class HomePage extends StatelessWidget {
  FirebaseUser user;
  HomePageBloc homePageBloc;

  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    homePageBloc = BlocProvider.of<HomePageBloc>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Email"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                homePageBloc.add(
                  LogOutButtonPressedEvent(),
                );
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(user.email),
            ),
            BlocListener<HomePageBloc, HomePageState>(
              listener: (context, state) {
                if (state is LogOutSuccess) {
                  return navigateToSignUpPage(context);
                }
              },
              child: BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
                  if (state is LogOutInitial) {
                    return Container();
                  } else if (state is LogOutSuccess) {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToSignUpPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return SignUpPageParent();
    }));
  }
}
