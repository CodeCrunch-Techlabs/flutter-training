import 'package:bloc/bloc.dart';
import 'package:studentdesk/Firebase/firebase.dart';

import 'package:studentdesk/Login_Cubit/Login_state.dart';

// Cubit for Login.

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
  }//This will print state change.
}
