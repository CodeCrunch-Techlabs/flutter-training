import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class UserRegEvent extends Equatable {}

class SignupButtonPressedEvent extends UserRegEvent {
  String email, password;
  SignupButtonPressedEvent({@required this.email, @required this.password});
  @override
  List<Object> get props => null;
}
