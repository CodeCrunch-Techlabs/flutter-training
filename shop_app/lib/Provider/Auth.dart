import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shopapp/model/Http_exception.dart';

class Auth with ChangeNotifier {
  String token;
  DateTime expiryDate;
  String userId;
  Timer authTimer;

  bool get isAuth{
     return token != null;
  }

  String get gettoken{
    if(expiryDate != null && expiryDate.isAfter(DateTime.now()) && token != null){
      return token;
    }
    return null;
  }

  String get getuserId{
    return userId;
  }

  Future<void> authenticate(String email, String password, String urlSegment) async {
    final url =
        "https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyC4X4IA98Jf3QgOhjyMesD_hbCiGEcQRDk";
    try{
      final response = await http.post(
        url,
        body: json.encode(
            {'email': email, 'password': password, 'returnSecureToken': true}),
      );
      final responseData = json.decode(response.body);
      if(responseData['error'] != null){
         throw HttpException(responseData['error']['message']);
      }
      token = responseData['idToken'];
      userId = responseData['localId'];
      expiryDate = DateTime.now().add(Duration(seconds: int.parse(responseData['expiresIn'])));
      autoLogout();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({'token': token, 'userId': userId, 'expiryDate': expiryDate.toIso8601String() });
      prefs.setString('userData', userData);
    }
    catch(error){
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {

   return authenticate(email, password, 'signUp');

  }

  Future<void> signIn(String email, String password) async {

   return authenticate(email, password, 'signInWithPassword');

  }

  Future<bool> tryAutoLogin() async{
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('userData')){
      return false;
    }
    final extractedUserData = json.decode(prefs.getString('userData')) as Map<String, Object>;
    final getexpiryDate = DateTime.parse(extractedUserData['expiryDate']);

    if(getexpiryDate.isBefore(DateTime.now())){
      return false;
    }
    token = extractedUserData['token'];
    userId = extractedUserData['userId'];
    expiryDate = getexpiryDate;
    notifyListeners();
    autoLogout();
    return true;
  }

  void logout() async{
    token = null;
    userId = null;
    expiryDate = null;
    if(authTimer != null){
      authTimer.cancel();
      authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void autoLogout(){
    if(authTimer != null){
      authTimer.cancel();
    }
   final timeToExpry = expiryDate.difference(DateTime.now()).inSeconds;
   authTimer = Timer(Duration(seconds: timeToExpry), logout);
  }

}
