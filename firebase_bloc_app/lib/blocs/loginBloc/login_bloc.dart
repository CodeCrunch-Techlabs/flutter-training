import 'package:bloc/bloc.dart';
import 'package:firebase_bloc_app/blocs/loginBloc/login_event.dart';
import 'package:firebase_bloc_app/blocs/loginBloc/login_state.dart';
import 'package:firebase_bloc_app/repository/user_repo.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepo userRepo;
  LoginBloc() {
    this.userRepo = UserRepo();
  }
  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressedEvent) {
      try {
        yield LoginLoadingState();
        var user = await userRepo.signInUser(event.email, event.password);
        yield LoginSuccessState(user: user);
      } catch (e) {
        yield LoginFailureState(massege: e.toString());
      }
    }
  }
}
