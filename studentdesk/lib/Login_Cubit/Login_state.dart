import 'package:flutter/material.dart';

class LoginState{
  final user;
  LoginState(this.user);
}

class Initial extends LoginState{
  Initial(user) : super(user);
}

class LoginWithFacebook extends LoginState{
  LoginWithFacebook(user) : super(user);
}

class LoginWithGoogle extends LoginState{
  LoginWithGoogle(user) : super(user);
}

class Loading extends LoginState{
  Loading(user) : super(user);
}
