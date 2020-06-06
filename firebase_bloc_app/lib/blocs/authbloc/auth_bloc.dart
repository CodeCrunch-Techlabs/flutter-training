import 'package:firebase_bloc_app/blocs/authbloc/auth_event.dart';
import 'package:firebase_bloc_app/blocs/authbloc/auth_state.dart';
import 'package:firebase_bloc_app/repository/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserRepo userRepo;
  AuthBloc() {
    this.userRepo = UserRepo();
  }
  @override
  AuthState get initialState => AuthInitialState();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStartedEvent) {
      try {
        var isSignIn = await userRepo.isSignedIn();
        if (isSignIn) {
          var user = await userRepo.getCurrentUser();
          yield AuthenticatedState(user: user);
        } else {
          yield UnAuthenticatedState();
        }
      } catch (e) {
        yield UnAuthenticatedState();
      }
    }
  }
}
