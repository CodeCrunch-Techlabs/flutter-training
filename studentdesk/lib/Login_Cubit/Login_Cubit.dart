import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:studentdesk/Login_Cubit/Login_state.dart';
import 'package:studentdesk/Logic/firebase.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(Initial(null));

  Future<void> loginWithGoogle() async {
    emit(Loading(null));
    signInWithGoogle().then((user) => {
      print(user),
    emit(LoginWithGoogle(user))
    });
  }

  Future<void> loginWithFacebook() async {
    emit(Loading(null));
    signInWithFacebook().then((user) => {
      print(user),
      emit(LoginWithFacebook(user))
    });
  }

  @override
  void onChange(Change<dynamic> change) {
    print(change);
    super.onChange(change);
  }
}
