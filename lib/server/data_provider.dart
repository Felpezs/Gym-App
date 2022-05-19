import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:prog_mobile/server/routes.dart';

import '../model/user_model.dart';

class FirebaseAuthenticationService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<UserModel?> get user {
    return _firebaseAuth.authStateChanges().map(
          (event) => _userFromFirebaseUser(event),
        );
  }

  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  Future<UserModel?> createUserWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    return _userFromFirebaseUser(user);
  }

  Future<UserModel?> signInWithEmailAndPassword(String email, String password) async{
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    return _userFromFirebaseUser(user);
  }

  /*
  static RestServer helper = RestServer._createInstance();
  RestServer._createInstance();

  final Dio _dio = Dio();

  String prefixUrl = "https://gymapp-6e971-default-rtdb.firebaseio.com";
  String suffixUrl = "/.json";

    Future<int?> insertNewUser(String username, String email, String password) async{
        try{
          Response response = await _dio.post(
            Routes.urlSignUp,
            data: jsonEncode({
              "username": username,
              "email": email,
              "password": password,
              "returnSecureToken": true
            }), 
          );
          return response.statusCode;
        }
        catch (e){
          return 400;
        }
    }
    */
}