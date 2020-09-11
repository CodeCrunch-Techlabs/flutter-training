import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shopapp/model/Http_exception.dart';

class Auth with ChangeNotifier {
  String token;
  DateTime expiryDate;
  String userId;

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

}
