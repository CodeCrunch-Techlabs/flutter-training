import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class UserRegState extends Equatable {}

class UserRegInitial extends UserRegState {
  @override
  List<Object> get props => null;
}

class UserLoadingState extends UserRegState {
  @override
  List<Object> get props => null;
}

class UserRegSuccessfull extends UserRegState {
  FirebaseUser user;
  UserRegSuccessfull({@required this.user});
  @override
  List<Object> get props => null;
}

class UserRegFailure extends UserRegState {
  String massege;
  UserRegFailure({@required this.massege});
  @override
  List<Object> get props => null;
}
