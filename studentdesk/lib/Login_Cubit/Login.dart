import 'package:bloc/bloc.dart';
import './Login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(Initial(null));



  void loginWithFacebook() async{
    var facebookLogin = new FacebookLogin();
    var result = await facebookLogin.logIn(['email']);
    AuthCredential authCredential = FacebookAuthProvider.getCredential(accessToken: result.accessToken.token);

    if(result.status == FacebookLoginStatus.loggedIn){
      final FirebaseUser user = (await _auth.signInWithCredential(authCredential)).user;
    emit(LoginWithFacebook(user));
    }

    return null;
  }


  void loginWithGoogle() async{
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    print(user);
   emit( LoginWithGoogle(user));
  }

  void loading(){
    emit( Loading("Loading"));
  }

}