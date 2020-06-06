import 'package:firebase_bloc_app/blocs/homeBloc/home_event.dart';
import 'package:firebase_bloc_app/blocs/homeBloc/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_bloc_app/repository/user_repo.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  UserRepo userRepo;
  HomePageBloc() {
    this.userRepo = UserRepo();
  }
  @override
  HomePageState get initialState => LogOutInitial();

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is LogOutButtonPressedEvent) {
      await userRepo.signOut();
      yield LogOutSuccess();
    }
  }
}
