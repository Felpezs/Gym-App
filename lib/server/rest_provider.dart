import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:prog_mobile/server/routes.dart';
import '../model/usuario.dart';

class RestServer{
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
}