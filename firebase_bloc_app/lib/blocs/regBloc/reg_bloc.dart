import 'package:bloc/bloc.dart';
import 'package:firebase_bloc_app/blocs/regBloc/reg_event.dart';
import 'package:firebase_bloc_app/blocs/regBloc/reg_state.dart';
import 'package:firebase_bloc_app/repository/user_repo.dart';

class UserRegBloc extends Bloc<UserRegEvent, UserRegState> {
  UserRepo userRepo;
  UserRegBloc() {
    userRepo = UserRepo();
  }
  @override
  UserRegState get initialState => UserRegInitial();

  @override
  Stream<UserRegState> mapEventToState(UserRegEvent event) async* {
    try {
      if (event is SignupButtonPressedEvent) {
        yield UserLoadingState();
        var user = await userRepo.createUser(event.email, event.password);
        yield UserRegSuccessfull(user: user);
      }
    } catch (e) {
      yield UserRegFailure(massege: e.toString());
    }
  }
}
